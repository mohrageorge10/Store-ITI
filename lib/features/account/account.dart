import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_button.dart';
import 'package:store/core/helpers/app_text_styles.dart';
import 'package:store/core/helpers/locale_keys.dart';
import 'package:store/features/account/address_screen.dart';
import 'package:store/widgets/account_tile.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> accountItems = [
      {'icon': Icons.inventory_2_outlined, 'title': LocaleKeys.myOrders.tr()},
      {'icon': Icons.badge_outlined, 'title': LocaleKeys.myDetails.tr()},
      {'icon': Icons.home_outlined, 'title': LocaleKeys.addressBook.tr()},
      {'icon': Icons.help_outline, 'title': LocaleKeys.faqs.tr()},
      {'icon': Icons.headset_mic_outlined, 'title': LocaleKeys.helpCenter.tr()},
    ];

    final List<Widget> pages = [
      Text(LocaleKeys.myOrders.tr()),
      Text(LocaleKeys.myDetails.tr()),
      const AddressScreen(),
      Text(LocaleKeys.faqs.tr()),
      Text(LocaleKeys.helpCenter.tr()),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          LocaleKeys.accountTitle.tr(),
          style: AppTextStyles.kText24Black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: accountItems.length,
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(height: 1),
                  );
                },
                itemBuilder: (context, index) {
                  return AccountTile(
                    icon: accountItems[index]['icon'],
                    title: accountItems[index]['title'],
                    screen: pages[index],
                  );
                },
              ),
            ),
            const Divider(height: 1),
            AppButton(
              onPressed: () {
                if (context.locale == const Locale('en')) {
                  context.setLocale(const Locale('ar'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              },
              label: LocaleKeys.changeLanguageButton.tr(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 30,
                top: 20,
              ),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.logout, color: Colors.red),
                    const SizedBox(width: 12),
                    Text(
                      LocaleKeys.logout.tr(),
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
