// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoice_app/invoices_pages/invoices_pages.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InvoicesPagesBody', () {
    testWidgets('renders Text', (tester) async {
      await tester.pumpWidget(
        Provider(
          create: (context) =>
              ChangeNotifierProvider(create: (_) => InvoicesPagesData()),
          child: MaterialApp(home: InvoicesPagesBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
