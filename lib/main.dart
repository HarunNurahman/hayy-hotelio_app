import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/auth/auth_bloc.dart';
import 'package:hayy_hotelio_app/bloc/booking/booking_bloc.dart';
import 'package:hayy_hotelio_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:hayy_hotelio_app/bloc/hotel/hotel_bloc.dart';
import 'package:hayy_hotelio_app/firebase_options.dart';
import 'package:hayy_hotelio_app/pages/auth/sign-in_page.dart';
import 'package:hayy_hotelio_app/pages/auth/sign-up_page.dart';
import 'package:hayy_hotelio_app/pages/booking/checkout-success_page.dart';
import 'package:hayy_hotelio_app/pages/dashboard/dashboard_page.dart';
import 'package:hayy_hotelio_app/pages/onboarding_page.dart';
import 'package:hayy_hotelio_app/pages/splash_page.dart';
import 'package:hayy_hotelio_app/services/bloc_observer.dart';
import 'package:hayy_hotelio_app/services/session_service.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  initializeDateFormatting();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(create: (context) => DashboardBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<HotelBloc>(create: (context) => HotelBloc()),
        BlocProvider<BookingBloc>(create: (context) => BookingBloc()),
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
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          // Apabila session ada, langsung ke dashboard
          '/onboarding': (context) {
            return FutureBuilder(
              future: SessionService().getSession(),
              builder: (context, snapshot) {
                if (snapshot.data == null || snapshot.data!.id == null) {
                  return const OnboardingPage();
                } else {
                  return const DashboardPage();
                }
              },
            );
          },
          '/dashboard': (context) => const DashboardPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage(),
        },
      ),
    );
  }
}
