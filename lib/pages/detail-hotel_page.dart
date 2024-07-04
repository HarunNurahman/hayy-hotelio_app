import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/hotel/hotel_bloc.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';
import 'package:hayy_hotelio_app/pages/checkout_page.dart';
import 'package:hayy_hotelio_app/pages/widgets/activity_item.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/pages/widgets/facility_item.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class DetailHotelPage extends StatefulWidget {
  final HotelModel hotelData;
  const DetailHotelPage(this.hotelData, {super.key});

  @override
  State<DetailHotelPage> createState() => _DetailHotelPageState();
}

class _DetailHotelPageState extends State<DetailHotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hotel Details')),
      bottomNavigationBar: bottomNav(context),
      // Body content
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
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
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HotelSuccess) {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.hotelData.image!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: index == state.hotel.length - 1 ? 0 : 16,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      widget.hotelData.image![index],
                      fit: BoxFit.cover,
                      width: 280,
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
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
                    widget.hotelData.name!,
                    style: blackTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Hotel location
                  Text(widget.hotelData.location!, style: grayTextStyle)
                ],
              ),
              // Hotel rating
              Row(
                children: [
                  Image.asset('assets/icons/ic_star_on.png', width: 24),
                  const SizedBox(width: 4),
                  Text(
                    widget.hotelData.rate.toString(),
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
            widget.hotelData.description!,
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.hotelData.activity!.length,
              itemBuilder: (context, index) {
                return ActivityItem(
                  text: widget.hotelData.activity![index]['name'],
                  imgUrl: widget.hotelData.activity![index]['image'],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  BottomAppBar bottomNav(BuildContext context) {
    return BottomAppBar(
      elevation: 8,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      height: 80,
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$${widget.hotelData.price}',
                style: grayTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: bold,
                  color: darkGrayColor,
                ),
              ),
              const SizedBox(height: 2),
              Text('per night', style: grayTextStyle),
            ],
          ),
          CustomButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckoutPage(),
              ),
            ),
            text: 'Booking Now',
            width: 180,
          )
        ],
      ),
    );
  }
}
