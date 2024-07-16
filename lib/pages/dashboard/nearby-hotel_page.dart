import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/hotel/hotel_bloc.dart';
import 'package:hayy_hotelio_app/pages/booking/detail-hotel_page.dart';
import 'package:hayy_hotelio_app/pages/widgets/category_item.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/pages/widgets/hotel_item.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class NearbyHotelPage extends StatelessWidget {
  const NearbyHotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          // Header (profile image, jumlah hotel terdekat)
          header(),
          // Search bar
          searchBar(),
          // Category tab
          categoryTab(),
          // Hotel list
          hotelList(context),
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
          GestureDetector(
            onTap: () {},
            child: ClipOval(
              child: Image.asset(
                'assets/images/img_profile.png',
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Nearby hotel
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Near Me',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 2),
              Text('189 hotels', style: grayTextStyle)
            ],
          )
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: CustomTextFormField(
        hintText: 'Search by name or city',
        isSearchOn: true,
        onTap: () {},
      ),
    );
  }

  Widget categoryTab() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // Category tab item
        child: Row(
          children: [
            CategoryItem(text: 'All Place', isSelected: true),
            CategoryItem(text: 'Industrial'),
            CategoryItem(text: 'Village'),
            CategoryItem(text: 'Resort'),
          ],
        ),
      ),
    );
  }

  Widget hotelList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          if (state is HotelLoading) {
            return Center(
              child: CircularProgressIndicator(color: darkGrayColor),
            );
          }

          if (state is HotelFailed) {
            return Center(
              child: Text(
                'Error Fetching Data: ${state.errorMessage}',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            );
          }

          if (state is HotelSuccess) {
            return Column(
              children: state.hotel
                  .map(
                    (element) => HotelItem(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailHotelPage(element),
                        ),
                      ),
                      hotel: element,
                    ),
                  )
                  .toList(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
