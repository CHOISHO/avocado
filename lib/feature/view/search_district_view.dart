import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';

class SearchDistrictView extends HookConsumerWidget {
  const SearchDistrictView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(top: 6),
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 9.0),
                    child: Text(
                      '지역 검색',
                      style: context.textThemeBody1.copyWith(fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              Positioned(child: IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/arrow_left.svg'))),
            ],
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 16, right: 16),
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: AvocadoColors.grey05,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/search.svg'),
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: AvocadoColors.main,
                        cursorWidth: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '지역을 입력해 주세요.',
                          hintStyle: context.textThemeBody1.copyWith(
                            color: AvocadoColors.grey04,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
