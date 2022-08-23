import 'package:flutter/material.dart';
import 'package:invoice_app/invoices_pages/provider/invoices_model.dart';
import 'package:invoice_app/invoices_pages/provider/provider.dart';
import 'package:invoice_app/invoices_pages/widgets/widgets.dart';
import 'package:invoice_app/theme_notifier.dart';

class InvoicesPagesDetail extends StatelessWidget {
  const InvoicesPagesDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    ThemeNotifier myTheme = context.read<ThemeNotifier>();

    return Consumer<InvoicesPagesData>(
      builder: (context, state, child) {
        if (index >= state.invoices.length) {
          return Container();
        }
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: const InvoicesPageAppBar(),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    // back button
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: myTheme.normalPadding),
                      // ignore: prefer_const_constructors
                      child: InvoicesPageBackButton(),
                    ),
                    InvoicesPagesCardWrapper(
                      removeTopMargin: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Status',
                          ),
                          InvoicesPagesStatusCard(index: index),
                        ],
                      ),
                    ),
                    InvoicesPagesCardWrapper(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InvoicesPageOrderNumber(
                            index: index,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: textPadding),
                            child: Text(
                              state.invoices[index].description,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: textBlockPadding),
                            child: InvoicesPagesAddress(
                              index: index,
                              isClientAddress: false,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: textBlockPadding),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Invoice Date'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: textBoldPadding),
                                        child: Text(
                                          convertDate(
                                              state.invoices[index].createdat),
                                          style: context
                                              .read<ThemeNotifier>()
                                              .theme
                                              .textTheme
                                              .bodyLarge!,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 32),
                                        child: Text('Payment Due'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: textBoldPadding),
                                        child: Text(
                                          convertDate(
                                              state.invoices[index].paymentdue),
                                          style: context
                                              .read<ThemeNotifier>()
                                              .theme
                                              .textTheme
                                              .bodyLarge!,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Bill To'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: textBoldPadding),
                                        child: Text(
                                          state.invoices[index].clientname,
                                          style: context
                                              .read<ThemeNotifier>()
                                              .theme
                                              .textTheme
                                              .bodyLarge!,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: InvoicesPagesAddress(
                                          index: index,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: textBlockPadding),
                            child: Text('Sent to'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: textBoldPadding),
                            child: Text(
                              state.invoices[index].clientemail,
                              style: context
                                  .read<ThemeNotifier>()
                                  .theme
                                  .textTheme
                                  .bodyLarge!,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                            padding: EdgeInsets.all(myTheme.normalPadding),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              color: Theme.of(context).cardColor,
                            ),
                            child: Column(children: [
                              for (int i = 0;
                                  i < state.invoices[index].items.length;
                                  i++)
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: i ==
                                              state.invoices[index].items
                                                      .length -
                                                  1
                                          ? 0
                                          : myTheme.normalPadding),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Text(
                                              state.invoices[index].items[i]
                                                  .name,
                                              style: context
                                                  .read<ThemeNotifier>()
                                                  .theme
                                                  .textTheme
                                                  .bodyLarge!,
                                            ),
                                          ),
                                          Text(
                                            '${state.invoices[index].items[i].quantity.toString()} x ${state.parseTotal(
                                              state.invoices[index].items[i]
                                                  .price,
                                            )}',
                                            style: context
                                                .read<ThemeNotifier>()
                                                .theme
                                                .textTheme
                                                .bodyLarge!
                                                .merge(
                                                  TextStyle(
                                                    color: textPurpleColor,
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        state.parseTotal(
                                          state.invoices[index].items[i].total,
                                        ),
                                        style: context
                                            .read<ThemeNotifier>()
                                            .theme
                                            .textTheme
                                            .bodyLarge!,
                                      ),
                                    ],
                                  ),
                                ),
                            ]),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
                              color: Theme.of(context).dialogBackgroundColor,
                            ),
                            padding: EdgeInsets.all(myTheme.normalPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Amount Due',
                                  style: context
                                      .read<ThemeNotifier>()
                                      .theme
                                      .textTheme
                                      .bodyMedium!
                                      .merge(
                                        TextStyle(
                                          color: myWhite,
                                        ),
                                      ),
                                ),
                                Text(
                                  state.parseTotal(
                                    state.invoices[index].total,
                                  ),
                                  style: context
                                      .read<ThemeNotifier>()
                                      .theme
                                      .textTheme
                                      .headlineMedium!
                                      .merge(
                                        TextStyle(
                                          color: myWhite,
                                        ),
                                      ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 42,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: myTheme.normalPadding,
                  vertical: 22,
                ),
                color: Theme.of(context).canvasColor,
                child: Row(
                  children: [
                    InvoicesPageButton(
                      text: 'Edit',
                      rightMargin: true,
                      bgColor: Theme.of(context).cardColor,
                      textColor: Theme.of(context).indicatorColor,
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/edit',
                        arguments: InvoicesRouteArguments(
                          index: index,
                          isCreatingNew: false,
                        ),
                      ),
                    ),
                    InvoicesPageButton(
                      text: 'Delete',
                      rightMargin: true,
                      bgColor: const Color.fromRGBO(236, 87, 87, 1),
                      textColor: myWhite,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Theme.of(context).canvasColor,
                            title: Text(
                              'Confirm Deletion',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            content: Text(
                              'Are you sure you want to delete invoice #${state.invoices[index].id}? This action cannot be undone.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            actionsPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            actions: [
                              SizedBox(
                                width: 94 * myTheme.ratio,
                                child: InvoicesPageButton(
                                  text: 'Cancel',
                                  bgColor: Theme.of(context).cardColor,
                                  textColor: Theme.of(context).indicatorColor,
                                  onTap: () => Navigator.pop(context),
                                ),
                              ),
                              SizedBox(
                                width: 94 * myTheme.ratio,
                                child: InvoicesPageButton(
                                  text: 'Delete',
                                  textColor: myWhite,
                                  bgColor: const Color.fromRGBO(236, 87, 87, 1),
                                  onTap: () {
                                    Navigator.popUntil(
                                        context, ModalRoute.withName('/'));
                                    state.invoices.removeAt(index);

                                    state.refresh();
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: InvoicesPageButton(
                        text: 'Mark as Paid',
                        bgColor: Theme.of(context).primaryColor,
                        textColor: myWhite,
                        onTap: () {
                          state.invoices[index].status = 'paid';
                          state.refresh();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
