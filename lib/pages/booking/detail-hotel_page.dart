import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:hayy_hotelio_app/pages/booking/checkout_page.dart';
import 'package:hayy_hotelio_app/pages/widgets/activity_item.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/services/session_service.dart';
import 'package:hayy_hotelio_app/shared/app_format.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class DetailHotelPage extends StatefulWidget {
  final HotelModel hotel;
  const DetailHotelPage(this.hotel, {super.key});

  @override
  State<DetailHotelPage> createState() => _DetailHotelPageState();
}

class _DetailHotelPageState extends State<DetailHotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hotel Details')),
      bottomNavigationBar: bottomNavBar(context),
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
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.hotel.image!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == widget.hotel.image!.length - 1 ? 0 : 16,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.hotel.image![index],
                width: 280,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
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
                      widget.hotel.name!,
                      style: blackTextStyle.copyWith(
                        fontSize: 22,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    // Hotel location
                    Text(widget.hotel.location!, style: grayTextStyle),
                  ],
                ),
              ),
              // Hotel rates
              Row(
                children: [
                  Image.asset('assets/icons/ic_star_on.png', width: 24),
                  const SizedBox(width: 4),
                  Text(
                    widget.hotel.rate.toString(),
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
            widget.hotel.description!,
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
          // Activity item
          Container(
            margin: const EdgeInsets.only(top: 6),
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.hotel.activity!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: index == widget.hotel.image!.length - 1 ? 0 : 16,
                  ),
                  child: ActivityItem(
                    imgUrl: widget.hotel.activity![index]['image'],
                    name: widget.hotel.activity![index]['name'],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget bottomNavBar(BuildContext context) {
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
                AppFormat.currency(widget.hotel.price!),
                style: grayTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: bold,
                  color: darkGrayColor,
                ),
              ),
              Text('per night', style: grayTextStyle),
            ],
          ),
          // Book button
          CustomButton(
            onPressed: () async {
              UserModel user = await SessionService().getSession();
              print(user.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    hotel: widget.hotel,
                    userId: user.id!,
                  ),
                ),
              );
            },
            text: 'Booking Now',
            width: 180,
          )
        ],
      ),
    );
  }
}
