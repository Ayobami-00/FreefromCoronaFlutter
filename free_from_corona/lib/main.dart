
import 'package:flutter/material.dart';
import 'package:free_from_corona/pages/homepage.dart';
import 'package:free_from_corona/pages/login.dart';
import 'package:free_from_corona/pages/splash_screen.dart';
import 'package:free_from_corona/provider/user_provider.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => UserProvider.initialize(),
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.deepPurple,
    ),
    home: ScreensController(),
  )));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return HomePage();
      default: return Login();
    }
  }
}
