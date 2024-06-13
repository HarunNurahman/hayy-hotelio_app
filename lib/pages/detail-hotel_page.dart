import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayy_hotelio_app/controllers/user_controller.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';
import 'package:hayy_hotelio_app/pages/widgets/activity_item.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/pages/widgets/facility_item.dart';
import 'package:hayy_hotelio_app/shared/shared_method.dart';
import 'package:hayy_hotelio_app/shared/style.dart';
import 'package:hayy_hotelio_app/sources/booking_source.dart';

class DetailHotelPage extends StatelessWidget {
  DetailHotelPage({super.key});

  final userController = Get.put(UserController());

  final Rx<BookingModel> _bookedData = initBooking.obs;
  BookingModel get bookedData => _bookedData.value;
  set bookedData(BookingModel n) => _bookedData.value = n;

  @override
  Widget build(BuildContext context) {
    HotelModel hotel = ModalRoute.of(context)!.settings.arguments as HotelModel;

    BookingSource.isBooked(userController.data.id!, hotel.id!).then(
      (value) {
        bookedData = value ?? initBooking;
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Details'),
      ),
      bottomNavigationBar: Obx(
        () {
          if (bookedData.id == '') return bottomNavBar(hotel);
          return bookedNavBar();
        },
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
                detailImage(hotel),
                const SizedBox(height: 16),
                // Hotel information
                hotelInfo(hotel),
                const SizedBox(height: 16),
                // Description
                Text(
                  hotel.description!,
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
                activity(hotel),
                const SizedBox(height: 30)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget detailImage(HotelModel hotel) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hotel.image!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == hotel.image!.length - 1 ? 0 : 18,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                hotel.image![index],
                fit: BoxFit.cover,
                width: 280,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget hotelInfo(HotelModel hotel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel name
            Text(
              hotel.name!,
              style: blackTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 2),
            Text(hotel.location!, style: grayTextStyle),
          ],
        ),
        // Rating
        Row(
          children: [
            Image.asset('assets/icons/ic_star_on.png', width: 24),
            const SizedBox(width: 4),
            Text(
              hotel.rate.toString(),
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

  Widget activity(HotelModel hotel) {
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
        SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: hotel.activity!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index == hotel.activity!.length - 1 ? 0 : 16,
                ),
                child: ActivityItem(
                  name: hotel.activity![index]['name'],
                  imgUrl: hotel.activity![index]['image'],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget bottomNavBar(HotelModel hotel) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border(
          top: BorderSide(color: lightGrayColor, width: 2),
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
                AppFormat.currency(hotel.price!),
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
            onTap: () {
              Get.toNamed('/checkout', arguments: hotel);
            },
          )
        ],
      ),
    );
  }

  Widget bookedNavBar() {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border(
          top: BorderSide(color: lightGrayColor, width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Price/night
          Text('You Booked This', style: grayTextStyle),
          // Button
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/detail-booking', arguments: bookedData);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: darkGrayColor,
              minimumSize: const Size(160, 50),
            ),
            child: Text(
              'View Receipt',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
