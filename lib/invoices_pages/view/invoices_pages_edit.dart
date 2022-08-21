import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_app/invoices_pages/provider/provider.dart';
import 'package:invoice_app/invoices_pages/widgets/widgets.dart';
import 'package:invoice_app/theme_notifier.dart';

import '../provider/invoices_model.dart';

class InvoicesPagesEdit extends StatefulWidget {
  const InvoicesPagesEdit({super.key});

  @override
  State<InvoicesPagesEdit> createState() => _InvoicesPagesEditState();
}

class _InvoicesPagesEditState extends State<InvoicesPagesEdit> {
  int index = 0;
  late InvoicesPagesData state;
  List<Invoice> invoices = [];

  @override
  void initState() {
    state = context.read<InvoicesPagesData>();
    for (var inv in state.invoices) {
      var a = jsonDecode(inv.toString());
      invoices.add(Invoice.fromJson(a));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // local copy of invoice
    index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const InvoicesPageAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: padding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // back button
                        // ignore: prefer_const_constructors
                        InvoicesPageBackButton(
                          extraPadding: false,
                        ),
                        InvoicesPageOrderNumber(
                          index: index,
                          prefixText: 'Edit ',
                          textStyle: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: padding),
                          child: Text(
                            'Bill from',
                            style: Theme.of(context).textTheme.bodyLarge!.merge(
                                  TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                          ),
                        ),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InvoicesPageTextField(
                                labelText: 'Street Address',
                                controller: TextEditingController(
                                  text: invoices[index].clientaddress.street,
                                ),
                                onChanged: ((p0) {
                                  invoices[index].clientaddress.street = p0;
                                }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: padding),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InvoicesPageTextField(
                                        labelText: 'City',
                                        controller: TextEditingController(
                                          text: invoices[index]
                                              .clientaddress
                                              .city,
                                        ),
                                        onChanged: ((p0) {
                                          invoices[index].clientaddress.city =
                                              p0;
                                        }),
                                      ),
                                    ),
                                    const SizedBox(width: padding),
                                    Expanded(
                                      child: InvoicesPageTextField(
                                        labelText: 'Post Code',
                                        controller: TextEditingController(
                                          text: invoices[index]
                                              .clientaddress
                                              .postcode,
                                        ),
                                        onChanged: ((p0) {
                                          invoices[index]
                                              .clientaddress
                                              .postcode = p0;
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: InvoicesPageTextField(
                                  labelText: 'Country',
                                  controller: TextEditingController(
                                    text: invoices[index].clientaddress.country,
                                  ),
                                  onChanged: ((p0) {
                                    invoices[index].clientaddress.country = p0;
                                  }),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: padding),
                                child: Text(
                                  'Bill to',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .merge(
                                        TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                ),
                              ),
                              InvoicesPageTextField(
                                labelText: 'Client\'s Name',
                                controller: TextEditingController(
                                  text: invoices[index].clientname,
                                ),
                                onChanged: ((p0) {
                                  invoices[index].clientname = p0;
                                }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: padding),
                                child: InvoicesPageTextField(
                                  labelText: 'Client\'s Email',
                                  controller: TextEditingController(
                                    text: invoices[index].clientemail,
                                  ),
                                  onChanged: ((p0) {
                                    invoices[index].clientemail = p0;
                                  }),
                                ),
                              ),
                              InvoicesPageTextField(
                                labelText: 'Street Address',
                                controller: TextEditingController(
                                  text: invoices[index].senderaddress.street,
                                ),
                                onChanged: ((p0) {
                                  invoices[index].senderaddress.street = p0;
                                }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: padding),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InvoicesPageTextField(
                                        labelText: 'City',
                                        controller: TextEditingController(
                                          text: invoices[index]
                                              .senderaddress
                                              .city,
                                        ),
                                        onChanged: ((p0) {
                                          invoices[index].senderaddress.city =
                                              p0;
                                        }),
                                      ),
                                    ),
                                    const SizedBox(width: padding),
                                    Expanded(
                                      child: InvoicesPageTextField(
                                        labelText: 'Post Code',
                                        controller: TextEditingController(
                                          text: invoices[index]
                                              .senderaddress
                                              .postcode,
                                        ),
                                        onChanged: ((p0) {
                                          invoices[index]
                                              .senderaddress
                                              .postcode = p0;
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 40.0),
                                child: InvoicesPageTextField(
                                  labelText: 'Country',
                                  controller: TextEditingController(
                                    text: invoices[index].senderaddress.country,
                                  ),
                                  onChanged: ((p0) {
                                    invoices[index].senderaddress.country = p0;
                                  }),
                                ),
                              ),

                              // date picker
                              Padding(
                                padding: const EdgeInsets.only(bottom: padding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        'Invoice Date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .merge(TextStyle(
                                              color: Theme.of(context)
                                                  .selectedRowColor
                                                  .withOpacity(0.5),
                                            )),
                                      ),
                                    ),

                                    // disabled date picker
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .selectedRowColor
                                              .withOpacity(0.5),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          4,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      height: 48,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            convertDate(state
                                                .invoices[index].createdat),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .merge(
                                                  TextStyle(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .color!
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                          ),
                                          SvgPicture.asset(
                                            'assets/images/icon-calendar.svg',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // term picker
                              Padding(
                                padding: const EdgeInsets.only(bottom: padding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Text('Payment Terms',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!),
                                    ),
                                    // disabled date picker
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .selectedRowColor,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          4,
                                        ),
                                        color: Theme.of(context).canvasColor,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      height: 48,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'Net ${invoices[index].paymentterms.toString()} Days',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!),
                                          SvgPicture.asset(
                                            'assets/images/icon-arrow-down.svg',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 40.0),
                                child: InvoicesPageTextField(
                                  labelText: 'Project Description',
                                  controller: TextEditingController(
                                    text: invoices[index].description,
                                  ),
                                  onChanged: ((p0) {
                                    invoices[index].description = p0;
                                  }),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(bottom: padding),
                                child: Text(
                                  'Item List',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .merge(
                                        const TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromRGBO(119, 127, 152, 1),
                                        ),
                                      ),
                                ),
                              ),

                              Column(
                                children: [
                                  for (var i = 0;
                                      i < invoices[index].items.length;
                                      i++)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 48.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: padding),
                                            child: InvoicesPageTextField(
                                              labelText: 'Item Name',
                                              controller: TextEditingController(
                                                text: invoices[index]
                                                    .items[i]
                                                    .name,
                                              ),
                                              onChanged: ((p0) {
                                                invoices[index].items[i].name =
                                                    p0;
                                              }),
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 64,
                                                child: InvoicesPageTextField(
                                                  labelText: 'Qty.',
                                                  controller:
                                                      TextEditingController(
                                                    text: invoices[index]
                                                        .items[i]
                                                        .quantity
                                                        .toString(),
                                                  ),
                                                  onChanged: (p0) {
                                                    int? qty = int.tryParse(p0);
                                                    if (qty != null) {
                                                      setState(() {
                                                        invoices[index]
                                                            .items[i]
                                                            .quantity = qty;
                                                        invoices[index]
                                                                .items[i]
                                                                .total =
                                                            qty *
                                                                invoices[index]
                                                                    .items[i]
                                                                    .price;
                                                        invoices[index].total =
                                                            invoices[index]
                                                                .items
                                                                .map((e) =>
                                                                    e.total)
                                                                .reduce(
                                                                    (a, b) =>
                                                                        a + b);
                                                      });
                                                    }
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: SizedBox(
                                                  width: 100,
                                                  child: InvoicesPageTextField(
                                                    labelText: 'Price',
                                                    controller:
                                                        TextEditingController(
                                                      text: parseTotal(
                                                          invoices[index]
                                                              .items[i]
                                                              .price),
                                                    ),
                                                    onChanged: (p0) {
                                                      p0.replaceAll(',', '');

                                                      double? price =
                                                          double.tryParse(p0);
                                                      if (price != null) {
                                                        setState(() {
                                                          invoices[index]
                                                              .items[i]
                                                              .price = price;
                                                          invoices[index]
                                                              .items[i]
                                                              .total = invoices[
                                                                      index]
                                                                  .items[i]
                                                                  .quantity *
                                                              invoices[index]
                                                                  .items[i]
                                                                  .price;
                                                          invoices[index]
                                                                  .total =
                                                              invoices[index]
                                                                  .items
                                                                  .map((e) =>
                                                                      e.total)
                                                                  .reduce((a,
                                                                          b) =>
                                                                      a + b);
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: padding),
                                                      child: Text(
                                                        'Total',
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          parseTotal(
                                                              invoices[index]
                                                                  .items[i]
                                                                  .total,
                                                              showCurrency:
                                                                  false),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .merge(
                                                                    const TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          133,
                                                                          139,
                                                                          178,
                                                                          1),
                                                                    ),
                                                                  ),
                                                        ),
                                                        SvgPicture.asset(
                                                          'assets/images/icon-delete.svg',
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                ],
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    24,
                                  ),
                                  color: Theme.of(context).cardColor,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                margin: const EdgeInsets.only(bottom: padding),
                                height: 48,
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  '+ Add New Item',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .merge(
                                        const TextStyle(
                                          color:
                                              Color.fromRGBO(133, 139, 178, 1),
                                        ),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 64,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromRGBO(0, 0, 0, 0.0001),
                          Color.fromRGBO(0, 0, 0, 0.1),
                        ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: padding,
              vertical: 22,
            ),
            color: Theme.of(context).canvasColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InvoicesPageButton(
                  text: 'Cancel',
                  rightMargin: true,
                  bgColor: Theme.of(context).cardColor,
                  textColor: Theme.of(context).indicatorColor,
                  onTap: () => Navigator.pop(context),
                ),
                InvoicesPageButton(
                  text: 'Save Changes',
                  bgColor: Theme.of(context).primaryColor,
                  textColor: myWhite,
                  onTap: () {
                    state.invoices = invoices;
                    state.refresh();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
