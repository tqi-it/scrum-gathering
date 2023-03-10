import 'package:flutter/material.dart';
import 'package:mentorme/app/shared/services/navigator/navigation_service.dart';
import 'package:mentorme/app/shared/theme/dimens.dart';

class MentorMeBottomSheet {
  static bool isBottomSheetOpened = false;

  static Future show({
    required final Widget content,
    final bool? isDismissible,
    required final String title,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    await Future.delayed(const Duration(milliseconds: 500));
    if (!isBottomSheetOpened) {
      return showModalBottomSheet<void>(
        isDismissible: isDismissible ?? false,
        isScrollControlled: true,
        context: NavigationService.navigatorKey.currentContext!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        builder: (BuildContext context) {
          isBottomSheetOpened = true;
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEBF0FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  content,
                ],
              ),
            ),
          );
        },
      ).then((value) {
        Future.delayed(const Duration(seconds: 1), () {
          isBottomSheetOpened = false;
        });
      });
    }
  }

  static showListFilter({
    final bool? isDismissible,
    required final String title,
    required final List<String> list,
    required final Function(List<String> selectedFilters) onTapFirstButton,
  }) {
    List<String> selections = [];

    return show(
      title: title,
      isDismissible: isDismissible,
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter newState) {
          return Container(
            height: MediaQuery.of(context).size.height * .7,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        'Limpar',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0XFF0497E3)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.grey),
                Column(
                  children: list
                      .map((e) => Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e),
                                    InkWell(
                                      onTap: () {
                                        newState(() {
                                          if (selections.contains(e)) {
                                            selections.remove(e);
                                          } else {
                                            selections.add(e);
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: selections.contains(e) ? Colors.pink : Colors.transparent,
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: selections.contains(e)
                                            ? const Icon(
                                                Icons.check_sharp,
                                                color: Colors.white,
                                              )
                                            : Container(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(color: Colors.grey),
                            ],
                          ))
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
