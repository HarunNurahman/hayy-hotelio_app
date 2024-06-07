import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/activity_item.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/pages/widgets/facility_item.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class DetailHotelPage extends StatelessWidget {
  const DetailHotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Details'),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: lightGrayColor),
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
                  '\$12,900',
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
              text: 'Booking Now',
              width: 180,
              onTap: () {},
            )
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image detail hotel
                detailImage(),
                const SizedBox(height: 16),
                // Hotel information
                hotelInfo(),
                const SizedBox(height: 16),
                // Description
                Text(
                  'This hotel is still set in one of the most  wateringly beautiful lagoons in eye ofs the country, a vision of broad white beaches, shape-shifting sandbag',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    wordSpacing: 1,
                  ),
                ),
                const SizedBox(height: 16),
                // Facilities
                facility(),
                const SizedBox(height: 16),
                // Activity
                activity(),
                const SizedBox(height: 30)
              ],
            ),
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
        ],
      ),
    );
  }

  Widget hotelInfo() {
    return Row(
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
            Text('Jakarta, Indonesia', style: grayTextStyle),
          ],
        ),
        // Rating
        Row(
          children: [
            Image.asset('assets/icons/ic_star_on.png', width: 28),
            const SizedBox(width: 2),
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
    );
  }

  Widget facility() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Facilities',
          style: blackTextStyle.copyWith(fontWeight: semiBold),
        ),
        const SizedBox(height: 6),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FacilityItem(
              imgUrl: 'assets/icons/ic_facility_lounge.png',
              name: 'Lounge',
            ),
            FacilityItem(
              imgUrl: 'assets/icons/ic_facility_office.png',
              name: 'Office',
            ),
            FacilityItem(
              imgUrl: 'assets/icons/ic_facility_wifi.png',
              name: 'Wi-Fi',
            ),
            FacilityItem(
              imgUrl: 'assets/icons/ic_facility_store.png',
              name: 'Store',
            ),
          ],
        )
      ],
    );
  }

  Widget activity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activity',
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(height: 6),
        const Row(
          children: [
            ActivityItem(
              name: 'Kayak',
              imgUrl: 'assets/images/img_activity_1.png',
            ),
            ActivityItem(
              name: 'Climbing',
              imgUrl: 'assets/images/img_activity_2.png',
            ),
            ActivityItem(
              name: 'Mini Soccer',
              imgUrl: 'assets/images/img_activity_3.png',
            ),
          ],
        )
      ],
    );
  }
}
