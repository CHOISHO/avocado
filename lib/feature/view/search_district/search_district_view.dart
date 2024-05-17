import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/feature/view/search_district/private_widget/district_list_widget.dart';
import 'package:avocado/feature/view/search_district/private_widget/search_bar_widget.dart';
import 'package:avocado/feature/view/search_district/private_widget/search_district_header_widget.dart';

class SearchDistrictView extends HookConsumerWidget {
  const SearchDistrictView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        padding: const EdgeInsets.only(top: 6),
        height: MediaQuery.sizeOf(context).height -
            MediaQuery.paddingOf(context).top,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchDistrictHeaderWidget(),
            SearchBarWidget(),
            DistrictListWidget(),
          ],
        ),
      ),
    );
  }
}
