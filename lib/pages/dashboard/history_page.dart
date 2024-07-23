import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hayy_hotelio_app/bloc/auth/auth_bloc.dart';
import 'package:hayy_hotelio_app/bloc/booking/booking_bloc.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';
import 'package:hayy_hotelio_app/pages/widgets/transaction_item.dart';
import 'package:hayy_hotelio_app/shared/app_format.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingBloc()
        ..add(
          GetBooking('IhY6nAIZUVWx77YWSkFvs7bEyOt1'),
        ),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            final userId = state.user.id!;
            context.read<BookingBloc>().add(GetBooking(userId));
            return Scaffold(
              body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
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
                            width: double.infinity,
                            height: 325,
                            margin: const EdgeInsets.symmetric(horizontal: 24),
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
                        return GroupedListView<BookingModel, String>(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          elements: state.booking,
                          groupBy: (e) => e.date!,
                          groupSeparatorBuilder: (value) {
                            String date = DateFormat('yyyy-MM-dd')
                                        .format(DateTime.now()) ==
                                    value
                                ? 'Latest Transaction'
                                : AppFormat.dateMonth(value);

                            return Text(
                              date,
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: semiBold,
                              ),
                            );
                          },
                          itemBuilder: (context, element) {
                            return TransactionItem(booking: element);
                          },
                        );
                      }
                      return Center(child: Text(state.toString()));
                    },
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
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
}
