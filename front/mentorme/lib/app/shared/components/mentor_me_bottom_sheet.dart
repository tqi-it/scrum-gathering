import 'package:flutter/material.dart';
import 'package:mentorme/app/shared/components/mentor_me_button.dart';
import 'package:mentorme/app/shared/services/navigator/navigation_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

  static showListFilter(
      {final bool? isDismissible,
      required final String title,
      required final List<String> list,
      required final Function(List<String> selectedFilters) onTap}) {
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
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          newState(() {
                            selections.clear();
                          });
                        },
                        child: const Text(
                          'Limpar',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF0497E3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.grey),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: list
                                  .map(
                                    (e) => Column(
                                      children: [
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
                                                        color: selections.contains(e) ? Colors.pink : Colors.grey,
                                                      ),
                                                    ),
                                                    child: selections.contains(e)
                                                        ? const Icon(
                                                      Icons.check_sharp,
                                                      color: Colors.white,
                                                      size: 18,
                                                    )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        list.last != e ? const Divider(color: Colors.grey) : Container(),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        MentorMeButton(
                          label: 'Salvar',
                          isActive: true,
                          radius: 6,
                          height: 50,
                          onPressed: () {
                            onTap(selections);
                            Modular.to.pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
