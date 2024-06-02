import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/text_theme.dart';
import 'package:avocado/domain/model/district_model.dart';
import 'package:avocado/feature/view_model/search_district_view_model.dart';

class DistrictListWidget extends ConsumerWidget {
  final Function(District selectedDistrict) onSelect;

  const DistrictListWidget({
    required this.onSelect,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<District> districts =
        ref.watch(searchDistrictViewModelProvider).districts;

    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            districts.length,
            (index) => GestureDetector(
              onTap: () {
                onSelect(districts[index]);
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  districts[index].streetNameAddress,
                  style: context.textThemeBodyMedium,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
