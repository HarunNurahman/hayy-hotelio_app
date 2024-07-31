import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';
import 'package:hayy_hotelio_app/shared/app_format.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class DetailBookingPage extends StatefulWidget {
  final BookingModel bookingModel;
  const DetailBookingPage({super.key, required this.bookingModel});

  @override
  State<DetailBookingPage> createState() => _DetailBookingPageState();
}

class _DetailBookingPageState extends State<DetailBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Transaction')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          // Hotel information
          hotelInfo(),
          // Room Detail
          roomDetail(),
          // Payment method
          payment(),
        ],
      ),
    );
  }

  Widget hotelInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Hotel cover
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: widget.bookingModel.cover!,
              width: 90,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Hotel name and location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.bookingModel.name!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(widget.bookingModel.location!, style: grayTextStyle)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget roomDetail() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Room Details',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          roomItem('Date', AppFormat.date(widget.bookingModel.date!)),
          roomItem('Guest', '${widget.bookingModel.guest!} Person'),
          roomItem('Breakfast', widget.bookingModel.breakfast!),
          roomItem('Check-in Time', widget.bookingModel.checkInTime!),
          roomItem('Duration', '${widget.bookingModel.night!} Night'),
          roomItem(
            'Service Fee',
            AppFormat.currency(widget.bookingModel.serviceFee!),
          ),
          roomItem(
            'Activity',
            AppFormat.currency(widget.bookingModel.activity!),
          ),
          const SizedBox(height: 10),
          Divider(height: 1, color: darkGrayColor),
          roomItem(
            'Total Payment',
            AppFormat.currency(widget.bookingModel.totalPayment!),
            color: darkGrayColor,
          ),
        ],
      ),
    );
  }

  Widget roomItem(String item, String value, {Color? color}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item,
            style: blackTextStyle.copyWith(fontSize: 16),
          ),
          Text(
            value,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              color: color,
            ),
          )
        ],
      ),
    );
  }

  Widget payment() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 30),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 10),
          // Payment box
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: grayColor),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                // Payment method logo
                Image.asset(
                  'assets/images/img_mastercard.png',
                  width: 50,
                ),
                const SizedBox(width: 12),
                // Card owner and balance
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harun Nurahman',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Verified',
                        style: grayTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                // Verified icon
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: widget.bookingModel.status == 'PAID'
                        ? darkGrayColor
                        : redColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    widget.bookingModel.status!,
                    style: whiteTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
