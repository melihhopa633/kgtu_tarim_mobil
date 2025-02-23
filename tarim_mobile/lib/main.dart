import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/login/pages/login_page.dart';
import 'features/auth/login/providers/login_provider.dart';
import 'features/auth/signup/pages/signup_page.dart';
import 'features/auth/signup/providers/signup_provider.dart';
import 'features/welcome/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
      ],
      child: MaterialApp(
        title: 'TarimProjemiz',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignupPage(),
          '/welcome': (context) => const WelcomePage(),
        },
      ),
    );
  }
}
