import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hotel cover
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 10),
                borderRadius: BorderRadius.circular(24),
                image: const DecorationImage(
                  image: AssetImage('assets/images/img_hotel_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Content
            Text(
              'Payment Success',
              style: blackTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Enjoy your a whole new experience\nin this beautiful world',
              style: blackTextStyle.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                return CustomButton(
                  width: 210,
                  text: 'View My Booking',
                  onPressed: () {
                    context.read<DashboardBloc>().add(const OnTabChange(1));
                    Navigator.pushNamed(
                      context,
                      '/dashboard',
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
