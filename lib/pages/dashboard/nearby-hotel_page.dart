import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/category_item.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/pages/widgets/hotel_item.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class NearbyHotelPage extends StatelessWidget {
  const NearbyHotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          // Header section (profile image, jumlah hotel terdekat)
          header(),
          // Search bar
          searchBar(),
          // Category tab
          categoryTab(),
          // Hotel list
          hotelList(context),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile image
          ClipOval(
            child: Image.asset(
              'assets/images/img_profile.png',
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          // Nearby hotel
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Near Me',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 2),
              Text('189 hotels', style: grayTextStyle)
            ],
          )
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: CustomTextFormField(
        hintText: 'Search by name or city',
        isSearchOn: true,
        onTap: () {},
      ),
    );
  }

  Widget categoryTab() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // Category tab item
        child: Row(
          children: [
            CategoryItem(text: 'All Place', isSelected: true),
            CategoryItem(text: 'Industrial'),
            CategoryItem(text: 'Village'),
            CategoryItem(text: 'Resort'),
          ],
        ),
      ),
    );
  }

  Widget hotelList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          // Hotel list item
          HotelItem(
            onTap: () => Navigator.pushNamed(context, '/hotel-details'),
            imgUrl: 'assets/images/img_hotel_1.png',
            name: 'Silverstone',
            price: 1550,
            rating: 5,
          ),
          HotelItem(
            imgUrl: 'assets/images/img_hotel_2.png',
            name: 'Brown Stay',
            price: 950,
            rating: 4,
          ),
          HotelItem(
            imgUrl: 'assets/images/img_hotel_3.png',
            name: 'Angga\' Nest',
            price: 59,
            rating: 3.7,
          ),
          HotelItem(
            imgUrl: 'assets/images/img_hotel_4.png',
            name: 'Weeknd',
            price: 25,
            rating: 5,
          ),
        ],
      ),
    );
  }
}
