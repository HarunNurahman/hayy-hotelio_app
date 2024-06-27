import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/activity_item.dart';
import 'package:hayy_hotelio_app/pages/widgets/facility_item.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class DetailHotelPage extends StatelessWidget {
  const DetailHotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hotel Details')),
      // Body content
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          children: [
            // Detail hotel images
            detailImage(),
            // Hotel information
            hotelInformation(),
            // Hotel facilities
            hotelFacility(),
            // Hotel activities
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
            ),
          ),
          const SizedBox(width: 18),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/img_detail-hotel_1.png',
              width: 280,
            ),
          ),
        ],
      ),
    );
  }

  Widget hotelInformation() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel information
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                  Text('Jakarta, Indonesia', style: grayTextStyle)
                ],
              ),
              // Hotel rating
              Row(
                children: [
                  Image.asset('assets/icons/ic_star_on.png', width: 24),
                  const SizedBox(width: 4),
                  Text(
                    '4.8',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          // Hotel description
          Text(
            'This hotel is still set in one of the most wateringly beautiful lagoons in eye off the country, a vision of broad white beaches, shape-shifting sandbag',
            style: blackTextStyle.copyWith(
              fontSize: 16,
            ),
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
            'Facilities',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          // Facility items
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FacilityItem(
                title: 'Lounge',
                imgUrl: 'assets/icons/ic_facility_lounge.png',
              ),
              FacilityItem(
                title: 'Office',
                imgUrl: 'assets/icons/ic_facility_office.png',
              ),
              FacilityItem(
                title: 'Wifi',
                imgUrl: 'assets/icons/ic_facility_wifi.png',
              ),
              FacilityItem(
                title: 'Store',
                imgUrl: 'assets/icons/ic_facility_store.png',
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget hotelActivity() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Activities',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          // Activity list
          Container(
            margin: const EdgeInsets.only(top: 6),
            height: 100,
            child: const Row(
              children: [
                ActivityItem(
                  text: 'Kayak',
                  imgUrl: 'assets/images/img_activity_1.png',
                ),
                ActivityItem(
                  text: 'Climbing',
                  imgUrl: 'assets/images/img_activity_2.png',
                ),
                ActivityItem(
                  text: 'Futsal',
                  imgUrl: 'assets/images/img_activity_3.png',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
