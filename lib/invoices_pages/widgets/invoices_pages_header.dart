import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_app/theme_notifier.dart';

import '../provider/provider.dart';

class InvoicesHeader extends StatelessWidget {
  const InvoicesHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding),
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
                '${context.read<InvoicesPagesData>().invoices.length} invoices',
                style:
                    context.read<ThemeNotifier>().theme.textTheme.bodyMedium!,
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
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
            padding: const EdgeInsets.only(left: padding / 2),
            child: SvgPicture.asset(
              'assets/images/icon-arrow-down.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
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
        ],
      ),
    );
  }
}
