import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    double normalPadding = context.read<ThemeNotifier>().normalPadding;
    var myTheme = context.read<ThemeNotifier>();

    return Consumer<InvoicesPagesData>(
      builder: (context, state, child) {
        return Column(
          children: [
            // ingoring because of using provider
            // ignore: prefer_const_constructors
            InvoicesHeader(),
            Expanded(
              child: state.invoices.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/illustration-empty.svg',
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, 40, 0, myTheme.normalPadding),
                          child: Text(
                            'There is nothing here',
                            style: myTheme.theme.textTheme.headlineMedium,
                          ),
                        ),
                        SizedBox(
                          width: 210,
                          child: Text(
                            'Create an invoice by clicking the New button and get started',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: state.invoices.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: index != state.invoices.length - 1
                                  ? 0
                                  : 108.0),
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
                              margin: EdgeInsets.symmetric(
                                horizontal: normalPadding,
                                vertical: 8,
                              ),
                              padding: EdgeInsets.all(normalPadding),
                              height: 134,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    padding:
                                        EdgeInsets.only(top: normalPadding),
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
                                              state.parseTotal(
                                                state.invoices[index].total,
                                              ),
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
