import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          children: [
            // Header
            header(),
            // Search bar
            searchBar(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Row(
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
    );
  }

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


}
