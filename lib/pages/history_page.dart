import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hayy_hotelio_app/controllers/history_controller.dart';
import 'package:hayy_hotelio_app/controllers/user_controller.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';
import 'package:hayy_hotelio_app/pages/widgets/transaction_item.dart';
import 'package:hayy_hotelio_app/shared/shared_method.dart';
import 'package:hayy_hotelio_app/shared/style.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final historyController = Get.put(HistoryController());
  final userController = Get.put(UserController());

  @override
  void initState() {
    historyController.getBookingList(userController.data.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          header(),
          const SizedBox(height: 50),
          GetBuilder<HistoryController>(
            builder: (_) {
              return GroupedListView<BookingModel, String>(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                elements: _.bookingList,
                groupBy: (element) => element.date!,
                groupSeparatorBuilder: (value) {
                  String date =
                      DateFormat('yyyy-MM-dd').format(DateTime.now()) == value
                          ? 'Latest Transaction'
                          : AppFormat.dateMonth(value);
                  return Text(
                    date,
                    style: blackTextStyle.copyWith(fontWeight: semiBold),
                  );
                },
                itemBuilder: (context, element) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/detail-booking', arguments: element);
                    },
                    child: TransactionItem(
                      booking: element,
                    ),
                  );
                },
                itemComparator: (element1, element2) =>
                    element1.date!.compareTo(element2.date!),
                order: GroupedListOrder.DESC,
              );
            },
          ),
        ],
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
          Container(
            width: 55,
            height: 55,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/img_profile.png'),
              ),
            ),
          ),
          // Nearby hotel(s)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'My Booking',
                style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              ),
              const SizedBox(height: 4),
              Obx(
                () {
                  return Text(
                    '${historyController.bookingList.length} Transaction(s)',
                    style: grayTextStyle,
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
