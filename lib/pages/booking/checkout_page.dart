import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/auth/auth_bloc.dart';
import 'package:hayy_hotelio_app/bloc/booking/booking_bloc.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/shared/app_format.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatefulWidget {
  final HotelModel hotel;
  const CheckoutPage({
    super.key,
    required this.hotel,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()
        ..add(
          GetUser('IhY6nAIZUVWx77YWSkFvs7bEyOt1'),
        ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Checkout')),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          children: [
            // Hotel information
            hotelInfo(),
            // Room detail
            roomDetail(),
            // Payment
            payment(),
            // Pay button
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  final userId = state.user.id;
                  return CustomButton(
                    text: 'Proceed to Payment',
                    onPressed: () {
                      BlocProvider.of<BookingBloc>(context).add(
                        AddBooking(
                          userId!,
                          BookingModel(
                            id: '',
                            idHotel: widget.hotel.id!,
                            cover: widget.hotel.cover!,
                            name: widget.hotel.name!,
                            location: widget.hotel.location!,
                            date:
                                DateFormat('yyyy-MM-dd').format(DateTime.now()),
                            guest: 1,
                            breakfast: 'Included',
                            checkInTime: '14:00 WIB',
                            night: 1,
                            serviceFee: 15,
                            activity: 20,
                            totalPayment: (widget.hotel.price! * 1) + 15 + 20,
                            status: 'PAID',
                            isDone: false,
                          ),
                        ),
                      );
                      Navigator.pushNamed(
                        context,
                        '/checkout-success',
                        arguments: widget.hotel,
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ],
        ),
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
              imageUrl: widget.hotel.cover!,
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
                  widget.hotel.name!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(widget.hotel.location!, style: grayTextStyle)
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
          roomItem('Date', AppFormat.date(DateTime.now().toIso8601String())),
          roomItem('Guest', '1 Guest(s)'),
          roomItem('Breakfast', 'Included'),
          roomItem('Check-in Time', '14:00 WIB'),
          roomItem('Duration', '1 Night'),
          roomItem('Service Fee', AppFormat.currency(5)),
          roomItem('Activity', AppFormat.currency(15)),
          const SizedBox(height: 10),
          Divider(height: 1, color: darkGrayColor),
          roomItem(
            'Total Payment',
            AppFormat.currency(widget.hotel.price! + 5 + 15),
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
                        'Balance ${AppFormat.currency(5000)}',
                        style: grayTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                // Verified icon
                Image.asset('assets/icons/ic_verified.png', width: 20)
              ],
            ),
          )
        ],
      ),
    );
  }
}
