import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hayy_hotelio_app/bloc/booking/booking_bloc.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:hayy_hotelio_app/pages/booking/detail-booking_page.dart';
import 'package:hayy_hotelio_app/pages/widgets/transaction_item.dart';
import 'package:hayy_hotelio_app/shared/app_format.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  final UserModel userModel;
  const HistoryPage({super.key, required this.userModel});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingBloc()
        ..add(
          GetBooking(widget.userModel.id!),
        ),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          children: [
            // Header (image profile, title, booking count)
            header(),
            // Transaction List
            BlocBuilder<BookingBloc, BookingState>(
              builder: (context, state) {
                if (state is BookingLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: darkGrayColor,
                    ),
                  );
                }

                if (state is BookingFailed) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                  );
                }

                if (state is BookingSuccess) {
                  if (state.booking.isEmpty) {
                    return Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text(
                          'No Transaction',
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    );
                  }

                  return GroupedListView<BookingModel, String>(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    elements: state.booking,
                    groupBy: (element) => element.date!,
                    groupSeparatorBuilder: (value) {
                      String date =
                          DateFormat('yyyy-MM-dd').format(DateTime.now()) ==
                                  value
                              ? 'Latest Transaction'
                              : AppFormat.dateMonth(value);
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          date,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      );
                    },
                    itemBuilder: (context, element) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailBookingPage(bookingModel: element),
                            ),
                          );
                        },
                        child: TransactionItem(booking: element),
                      );
                    },
                    itemComparator: (element1, element2) =>
                        element1.date!.compareTo(element2.date!),
                    order: GroupedListOrder.DESC,
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
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
          // Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'My Booking',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 2),
              BlocBuilder<BookingBloc, BookingState>(
                builder: (context, state) {
                  if (state is BookingSuccess) {
                    return Text('${state.booking.length} Transaction',
                        style: grayTextStyle);
                  }
                  return Container();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
