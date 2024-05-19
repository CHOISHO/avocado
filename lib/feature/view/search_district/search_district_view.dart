import 'package:flutter/material.dart';

import 'package:avocado/domain/model/district_model.dart';
import 'package:avocado/feature/view/search_district/private_widget/district_list_widget.dart';
import 'package:avocado/feature/view/search_district/private_widget/search_bar_widget.dart';
import 'package:avocado/feature/view/search_district/private_widget/search_district_header_widget.dart';

class SearchDistrictView extends StatelessWidget {
  final Function(District selectedDistrict) onSelected;

  const SearchDistrictView({
    required this.onSelected,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchDistrictHeaderWidget(),
            const SearchBarWidget(),
            DistrictListWidget(onSelect: onSelected),
          ],
        ),
      ),
    );
  }
}
