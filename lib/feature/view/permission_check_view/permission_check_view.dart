import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/feature/view/permission_check_view/private_widget/confirm_button_widget.dart';

class PermissionCheckView extends HookWidget {
  const PermissionCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset('assets/icons/umbrella.svg'),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 64),
                  child: Text(
                    '우산 챙김 알림 서비스 ‘비오니\n사용을 위해 다음 권한의 허용이 필요해요.',
                    textAlign: TextAlign.center,
                    style: context.textThemeTitleSmall.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/icons/pin.svg'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(
                                    '위치',
                                    style: context.textThemeBodyMedium.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '비 예보 설정 지역 검색 시 사용',
                            style: context.textThemeBodyMedium.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AvocadoColors.grey01,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/icons/bell.svg'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(
                                    '알림',
                                    style: context.textThemeBodyMedium.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '우산 챙김 푸시 알림 전송 시 사용',
                            style: context.textThemeBodySmall.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AvocadoColors.grey01,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    children: [
                      Text(
                        '· 허용하지 않을 시 비오니 서비스 이용에 제한이 있을 수 있어요.',
                        style: context.textThemeLabelMedium.copyWith(
                          color: AvocadoColors.grey03,
                        ),
                      ),
                      Text(
                        '· ‘설정 > 비오니’ 에서 언제든지 허용 여부를 변경할 수 있어요.',
                        style: context.textThemeLabelMedium.copyWith(
                          color: AvocadoColors.grey03,
                        ),
                      ),
                    ],
                  ),
                ),
                const ConfirmButtonWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
