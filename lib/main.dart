import 'package:flutter/material.dart';
import 'package:sneakers_shop_ui/constants/string_const.dart';
import 'package:sneakers_shop_ui/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.appTitle,
      theme: ThemeData(
        brightness: .light,
        fontFamily: StringConst.appFontFamily
      ),
      routerConfig: router,
      builder: (ctx, child)=> child!,
    );
  }
}