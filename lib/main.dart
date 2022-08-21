import 'package:flutter/material.dart';
import 'package:invoice_app/theme_notifier.dart';

import 'invoices_pages/invoices_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeNotifier(),
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
