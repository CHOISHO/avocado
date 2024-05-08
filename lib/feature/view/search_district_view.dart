import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/text_theme.dart';

class SearchDistrictView extends HookConsumerWidget {
  const SearchDistrictView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        padding: const EdgeInsets.only(top: 6),
        height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
        child: Stack(
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
            Positioned(child: IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/arrow_left.svg')))
          ],
        ));
  }
}
