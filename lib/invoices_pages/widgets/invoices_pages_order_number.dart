import 'package:flutter/material.dart';
import 'package:invoice_app/theme_notifier.dart';
import 'package:invoice_app/invoices_pages/provider/provider.dart';

class InvoicesPageOrderNumber extends StatelessWidget {
  const InvoicesPageOrderNumber({
    super.key,
    required this.index,
    this.prefixText = '',
    this.textStyle,
  });

  final int index;
  final String prefixText;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    var state = context.read<InvoicesPagesData>();
    TextStyle textStyle = this.textStyle ??
        context.read<ThemeNotifier>().theme.textTheme.bodyLarge!;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: prefixText,
            style: textStyle,
          ),
          TextSpan(
            text: '#',
            style: textStyle.merge(
              TextStyle(color: textPurpleColor),
            ),
          ),
          TextSpan(
            text: state.invoices[index].id.toString(),
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
