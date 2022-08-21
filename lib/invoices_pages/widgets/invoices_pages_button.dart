import 'package:flutter/material.dart';
import 'package:invoice_app/invoices_pages/provider/provider.dart';
import 'package:invoice_app/theme_notifier.dart';

class InvoicesPageButton extends StatelessWidget {
  const InvoicesPageButton({
    Key? key,
    required this.text,
    this.rightMargin = false,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.onTap,
  }) : super(key: key);

  final String text;
  final bool rightMargin;
  final Color bgColor, textColor;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          color: bgColor,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: padding,
          vertical: 16,
        ),
        margin: EdgeInsets.only(right: rightMargin ? 8 : 0),
        child: Text(
          text,
          style: context.read<ThemeNotifier>().theme.textTheme.bodyLarge!.merge(
                TextStyle(
                  color: textColor,
                ),
              ),
        ),
      ),
    );
  }
}
