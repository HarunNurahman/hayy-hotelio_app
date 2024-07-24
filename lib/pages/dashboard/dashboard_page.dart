import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/auth/auth_bloc.dart';
import 'package:hayy_hotelio_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:hayy_hotelio_app/pages/dashboard/history_page.dart';
import 'package:hayy_hotelio_app/pages/dashboard/nearby-hotel_page.dart';
import 'package:hayy_hotelio_app/pages/dashboard/payment_page.dart';
import 'package:hayy_hotelio_app/pages/dashboard/reward_page.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthFailed) {
          return Center(
            child: Text(
              state.errorMessage,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          );
        }

        if (state is AuthSuccess) {
          UserModel user = state.user;

          // Bottom navigation item
          final List<Map> bottomNavItem = [
            {'icon': 'assets/icons/ic_nearby-location.png', 'title': 'Nearby'},
            {'icon': 'assets/icons/ic_history.png', 'title': 'History'},
            {'icon': 'assets/icons/ic_payment.png', 'title': 'Payment'},
            {'icon': 'assets/icons/ic_reward.png', 'title': 'Reward'},
          ];

          // Daftar halaman yang akan ditampilkan
          final List<Widget> pages = [
            const NearbyHotelPage(),
            HistoryPage(userModel: user),
            const PaymentPage(),
            const RewardPage(),
          ];

          return BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return Scaffold(
                body: pages[state.tabIndex],
                bottomNavigationBar: SizedBox(
                  height: 80,
                  child: BottomNavigationBar(
                    currentIndex: state.tabIndex,
                    onTap: (value) {
                      context.read<DashboardBloc>().add(OnTabChange(value));
                    },
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                    selectedItemColor: blackColor,
                    unselectedItemColor: grayColor,
                    selectedLabelStyle: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                    items: bottomNavItem.map(
                      (item) {
                        return BottomNavigationBarItem(
                          icon: Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Image.asset(
                              item['icon'],
                              width: 24,
                              color:
                                  state.tabIndex == bottomNavItem.indexOf(item)
                                      ? greenColor
                                      : grayColor,
                            ),
                          ),
                          label: item['title'],
                        );
                      },
                    ).toList(),
                  ),
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
