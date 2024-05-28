import 'package:flutter/material.dart';

import 'package:avocado/domain/model/district_model.dart';
import 'package:avocado/feature/view/search_district/search_district_view.dart';
import 'package:avocado/feature/widget/show_modal.dart';

void showSelectDistrictModalWidget(
  BuildContext context,
  Function(District selectedDistrict) onSelected,
) {
  showModal(
    context,
    SearchDistrictView(
      onSelected: onSelected,
    ),
  );
}
