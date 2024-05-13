import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/text_theme.dart';
import 'package:avocado/domain/model/district_model.dart';
import 'package:avocado/feature/view/search_district/private_widget/search_bar_widget.dart';
import 'package:avocado/feature/view/search_district/private_widget/search_district_header_widget.dart';
import 'package:avocado/feature/view_model/search_district_view_model.dart';

class SearchDistrictView extends HookConsumerWidget {
  const SearchDistrictView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<District> districts =
        ref.watch(searchDistrictViewModelProvider).districts;

    return Container(
      padding: const EdgeInsets.only(top: 6),
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top,
      child: Scaffold(
        body: Column(
          children: [
            const SearchDistrictHeaderWidget(),
            const SearchBarWidget(),

            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    districts.length,
                    (index) => Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        districts[index].streetAddress,
                        style: context.textThemeBody1,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // FutureBuilder(future: districts, builder: builder)
          ],
        ),
      ),
    );
  }
}
