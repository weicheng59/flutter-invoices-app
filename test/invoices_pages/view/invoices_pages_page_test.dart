// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoice_app/invoices_pages/invoices_pages.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InvoicesPagesPage', () {
    group('route', () {
      test('is routable', () {
        expect(InvoicesPagesPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders InvoicesPagesView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: InvoicesPagesPage()));
      expect(find.byType(InvoicesPagesView), findsOneWidget);
    });
  });
}
