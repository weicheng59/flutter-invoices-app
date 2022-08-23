import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_app/invoices_pages/provider/invoices_model.dart';
import 'package:invoice_app/theme_notifier.dart';

import '../provider/provider.dart';

class InvoicesHeader extends StatelessWidget {
  const InvoicesHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double normalPadding = context.read<ThemeNotifier>().normalPadding;
    InvoicesPagesData state = context.read<InvoicesPagesData>();
    int invoiceCount = state.invoices.length;

    return Padding(
      padding: EdgeInsets.all(normalPadding),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  'Invoices',
                  style: context
                      .read<ThemeNotifier>()
                      .theme
                      .textTheme
                      .headlineMedium!,
                ),
              ),
              Text(
                invoiceCount == 0 ? 'No invoices' : '$invoiceCount invoices',
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: EdgeInsets.only(right: normalPadding / 2),
            child: DropdownButton<String>(
              value: state.currencies[state.currencyFlag],
              icon: Padding(
                padding: EdgeInsets.only(left: normalPadding / 3),
                child: SvgPicture.asset(
                  'assets/images/icon-arrow-down.svg',
                ),
              ),
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(),
              onChanged: (String? newValue) async {
                if (newValue != null) {
                  int indexOfNewValue = state.currencies.indexOf(newValue);
                  if (state.currencyFlag != indexOfNewValue) {
                    state.currencyFlag = indexOfNewValue;
                    await state.updateCurrencyConverRatio();
                    state.refresh();
                  }
                }
              },
              items: state.currencies.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
          ),
          Text(
            'Filter',
            style:
                context.read<ThemeNotifier>().theme.textTheme.bodyMedium!.merge(
                      TextStyle(
                        color: context
                            .read<ThemeNotifier>()
                            .theme
                            .secondaryHeaderColor,
                      ),
                    ),
          ),
          Padding(
            padding: EdgeInsets.only(left: normalPadding / 2),
            child: SvgPicture.asset(
              'assets/images/icon-arrow-down.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: GestureDetector(
              onTap: () {
                context.read<InvoicesPagesData>().invoices.add(
                      Invoice(
                        id: getRandomString(6),
                        createdat: DateTime.now().toString(),
                        paymentdue: DateTime.now()
                            .add(const Duration(days: 1))
                            .toString(),
                        description: '',
                        paymentterms: 1,
                        clientname: '',
                        clientemail: '',
                        status: 'draft',
                        senderaddress: Senderaddress(
                          street: '',
                          city: '',
                          postcode: '',
                          country: '',
                        ),
                        clientaddress: Clientaddress(
                          street: '',
                          city: '',
                          postcode: '',
                          country: '',
                        ),
                        items: [
                          Items(
                            name: '',
                            quantity: 1,
                            price: 0,
                            total: 0,
                          ),
                        ],
                        total: 0,
                      ),
                    );
                Navigator.pushNamed(
                  context,
                  '/edit',
                  arguments: InvoicesRouteArguments(
                    index: invoiceCount,
                    isCreatingNew: true,
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context).primaryColor,
                ),
                width: 90,
                height: 44,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ClipOval(
                        child: Container(
                          alignment: Alignment.center,
                          color: myWhite,
                          height: 32,
                          width: 32,
                          child: SvgPicture.asset(
                            'assets/images/icon-plus.svg',
                            height: 10,
                            width: 10,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'New',
                      style: context
                          .read<ThemeNotifier>()
                          .theme
                          .textTheme
                          .bodyLarge!
                          .merge(
                            TextStyle(
                              color: myWhite,
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
