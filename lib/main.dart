import 'package:awwao/routes/app_routes.dart';
import 'package:awwao/screen/login_screen.dart';
import 'package:awwao/screen/main_screen.dart';
import 'package:awwao/screen/register_screen.dart';
import 'package:awwao/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ইশকুল',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Hind Siliguri',
        scaffoldBackgroundColor: Colors.white,
      ),
      // Start with SplashScreen instead of MainPage
      home: const SplashScreen(),
      routes: {
        '/main': (context) => const MainPage(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
