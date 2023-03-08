import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/resource/color.dart';
import 'package:note_app/view/note_page.dart';
import 'package:note_app/view_model/movie/note_bloc.dart';
import 'package:note_app/view_model/navigation_service.dart';

import 'data/repository.dart';
import 'data/repository_impl.dart';
import 'generated/l10n.dart';
import 'loading_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Repository repository;

  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    repository = RepositoryImpl(context: context);
    // Tạm thời tắt chế độ xoay ngang màn hình
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return RepositoryProvider.value(
      value: repository,
      child: BlocProvider(
        create: (_) => NoteBloc(repository: repository),
        child: MaterialApp(
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.black),
                    color: Color(0xfff5f5f5))),
            home: const LoadingPage()),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
/*


class _NoteView extends StatefulWidget {
  @override
  State<_NoteView> createState() => _AIBookState();
}

class _AIBookState extends State<_NoteView> {
  final _navigatorKey = NavigationService.navigatorKey;

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void initState() {
    // context.read<Repository>().updateTokenFirebase();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
            primaryColor: AppColor.background,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: AppColor.background
            )
        ),
        supportedLocales: S.delegate.supportedLocales,
        builder: (context, child) {
          return BlocListener<NoteBloc, NoteState>(
              listener: (context, state) async {
          */
/*      SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
                String token = sharedPreferences.getString(SharedPreferencesKey.accessToken) ?? "";
                bool isKeepLogin= sharedPreferences.getBool(SharedPreferencesKey.isRemember)?? true;*//*

                switch (state.status) {
                  case AuthenticationStatus.authenticated:
                    _navigator.pushAndRemoveUntil<void>(
                        await HomePage.route(), (route) => false);
                    break;
                  case AuthenticationStatus.unauthenticated:

                      _navigator.pushAndRemoveUntil<void>(
                          await NotePage.route(), (route) => false);

                    break;
                  default:
                    break;
                }
              },
              child: child);
        },
        onGenerateRoute: (_) => LoadingPage.route()
    );
  }
}*/
