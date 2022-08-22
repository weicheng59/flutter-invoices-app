import 'package:flutter/material.dart';
import 'package:invoice_app/invoices_pages/widgets/invoices_pages_body.dart';

import '../widgets/invoices_pages_app_bar.dart';

/// {@template invoices_pages_page}
/// A description for InvoicesPagesPage
/// {@endtemplate}
class InvoicesPagesPage extends StatelessWidget {
  /// {@macro invoices_pages_page}
  const InvoicesPagesPage({Key? key}) : super(key: key);

  /// The static route for InvoicesPagesPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        builder: (_) => const InvoicesPagesPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const InvoicesPageAppBar(),
      // ignore: prefer_const_constructors
      body: InvoicesPagesView(),
    );
  }
}

/// {@template invoices_pages_view}
/// Displays the Body of InvoicesPagesView
/// {@endtemplate}
class InvoicesPagesView extends StatelessWidget {
  /// {@macro invoices_pages_view}
  const InvoicesPagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return InvoicesPagesBody();
  }
}
