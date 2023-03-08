import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/resource/assets.dart';
import 'package:note_app/utils/utils.dart';
import 'package:note_app/view/note_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoadingPage());
  }

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), toNext);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void toNext() async {
    Navigator.of(context)
        .pushAndRemoveUntil<void>(NotePage.route(), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Theme(
        data: ThemeData(),
        child: Scaffold(
          body: Utils.bkavCheckOrientation(
            context,
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(IconAsset.icLoading),
                  ),
                  Text(DateTime.now().year.toString())
                ],
              ),
            ),
          ),
        ));
  }
}
