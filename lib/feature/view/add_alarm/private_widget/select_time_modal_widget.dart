import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';

void showSelectTimeModalWidget(BuildContext context) {
  showModalBottomSheet(
    context: context,
    clipBehavior: Clip.hardEdge,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
    ),
    builder: (BuildContext context) => const SelectTimeModalWidget(),
  );
}

class SelectTimeModalWidget extends StatelessWidget {
  const SelectTimeModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
      ),
      height: 300,
      child: Column(
        children: [
          Container(
            height: 216,
            padding: const EdgeInsets.only(top: 6.0),
            child: CupertinoPicker(
              itemExtent: 32,
              onSelectedItemChanged: (index) {
                // TODO: 날짜 선택 로직
              },
              children: List.generate(
                24,
                (index) => Text(
                  '${(index).toString().padLeft(2, '0')} : 00',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {},
              child: Ink(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AvocadoColors.main, AvocadoColors.sub],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AvocadoColors.black.withOpacity(0.16),
                      blurRadius: 12,
                      spreadRadius: 0,
                      offset: const Offset(0, 0),
                    ),
                    BoxShadow(
                      color: AvocadoColors.black.withOpacity(0.08),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: const Offset(4, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                  color: AvocadoColors.mainLight,
                ),
                child: Center(
                  child: Text(
                    '선택 완료',
                    style: context.textThemeTitle2.copyWith(
                      color: AvocadoColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
