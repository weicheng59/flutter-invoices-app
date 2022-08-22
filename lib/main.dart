import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:invoice_app/theme_notifier.dart';

import 'invoices_pages/invoices_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      // enable 120hz in some android phone
      FlutterDisplayMode.setHighRefreshRate();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return ThemeNotifier(window.physicalSize / window.devicePixelRatio);
          },
        ),
        ChangeNotifierProvider(
          create: (context) => InvoicesPagesData(),
        )
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeNotifier.theme,
            initialRoute: '/',
            routes: {
              '/': (context) => ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: const InvoicesPagesPage(),
                  ),
              '/detail': (context) => ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: const InvoicesPagesDetail(),
                  ),
              '/edit': (context) => ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: const InvoicesPagesEdit(),
                  ),
            },
          );
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
