import 'package:flutter/material.dart';
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
    return Container(
      // round corners
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).canvasColor,
      ),
      margin: EdgeInsets.fromLTRB(
        padding,
        removeTopMargin ? 0 : 8,
        padding,
        8,
      ),
      padding: const EdgeInsets.all(padding),
      child: child,
    );
  }
}
