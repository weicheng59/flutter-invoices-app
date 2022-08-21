import 'package:flutter/material.dart';
import 'package:invoice_app/invoices_pages/provider/provider.dart';
import 'package:invoice_app/theme_notifier.dart';

class InvoicesPagesStatusCard extends StatelessWidget {
  InvoicesPagesStatusCard({
    super.key,
    required this.index,
  });

  final Color paidColor = const Color.fromRGBO(51, 214, 159, 1);
  final Color pendingColor = const Color.fromRGBO(255, 143, 0, 1);
  Color draftColor = const Color.fromRGBO(55, 59, 83, 1);

  final int index;

  @override
  Widget build(BuildContext context) {
    var state = context.read<InvoicesPagesData>();
    draftColor = Theme.of(context).hintColor;

    return Container(
      width: 104,
      height: 40,
      // round corners
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: getColorFromStatus(
          state.invoices[index].status,
          true,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // dot
            Container(
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  color: getColorFromStatus(
                    state.invoices[index].status,
                    false,
                  ),
                  shape: BoxShape.circle),
              width: 8,
            ),
            Text(
              // to upper case the first letter
              state.invoices[index].status.substring(0, 1).toUpperCase() +
                  state.invoices[index].status.substring(1),
              style: context
                  .read<ThemeNotifier>()
                  .theme
                  .textTheme
                  .bodyLarge!
                  .merge(
                    TextStyle(
                      color: getColorFromStatus(
                        state.invoices[index].status,
                        false,
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  getColorFromStatus(String status, bool isBg) {
    Color color = Colors.red;
    switch (status) {
      case 'paid':
        color = paidColor;
        break;
      case 'pending':
        color = pendingColor;
        break;
      case 'draft':
        color = draftColor;
    }
    return color.withOpacity(isBg ? opacity : 1);
  }
}
