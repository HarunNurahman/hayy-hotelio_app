import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hayy_hotelio_app/bloc/booking/booking_bloc.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:hayy_hotelio_app/pages/widgets/transaction_item.dart';
import 'package:hayy_hotelio_app/shared/app_format.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

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
                  return Shimmer.fromColors(
                    baseColor: whiteColor,
                    highlightColor: lightGrayColor,
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [whiteColor, lightGrayColor],
                        ),
                      ),
                    ),
                  );
                }

                if (state is BookingFailed) {
                  return Center(
                    child: Text(
                      'Error Fetching Data: ${state.errorMessage}',
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                  );
                }

                if (state is BookingSuccess) {
                  // Group list view transaksi
                  return GroupedListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    elements: state.booking,
                    groupBy: (element) => element.date,
                    groupSeparatorBuilder: (value) {
                      String date =
                          DateFormat('yyyy-MM-dd').format(DateTime.now()) ==
                                  value
                              ? 'Today'
                              : AppFormat.dateMonth(value!);

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
                      return TransactionItem(booking: element);
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
              Text('3 Transactions', style: grayTextStyle)
            ],
          )
        ],
      ),
    );
  }

  // Widget transaction(String dateTime) {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 50),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'Today',
  //           style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
  //         ),
  //         const SizedBox(height: 10),
  //         // Transaction item
  //         const TransactionItem(
  //           imgUrl: 'assets/images/img_hotel_1.png',
  //           name: 'Round O\' Park',
  //           dateTime: '2 Aug 2022',
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
