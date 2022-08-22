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
    double normalPadding = context.read<ThemeNotifier>().normalPadding;

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(0, 32, 0, extraPadding ? 32 : normalPadding),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: normalPadding,
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
