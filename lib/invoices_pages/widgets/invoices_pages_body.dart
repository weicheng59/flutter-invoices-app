import 'package:flutter/material.dart';
import 'package:invoice_app/invoices_pages/provider/provider.dart';
import 'package:invoice_app/invoices_pages/widgets/invoices_pages_header.dart';
import 'package:invoice_app/invoices_pages/widgets/invoices_pages_status_card.dart';

import '../../theme_notifier.dart';
import 'invoices_pages_order_number.dart';

/// {@template invoices_pages_body}
/// Body of the InvoicesPagesPage.
///
/// Add what it does
/// {@endtemplate}
class InvoicesPagesBody extends StatelessWidget {
  /// {@macro invoices_pages_body}
  ///
  const InvoicesPagesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = context.read<InvoicesPagesData>();

    return Consumer<InvoicesPagesData>(
      builder: (context, state, child) {
        return Column(
          children: [
            // ingoring because of using provider
            // ignore: prefer_const_constructors
            InvoicesHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: state.invoices.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: index != state.invoices.length - 1 ? 0 : 108.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: index);
                      },
                      child: Container(
                        // round corners
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).canvasColor,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: padding,
                          vertical: 8,
                        ),
                        padding: const EdgeInsets.all(padding),
                        height: 134,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InvoicesPageOrderNumber(index: index),
                                Text(
                                  state.invoices[index].clientname,
                                  style: context
                                      .read<ThemeNotifier>()
                                      .theme
                                      .textTheme
                                      .bodyMedium!,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: padding),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Due  ${convertDate(state.invoices[index].paymentdue)}',
                                        style: context
                                            .read<ThemeNotifier>()
                                            .theme
                                            .textTheme
                                            .bodyMedium!,
                                      ),
                                      Text(
                                        // add comma to separate thousands
                                        parseTotal(state.invoices[index].total),
                                        style: context
                                            .read<ThemeNotifier>()
                                            .theme
                                            .textTheme
                                            .headlineSmall!,
                                      )
                                    ],
                                  ),
                                  InvoicesPagesStatusCard(index: index),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
