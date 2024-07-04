import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/auth/auth_bloc.dart';
import 'package:hayy_hotelio_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:hayy_hotelio_app/bloc/hotel/hotel_bloc.dart';
import 'package:hayy_hotelio_app/firebase_options.dart';
import 'package:hayy_hotelio_app/pages/checkout-success_page.dart';
import 'package:hayy_hotelio_app/pages/checkout_page.dart';
import 'package:hayy_hotelio_app/pages/dashboard_page.dart';
import 'package:hayy_hotelio_app/pages/detail-hotel_page.dart';
import 'package:hayy_hotelio_app/pages/onboarding_page.dart';
import 'package:hayy_hotelio_app/pages/sign-in_page.dart';
import 'package:hayy_hotelio_app/pages/sign-up_page.dart';
import 'package:hayy_hotelio_app/services/session_service.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';
import 'package:intl/date_symbol_data_local.dart';

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

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DashboardBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => HotelBloc()..add(GetListHotel())),
      ],
      child: MaterialApp(
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
                  return const DashboardPage();
                }
              },
            );
          },
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/dashboard': (context) => const DashboardPage(),
          '/detail-hotel': (context) => const DetailHotelPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage(),
        },
      ),
    );
  }
}
