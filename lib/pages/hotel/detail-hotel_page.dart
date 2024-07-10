import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/activity_item.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/shared/app_format.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class DetailHotelPage extends StatelessWidget {
  const DetailHotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hotel Details')),
      bottomNavigationBar: bottomNavBar(),
      // Content box
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        // Content
        child: ListView(
          children: [
            // Hotel image
            detailImage(),
            // Hotel information (hotel name, location, rating, and description)
            hotelInfo(),
            // Hotel facilities
            hotelFacility(),
            // Hotel activity
            hotelActivity(),
          ],
        ),
      ),
    );
  }

  Widget detailImage() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/img_detail-hotel_1.png',
              width: 280,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 18),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/img_detail-hotel_2.png',
              width: 280,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget hotelInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel name and rating
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hotel name
                    Text(
                      'Round O\' Park',
                      style: blackTextStyle.copyWith(
                        fontSize: 22,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    // Hotel location
                    Text('Jakarta, Indonesia', style: grayTextStyle),
                  ],
                ),
              ),
              // Hotel rates
              Row(
                children: [
                  Image.asset('assets/icons/ic_star_on.png', width: 24),
                  const SizedBox(width: 4),
                  Text(
                    '4.8',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          // Hotel description
          Text(
            'This hotel is still set in one of the most  wateringly beautiful lagoons in eye off the country, a vision of broad white beaches, shape-shifting sandbag',
            style: blackTextStyle.copyWith(fontSize: 16, wordSpacing: 2),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }

  Widget hotelFacility() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Facility',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Facility item
              faciityItem('assets/icons/ic_facility_lounge.png', 'Lounge'),
              faciityItem('assets/icons/ic_facility_office.png', 'Office'),
              faciityItem('assets/icons/ic_facility_wifi.png', 'WiFi'),
              faciityItem('assets/icons/ic_facility_store.png', 'Store'),
            ],
          )
        ],
      ),
    );
  }

  Widget faciityItem(String imgUrl, String name) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: grayColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgUrl,
            width: 24,
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          )
        ],
      ),
    );
  }

  Widget hotelActivity() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Activity',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 6),
          // Activity item
          Row(
            children: [
              ActivityItem(
                imgUrl: 'assets/images/img_activity_1.png',
                name: 'Kayak',
              ),
              const SizedBox(width: 16),
              ActivityItem(
                imgUrl: 'assets/images/img_activity_2.png',
                name: 'Climbing',
              ),
              const SizedBox(width: 16),
              ActivityItem(
                imgUrl: 'assets/images/img_activity_3.png',
                name: 'Futsal',
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomNavBar() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border(
          top: BorderSide(color: grayColor.withOpacity(0.5), width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Price/night
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppFormat.currency(12900),
                style: grayTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: bold,
                  color: darkGrayColor,
                ),
              ),
              Text('per night', style: grayTextStyle),
            ],
          ),
          // Button
          CustomButton(
            onPressed: () {},
            text: 'Booking Now',
            width: 180,
          )
        ],
      ),
    );
  }
}
