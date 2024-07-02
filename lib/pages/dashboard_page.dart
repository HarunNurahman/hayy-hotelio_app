import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:hayy_hotelio_app/pages/history_page.dart';
import 'package:hayy_hotelio_app/pages/nearby-hotel_page.dart';
import 'package:hayy_hotelio_app/pages/payment_page.dart';
import 'package:hayy_hotelio_app/pages/reward_page.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

List<Widget> bodyItems = [
  const NearbyHotelPage(),
  const HistoryPage(),
  const PaymentPage(),
  const RewardPage(),
];

List<Map> navItems = [
  {'icon': 'assets/icons/ic_nearby-location.png', 'title': 'Nearby'},
  {'icon': 'assets/icons/ic_history.png', 'title': 'History'},
  {'icon': 'assets/icons/ic_payment.png', 'title': 'Payment'},
  {'icon': 'assets/icons/ic_reward.png', 'title': 'Reward'},
];

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: bodyItems[state.tabIndex],
          bottomNavigationBar: SizedBox(
            height: 80,
            child: BottomNavigationBar(
              currentIndex: state.tabIndex,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: whiteColor,
              selectedItemColor: blackColor,
              unselectedItemColor: grayColor,
              selectedLabelStyle: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
              items: navItems.map((item) {
                return BottomNavigationBarItem(
                  icon: Image.asset(
                    item['icon'],
                    width: 24,
                    color: navItems.indexOf(item) == state.tabIndex
                        ? greenColor
                        : grayColor,
                  ),
                  label: item['title'],
                );
              }).toList(),
              onTap: (index) {
                BlocProvider.of<DashboardBloc>(context).add(
                  ChangeTabEvent(index),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
