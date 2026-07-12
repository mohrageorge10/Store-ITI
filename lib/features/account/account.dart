import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_text_styles.dart';
import 'package:store/features/account/address_screen.dart';
import 'package:store/widgets/account_tile.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> accountItems = [
      {'icon': Icons.inventory_2_outlined, 'title': "My Orders"},
      {'icon': Icons.badge_outlined, 'title': "My Details"},
      {'icon': Icons.home_outlined, 'title': "Address Book"},
      {'icon': Icons.help_outline, 'title': "FAQs"},
      {'icon': Icons.headset_mic_outlined, 'title': "Help Center"},
    ];
    final List<Widget> pages = [
      const Text("My Orders"),
      const Text("My Details"),
      AddressScreen(),
      const Text("FAQs"),
      const Text("Help Center"),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        title: const Text("Account", style: AppTextStyles.kText24Black),
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

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: InkWell(
                onTap: () {},
                child: const Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 12),
                    Text(
                      "Logout",
                      style: TextStyle(
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
