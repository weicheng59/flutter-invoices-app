import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_app/invoices_pages/provider/provider.dart';
import 'package:invoice_app/theme_notifier.dart';

class InvoicesPageBackButton extends StatelessWidget {
  const InvoicesPageBackButton({
    Key? key,
    this.extraPadding = true,
  }) : super(key: key);

  final bool extraPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 32, 0, extraPadding ? 32 : 24),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: padding,
              ),
              child: SvgPicture.asset(
                'assets/images/icon-arrow-left.svg',
              ),
            ),
            Text(
              'Go Back',
              style: context.read<ThemeNotifier>().theme.textTheme.bodyLarge!,
            ),
          ],
        ),
      ),
    );
  }
}
