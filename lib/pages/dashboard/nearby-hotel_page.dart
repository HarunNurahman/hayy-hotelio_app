import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/auth/auth_bloc.dart';
import 'package:hayy_hotelio_app/bloc/hotel/hotel_bloc.dart';
import 'package:hayy_hotelio_app/pages/booking/detail-hotel_page.dart';
import 'package:hayy_hotelio_app/pages/widgets/category_item.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/pages/widgets/hotel_item.dart';
import 'package:hayy_hotelio_app/services/session_service.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';
import 'package:shimmer/shimmer.dart';

class NearbyHotelPage extends StatefulWidget {
  const NearbyHotelPage({super.key});

  @override
  State<NearbyHotelPage> createState() => _NearbyHotelPageState();
}

class _NearbyHotelPageState extends State<NearbyHotelPage> {
  List<String> categories = ['All Place', 'Industrial', 'Village'];
  String selectedCategory = 'All Place';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HotelBloc>(context).add(
      GetHotelByCategory(selectedCategory),
    );
  }

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
    BlocProvider.of<HotelBloc>(context).add(GetHotelByCategory(category));
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelBloc()..add(GetHotelList()),
      child: Scaffold(
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
          GestureDetector(
            onTap: () {
              SessionService().deleteSession();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/sign-in',
                (route) => false,
              );
            },
            child: ClipOval(
              child: Image.asset(
                'assets/images/img_profile.png',
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Nearby hotel
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 2),
                    Text(
                      'Welcome',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      state.user.name!.toUpperCase(),
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }

  Widget searchBar() {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            child: CustomTextFormField(
              controller: searchController,
              hintText: 'Search by name or city',
              isSearchOn: true,
              onFieldSubmitted: (p0) {
                searchController.text.isNotEmpty
                    ? context
                        .read<HotelBloc>()
                        .add(GetHotelByName(searchController.text))
                    : context.read<HotelBloc>().add(GetHotelList());
                return null;
              },
              onTap: () {
                searchController.text.isNotEmpty
                    ? context
                        .read<HotelBloc>()
                        .add(GetHotelByName(searchController.text))
                    : context.read<HotelBloc>().add(GetHotelList());
              },
            ),
          );
        }
        return Container(
          margin: const EdgeInsets.only(top: 30),
          child: CustomTextFormField(
            controller: searchController,
            hintText: 'Search by name or city',
            isSearchOn: true,
          ),
        );
      },
    );
  }

  Widget categoryTab() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 45,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(
            text: category,
            isSelected: selectedCategory == category ? true : false,
            onTap: () {
              onCategorySelected(category);
              context.read<HotelBloc>().add(GetHotelByCategory(category));
            },
          );
        },
      ),
    );
  }

  Widget hotelList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          if (state is HotelLoading) {
            return Shimmer.fromColors(
              baseColor: whiteColor,
              highlightColor: lightGrayColor,
              child: Container(
                width: double.infinity,
                height: 265,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [whiteColor, lightGrayColor],
                  ),
                ),
              ),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailHotelPage(
                              hotel: element,
                            ),
                          ),
                        );
                      },
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
