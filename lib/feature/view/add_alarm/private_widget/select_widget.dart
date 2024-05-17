import 'package:flutter/material.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';

class SelectWidget extends StatelessWidget {
  final String label;
  final String value;
  final String hintText;
  final Function onTap;

  const SelectWidget({
    required this.label,
    required this.value,
    required this.hintText,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              label,
              style: context.textThemeBody2.copyWith(
                color: AvocadoColors.grey02,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Ink(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: AvocadoColors.grey05,
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () {
                onTap();
              },
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: value.isEmpty
                    ? Text(
                        hintText,
                        style: context.textThemeBody1.copyWith(
                          color: AvocadoColors.grey04,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Text(
                        value,
                        style: context.textThemeBody1.copyWith(
                          color: AvocadoColors.main,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
