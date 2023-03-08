import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constans/api_const.dart';

class Utils {

  ///HoangCV : hiệu ứng chuyển giữa các page khác nhau
  static Route pageRouteBuilder(Widget widget, bool transitions) {
    if (transitions) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1, 0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    } else {
      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => widget);
    }
  }

  static Widget bkavCheckOrientation(BuildContext context, Widget child) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Container(child: child)
        : SafeArea(
      top: false,
      child: child,
    );
  }

  ///HoangCV: convert time sang dang year
  static String convertTime(String time) {
    return time.split('-')[0];
  }

  ///HoangCV: convert time sang dang year
  static String convertUrlImage(String url) {
    return ApiConst.domainImage + url;
  }

  static String formatDateToString(DateTime time) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(time);
  }

}
