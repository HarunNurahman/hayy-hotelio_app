import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hayy_hotelio_app/firebase_options.dart';
import 'package:hayy_hotelio_app/pages/checkout-success_page.dart';
import 'package:hayy_hotelio_app/pages/checkout_page.dart';
import 'package:hayy_hotelio_app/pages/dashboard_page.dart';
import 'package:hayy_hotelio_app/pages/detail-hotel_page.dart';
import 'package:hayy_hotelio_app/pages/sign-in_page.dart';
import 'package:hayy_hotelio_app/pages/onboarding_page.dart';
import 'package:hayy_hotelio_app/pages/sign-up_page.dart';
import 'package:hayy_hotelio_app/services/session_service.dart';
import 'package:hayy_hotelio_app/shared/style.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'pages/detail-booking_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightGrayColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightGrayColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: blackColor),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      routes: {
        '/': (context) {
          return FutureBuilder(
            future: SessionService.getUser(),
            builder: (context, snapshot) {
              if (snapshot.data == null || snapshot.data!.id == null) {
                return const OnboardingPage();
              } else {
                return DashboardPage();
              }
            },
          );
        },
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/dashboard': (context) => DashboardPage(),
        '/detail-hotel': (context) => DetailHotelPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => const CheckoutSuccessPage(),
        '/detail-booking': (context) => DetailBookingPage(),
      },
    );
  }
}
