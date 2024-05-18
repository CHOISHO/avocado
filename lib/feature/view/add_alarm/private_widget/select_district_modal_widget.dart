import 'package:flutter/material.dart';

import 'package:avocado/feature/view/search_district/search_district_view.dart';

void showSelectDistrictModalWidget(
    BuildContext context, Function(String selectedDistrict) onSelected) {
  showModalBottomSheet(
    context: context,
    clipBehavior: Clip.hardEdge,
    enableDrag: false,
    isDismissible: false,
    isScrollControlled: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
    ),
    builder: (BuildContext context) => SearchDistrictView(
      onSelected: onSelected,
    ),
  );
}
