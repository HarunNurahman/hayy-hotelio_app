import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayy_hotelio_app/controllers/navigation_controller.dart';
import 'package:hayy_hotelio_app/pages/history_page.dart';
import 'package:hayy_hotelio_app/pages/nearby_page.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final navigation = Get.put(NavigationController());
  final List<Map> navItems = [
    {'icon': 'assets/icons/ic_nearby-location.png', 'title': 'Nearby'},
    {'icon': 'assets/icons/ic_history.png', 'title': 'History'},
    {'icon': 'assets/icons/ic_payment.png', 'title': 'Payment'},
    {'icon': 'assets/icons/ic_reward.png', 'title': 'Reward'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (navigation.indexPage) {
          case 0:
            return NearbyPage();
          case 1:
            return HistoryPage();
          case 2:
            return Center(
              child: Text(
                'Welcome to Payment Page',
                style: blackTextStyle,
              ),
            );
          case 3:
            return Center(
              child: Text(
                'Welcome to Reward Page',
                style: blackTextStyle,
              ),
            );
          default:
            return NearbyPage();
        }
      }),
      bottomNavigationBar: Obx(
        () => SizedBox(
          height: 80,
          child: BottomNavigationBar(
            currentIndex: navigation.indexPage,
            onTap: (value) => navigation.setIndexPage = value,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: blackColor,
            unselectedItemColor: grayColor,
            selectedLabelStyle: TextStyle(fontWeight: semiBold, fontSize: 12),
            items: navItems.map((menu) {
              return BottomNavigationBarItem(
                icon: Image.asset(
                  menu['icon'],
                  width: 20,
                  color: navigation.indexPage == navItems.indexOf(menu)
                      ? greenColor
                      : grayColor,
                ),
                label: menu['title'],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
