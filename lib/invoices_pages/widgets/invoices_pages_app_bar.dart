import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_app/invoices_pages/provider/provider.dart';
import 'package:invoice_app/theme_notifier.dart';

class InvoicesPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const InvoicesPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 72,
      backgroundColor: Theme.of(context).backgroundColor,
      leadingWidth: 72,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              FractionallySizedBox(
                heightFactor: 1 / 2,
                widthFactor: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: ColoredBox(
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/images/logo.svg',
            semanticsLabel: 'Acme Logo',
            height: 27.58,
            width: 28,
          ),
        ],
      ),
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.read<ThemeNotifier>().changeTheme(),
          child: Padding(
            padding: EdgeInsets.all(
              context.read<ThemeNotifier>().normalPadding,
            ),
            child: SvgPicture.asset(
              context.read<ThemeNotifier>().isDarkMode
                  ? 'assets/images/icon-sun.svg'
                  : 'assets/images/icon-moon.svg',
              semanticsLabel: 'Acme Logo',
            ),
          ),
        ),
        VerticalDivider(
          width: 1,
          thickness: 1,
          color: Theme.of(context).dividerColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: context.read<ThemeNotifier>().normalPadding,
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/image-avatar.jpg',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
