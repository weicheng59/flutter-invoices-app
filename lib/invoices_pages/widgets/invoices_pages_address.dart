import 'package:flutter/material.dart';
import 'package:invoice_app/invoices_pages/provider/provider.dart';
import 'package:invoice_app/theme_notifier.dart';

class InvoicesPagesAddress extends StatelessWidget {
  const InvoicesPagesAddress({
    Key? key,
    required this.index,
    this.isClientAddress = true,
  }) : super(key: key);

  final int index;
  final bool isClientAddress;

  @override
  Widget build(BuildContext context) {
    dynamic addr = isClientAddress
        ? context.read<InvoicesPagesData>().invoices[index].clientaddress
        : context.read<InvoicesPagesData>().invoices[index].senderaddress;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          addr.street,
        ),
        Padding(
          padding: const EdgeInsets.only(top: textPadding),
          child: Text(
            addr.city,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: textPadding),
          child: Text(
            addr.postcode,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: textPadding),
          child: Text(
            addr.country,
          ),
        ),
      ],
    );
  }
}
