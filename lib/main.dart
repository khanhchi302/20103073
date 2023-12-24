import 'package:connect/models/profile.dart';
import 'package:connect/providers/forgotviewmodel.dart';
import 'package:connect/providers/loginviewmodel.dart';
import 'package:connect/providers/profileviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:connect/providers/mainviewmodel.dart';
import 'package:connect/providers/menubarviewmodel.dart';
import 'package:connect/providers/registerviewmodel.dart';
import 'package:connect/services/api_service.dart';
import 'package:connect/ui/page_forgot.dart';
import 'package:connect/ui/page_main.dart';
import 'package:provider/provider.dart';

import 'providers/diachimodel.dart';
import 'ui/page_login.dart';
import 'ui/page_register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ApiService api = ApiService();
  api.initialize();

  Profile profile = Profile();
  profile.initialize();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
    ),
    ChangeNotifierProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(),
    ),
    ChangeNotifierProvider<ForgotViewModel>(
      create: (context) => ForgotViewModel(),
    ),
    ChangeNotifierProvider<MainViewModel>(
      create: (context) => MainViewModel(),
    ),
    ChangeNotifierProvider<MenuBarViewModel>(
      create: (context) => MenuBarViewModel(),
    ),
    ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => ProfileViewModel(),
    ),
    ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => ProfileViewModel(),
    ),
    ChangeNotifierProvider<DiaChiModel>(
      create: (context) => DiaChiModel(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => PageMain(),
        '/login': (context) => PageLogin(),
        '/register': (context) => PageRegister(),
        '/forgot': (context) => PageForgot(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16)),
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 253, 96, 203)),
        useMaterial3: true,
      ),
      home: PageMain(),
    );
  }
}
