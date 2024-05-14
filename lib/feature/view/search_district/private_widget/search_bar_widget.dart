import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/feature/view_model/search_district_view_model.dart';

class SearchBarWidget extends HookConsumerWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer? timer;

    return Column(
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
                  onChanged: (String value) {
                    if (timer?.isActive ?? false) timer?.cancel();

                    timer = Timer(
                      const Duration(milliseconds: 1000),
                      () async {
                        await ref
                            .read(searchDistrictViewModelProvider.notifier)
                            .searchDistricts(value);
                      },
                    );
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '지역을 입력해 주세요.',
                    hintStyle: context.textThemeBody1.copyWith(
                      color: AvocadoColors.grey04,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
