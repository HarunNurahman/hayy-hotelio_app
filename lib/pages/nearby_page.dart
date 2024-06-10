import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayy_hotelio_app/controllers/nearby-hotel_controller.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';
import 'package:hayy_hotelio_app/pages/widgets/category_item.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/pages/widgets/hotel_item.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class NearbyPage extends StatelessWidget {
  NearbyPage({super.key});
  final nearbyHotelController = Get.put(NearbyHotelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, top: 30),
        child: Column(
          children: [
            // Header
            header(),
            // Search bar
            searchBar(),
            // Category tab
            categoryTab(),
            // Hotel list
            hotelList(),
          ],
        ),
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
                'Near Me',
                style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              ),
              const SizedBox(height: 4),
              Text(
                '3 Hotel(s)',
                style: grayTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }

  // Search bar widget

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: CustomTextFormField(
        onTap: () {
          print('Searching...');
        },
        hintText: 'Search by name or city',
        isSearchOn: true,
      ),
    );
  }

  // Category tab widget
  Widget categoryTab() {
    return GetBuilder<NearbyHotelController>(
      builder: (item) {
        return Container(
          margin: const EdgeInsets.only(top: 30, bottom: 30),
          height: 50,
          width: double.infinity,
          child: ListView.builder(
            itemCount: item.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String category = item.categories[index];
              return CategoryItem(
                text: category,
                isSelected: category == item.category ? true : false,
                onTap: () {
                  item.setCategory = category;
                },
              );
            },
          ),
        );
      },
    );
  }

  // Hotel list widget
  Widget hotelList() {
    return Expanded(
      child: GetBuilder<NearbyHotelController>(
        builder: (_) {
          List<HotelModel> list = _.category == 'All Places'
              ? _.hotelList
              : _.hotelList
                  .where((e) => e.category == nearbyHotelController.category)
                  .toList();

          if (list.isEmpty) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text('No hotel found', style: blackTextStyle),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: list.length,
            itemBuilder: (context, index) {
              HotelModel hotel = list[index];
              return HotelItem(
                hotel: hotel,
                  onTap: () => Navigator.pushNamed(
                        context,
                        '/detail-hotel',
                        arguments: hotel,
                      )
              );
            },
          );
        },
      ),
    );
  }
}
