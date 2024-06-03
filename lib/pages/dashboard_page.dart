import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/category_item.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/pages/widgets/hotel_item.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          children: [
            // Header
            header(),
            // Search bar
            searchBar(),
            // Category tab
            categoryTab(),
            // Hotel list
            hotelList(),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (value) {},
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: grayColor,
          selectedItemColor: blackColor,
          selectedIconTheme: IconThemeData(color: greenColor),
          selectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: semiBold,
          ),
          items: [
            BottomNavigationBarItem(
              label: 'Nearby',
              icon: Image.asset(
                'assets/icons/ic_nearby-location.png',
                width: 20,
                color: greenColor,
              ),
            ),
            BottomNavigationBarItem(
              label: 'History',
              icon: Image.asset('assets/icons/ic_history.png', width: 20),
            ),
            BottomNavigationBarItem(
              label: 'Payment',
              icon: Image.asset('assets/icons/ic_payment.png', width: 20),
            ),
            BottomNavigationBarItem(
              label: 'Reward',
              icon: Image.asset('assets/icons/ic_reward.png', width: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Profile image
        Container(
          width: 55,
          height: 55,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/img_profile.png'),
            ),
          ),
        ),
        // Nearby hotel(s)
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Near Me',
              style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            const SizedBox(height: 4),
            Text(
              '3 Hotel(s)',
              style: grayTextStyle,
            ),
          ],
        )
      ],
    );
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: CustomTextFormField(
        onTap: () {
          print('Searching...');
        },
        hintText: 'Search by name or city',
        isSearchOn: true,
      ),
    );
  }

  // Category tab
  Widget categoryTab() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            CategoryItem(
              text: 'All Place',
              isSelected: true,
              onTap: () {},
            ),
            CategoryItem(
              text: 'Industrial',
              onTap: () {},
            ),
            CategoryItem(
              text: 'Village',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget hotelList() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          HotelItem(
            name: 'Silverstone',
            imgUrl: 'assets/images/img_hotel_1.png',
            price: 1550,
            onTap: () {},
          ),
          HotelItem(
            name: 'Brown Stay',
            imgUrl: 'assets/images/img_hotel_2.png',
            price: 950,
            onTap: () {},
          ),
          HotelItem(
            name: 'Angga Nest',
            imgUrl: 'assets/images/img_hotel_3.png',
            price: 5300,
            onTap: () {},
          ),
          HotelItem(
            name: 'Weeknd',
            imgUrl: 'assets/images/img_hotel_4.png',
            price: 25,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
