import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:avocado/config/text_theme.dart';

class SearchDistrictHeaderWidget extends StatelessWidget {
  const SearchDistrictHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: Text(
                '지역 검색',
                style: context.textThemeBodyMedium
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        Positioned(
            child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: SvgPicture.asset('assets/icons/arrow_left.svg'))),
      ],
    );
  }
}
