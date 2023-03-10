import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
///Bkav HoangCV: custom lại Appbar dùng chung cho cả App
class CustomAppBar extends AppBar {
  final BuildContext context;

  static Widget defaultBackButton(BuildContext context, Color color) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context).pop();
        },
        color: Colors.black,
        padding: EdgeInsets.zero,
      ),
    );
  }

  CustomAppBar(
      this.context, {
        required bool showDefaultBackButton,
        bool hasBottom=false,
        bool centerTitle = false,
        double toolbarHeight = 56,
        double elevation = 0,
        Key? key,
        Widget? leading,
        bool automaticallyImplyLeading = false,
        Widget? title,
        List<Widget>? actions,
        Widget? flexibleSpace,
        PreferredSizeWidget? bottom,
        Color? shadowColor,
        ShapeBorder? shape,
        Color? backgroundColor,
        Color? foregroundColor,
        Brightness? brightness,
        IconThemeData? iconTheme,
        IconThemeData? actionsIconTheme,
        TextTheme? textTheme,
        bool primary = true,
        bool excludeHeaderSemantics = false,
        double? titleSpacing,
        double toolbarOpacity = 1.0,
        // double bottomOpacity = 0.5,
        double? leadingWidth = 24,
        bool? backwardsCompatibility,
        TextStyle? toolbarTextStyle,
        TextStyle? titleTextStyle,
        SystemUiOverlayStyle? systemOverlayStyle = SystemUiOverlayStyle.dark,
      }) : super(
      key: key,
      leading:
      showDefaultBackButton ? defaultBackButton(context, backgroundColor??Color(0xfff5f5f5)) : leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      actions: actions,
      flexibleSpace: flexibleSpace,
      bottom:bottom,
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      backgroundColor: backgroundColor,
      // foregroundColor: foregroundColor,
      //brightness: brightness,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      primary: primary,
      centerTitle: centerTitle,
      excludeHeaderSemantics: excludeHeaderSemantics,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
      //bottomOpacity: bottomOpacity,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      toolbarTextStyle: toolbarTextStyle,
      titleTextStyle: titleTextStyle,
      systemOverlayStyle:
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark
      )
  );
}
