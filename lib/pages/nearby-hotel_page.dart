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
        padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
        children: [
          // Header
          header(),
          // Search bar
          searchBar(),
          // Hotel category
          hotelCategory(),
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
          // Image profile
          Container(
            width: 55,
            height: 55,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/img_profile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
              Text('189 Hotels', style: grayTextStyle)
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
        hint: 'Search by name',
        isSearchOn: true,
      ),
    );
  }

  Widget hotelCategory() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoryItem(
              title: 'All Place',
              onTap: () {},
              isSelected: true,
            ),
            CategoryItem(
              title: 'Industrial',
              onTap: () {},
            ),
            CategoryItem(
              title: 'Village',
              onTap: () {},
            ),
            CategoryItem(
              title: 'Resort',
              onTap: () {},
            ),
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
          HotelItem(
            onTap: () => Navigator.pushNamed(context, '/detail-hotel'),
            hotel: 'Silverstone',
            price: '1500',
            rating: 4.2,
            imgUrl: 'assets/images/img_hotel_1.png',
          ),
          HotelItem(
            onTap: () {},
            hotel: 'Brown Stay',
            price: '950',
            rating: 3.2,
            imgUrl: 'assets/images/img_hotel_2.png',
          ),
          HotelItem(
            onTap: () {},
            hotel: 'Angga Nest',
            price: '5300',
            rating: 4.9,
            imgUrl: 'assets/images/img_hotel_3.png',
          ),
          HotelItem(
            onTap: () {},
            hotel: 'Weeknd',
            price: '25',
            rating: 3.5,
            imgUrl: 'assets/images/img_hotel_4.png',
          ),
        ],
      ),
    );
  }
}
