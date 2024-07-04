import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/auth/auth_bloc.dart';
import 'package:hayy_hotelio_app/bloc/hotel/hotel_bloc.dart';
import 'package:hayy_hotelio_app/pages/detail-hotel_page.dart';
import 'package:hayy_hotelio_app/pages/widgets/category_item.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/pages/widgets/hotel_item.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class NearbyHotelPage extends StatefulWidget {
  const NearbyHotelPage({super.key});

  @override
  State<NearbyHotelPage> createState() => _NearbyHotelPageState();
}

class _NearbyHotelPageState extends State<NearbyHotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
        children: [
          // Header
          header(),
          // Search bar
          searchBar(),
          // Hotel category
          hotelCategory(context),
          // Hotel list
          hotelList(context),
        ],
      ),
    );
  }

  Widget header() {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HotelSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image profile
                GestureDetector(
                  onTap: () {
                    context.read<AuthBloc>().add(AuthSignOut());
                    setState(() {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/sign-in',
                        (route) => false,
                      );
                    });
                  },
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/img_profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
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
                    // Mengambil data jumlah hotel yang ada pada collection 'hotel'
                    Text(
                      '${state.hotel.length} Hotel',
                      style: grayTextStyle,
                    )
                  ],
                ),
              ],
            ),
          );
        }
        return Text(state.toString());
      },
    );
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: CustomTextFormField(
        hint: 'Search by name',
        isSearchOn: true,
      ),
    );
  }

  Widget hotelCategory(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoryItem(
              title: 'All Place',
              onTap: () {},
              isSelected: true,
            ),
            CategoryItem(
              title: 'Industrial',
              onTap: () {},
            ),
            CategoryItem(
              title: 'Village',
              onTap: () {},
            ),
            CategoryItem(
              title: 'Resort',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget hotelList(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HotelSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              children: state.hotel
                  .map(
                    (list) => HotelItem(
                      hotel: list,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailHotelPage(list),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        }
        return Container();
      },
    );
  }
}
