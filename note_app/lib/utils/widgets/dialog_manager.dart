import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/resource/color.dart';

import '../../generated/l10n.dart';
import '../../resource/assets.dart';
import '../../resource/style.dart';
import '../../view_model/navigation_service.dart';

///Bkav HoangCV Class chứa các dialog dùng chung cho app
class DiaLogManager {
  static Future<void> displayDialog(
      BuildContext context,
      String title,
      String content,
      VoidCallback onTap,
      VoidCallback cancelCallback,
      String cancel,
      String access,
      {bool dialogComplete = false,
      bool isHaveIcon = false,
      bool? contentHtml,
      Widget? widgetContent,
      bool dismissible = true}) async {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    Get.dialog(
      barrierDismissible: dismissible,
      AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          contentPadding: const EdgeInsets.all(0),
          content: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                isHaveIcon
                    ? Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 24),
                        child: dialogComplete
                            ? SvgPicture.asset(
                                IconAsset.icLoading,
                                width: 48,
                                height: 48,
                              )
                            : SvgPicture.asset(
                                IconAsset.icLoading,
                                width: 48,
                                height: 48,
                              ),
                      )
                    : Container(),
                title == ""
                    ? const SizedBox(
                        height: 16,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                            bottom: 2, right: 15, left: 15, top: 23),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: StyleBkav.textStyleFW400(AppColor.text, 16),
                        ),
                      ),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 16, right: 15, left: 15),
                    child: contentHtml == true
                        ? widgetContent
                        : Text(
                            content,
                            textAlign: TextAlign.center,
                            style: StyleBkav.textStyleFW400(AppColor.text, 16),
                          )),
                const Divider(
                  color: AppColor.text,
                  height: 1.0,
                ),
                InkWell(
                  child: Row(
                    children: [
                      cancel != ""
                          ? Expanded(
                              flex: 1,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  cancelCallback();
                                },
                                child: SizedBox(
                                    height: 52,
                                    child: Center(
                                        child: Text(cancel,
                                            textAlign: TextAlign.center,
                                            style: StyleBkav.textStyleFW600(
                                                AppColor.text, 15)))),
                              ),
                            )
                          : Container(),
                      access != ""
                          ? Expanded(
                              flex: 1,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: onTap,
                                child: SizedBox(
                                    height: 52,
                                    child: Center(
                                        child: Text(access,
                                            textAlign: TextAlign.center,
                                            style: StyleBkav.textStyleFW600(
                                                AppColor.text, 14)))),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  /// HanhNTHe: show dialog "tinh nang dang phat trien"
  static void showDialogDevelopingFeature() {
    // Logger.loggerDebug(" showDialogError "
    //     "1 - ${NavigationService.navigatorKey.currentContext}  - ok $status resultStatus $resultStatus resultObject $resultObject ");
    // Logger.loggerDebug("Loi khi thuc hien mang status $resultStatus, object: $resultObject ");
    displayDialog(
        NavigationService.navigatorKey.currentContext!,
        "",
        S.of(NavigationService.navigatorKey.currentContext!).check_internet,
        () {}, () {
      Get.back();
    }, S.of(NavigationService.navigatorKey.currentContext!).back, "");
    return;
  }

/*
  //Bkav HoangLD dialog hiển thị hoàn thành trên giao diện
  static Future<void> displayCompleteDialog(BuildContext context) async {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    Get.dialog(AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      contentPadding: const EdgeInsets.all(0),
      content: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: SvgPicture.asset(
                IconAsset.icComplete,
                width: 48,
                height: 48,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32, right: 18, left: 18),
              child: Text(
                S.of(context).complete_dialog,
                textAlign: TextAlign.center,
                style: StyleBkav.textStyleBlack14NotOverflow(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
  */

  ///  Bkav HoangCV: show dialog "Vui lòng nhập nội dung ghi chú"
  static void showDialogEnterNoteContent(BuildContext context, String title) {
    DiaLogManager.displayDialog(context, title, "", () {}, () {
      Navigator.of(context).pop();
    }, "", "Đóng");
  }

  ///  Bkav HoangCV: show dialog "Nhap thong tin thanh cong"
  static void showDialogSendInformationSuccess(BuildContext context,
      String title, String dataHtml, VoidCallback acceptCallback) {
    Html html = createHtml(dataHtml, Colors.black);

    DiaLogManager.displayDialog(
        context, title, "", acceptCallback, () {}, "", "OK",
        widgetContent: html, contentHtml: true);
  }

  static void showDialogLoading(BuildContext context) {
    if (Get.isDialogOpen == true) {
      return;
    }
    Get.dialog(Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: const SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    ));
  }

  static Html createHtml(String dataHtml, Color color, {EdgeInsets? padding}) {
    return Html(data: dataHtml, style: {
      "body": Style(
          textAlign: TextAlign.center,
          padding: padding ?? const EdgeInsets.only(top: 14),
          fontSize: FontSize(16),
          color: color,
          fontWeight: FontWeight.w400)
    });
  }
}
