import 'package:cogent_ecomm_app/OuterScreen/verification.dart';
import 'package:cogent_ecomm_app/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:cogent_ecomm_app/welcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cogent_ecomm_app/SignIn.dart';
import 'package:cogent_ecomm_app/InsideApp/InnerHome.dart';
import 'package:cogent_ecomm_app/OuterScreen/ResetPass.dart';
//import 'package:cogent_ecomm_app/InsideApp/SideNavbar/PrivacyPolicy.dart';
import 'package:cogent_ecomm_app/InsideApp/SideNavbar/settings.dart';
//import 'package:cogent_ecomm_app/InsideApp/SideNavbar/notification.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    routes: {
      '/welcome': (context) => homeScreen(),
      '/signIn': (context) => signIn(),
      '/signup': (context) => signUp(),
      '/home': (context) => home(),
      '/settings': (context) => Settings()

    },
    debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return homeScreen();
  }
}
