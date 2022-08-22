import 'package:flutter/material.dart';
import 'package:invoice_app/invoices_pages/provider/provider.dart';
import 'package:invoice_app/theme_notifier.dart';

class InvoicesPagesCardWrapper extends StatelessWidget {
  const InvoicesPagesCardWrapper({
    super.key,
    required this.child,
    this.removeTopMargin = false,
  });

  final Widget child;
  final bool removeTopMargin;

  @override
  Widget build(BuildContext context) {
    double normalPadding = context.read<ThemeNotifier>().normalPadding;

    return Container(
      // round corners
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).canvasColor,
      ),
      margin: EdgeInsets.fromLTRB(
        normalPadding,
        removeTopMargin ? 0 : 8,
        normalPadding,
        8,
      ),
      padding: EdgeInsets.all(normalPadding),
      child: child,
    );
  }
}
