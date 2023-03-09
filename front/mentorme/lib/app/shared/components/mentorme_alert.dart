import 'package:flutter/material.dart';
import 'package:mentorme/app/shared/components/mentor_me_button.dart';
import 'package:mentorme/app/shared/services/navigator/navigation_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorme/app/shared/theme/dimens.dart';
import 'package:mentorme/app/shared/theme/theme_colors.dart';

class MentorMeAlerts {
  static Future showInfo({
    required final String title,
    required final String description,
    final List<MentorMeButton>? buttons,
    final double? alertHeight = 217,
    final bool? disableHeight = false,
    final bool? isDismissible,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    await showDialog(
      context: NavigationService.navigatorKey.currentState!.context,
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: disableHeight! ? null : alertHeight,
              margin: EdgeInsets.only(
                left: ThemeDimens.xLargeSpace,
                right: ThemeDimens.xLargeSpace,
              ),
              padding: EdgeInsets.only(
                left: ThemeDimens.xRegularSpace,
                right: ThemeDimens.xRegularSpace,
                bottom: ThemeDimens.mediumSpace,
                top: ThemeDimens.xRegularSpace,
              ),
              decoration: const BoxDecoration(
                color: ThemeColors.backgroundColour,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: ThemeDimens.mediumSpace),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: ThemeDimens.largeSpace),
                  buttons != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: buttons
                              .map(
                                (e) => Flexible(
                                  child: Container(
                                    margin: EdgeInsets.only(right: e == buttons.last ? 0 : ThemeDimens.smallSpace),
                                    child: e,
                                  ),
                                ),
                              )
                              .toList())
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
