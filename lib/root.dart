
import 'package:adminpage/routes.dart';

import 'package:adminpage/screen/home.dart';
import 'package:adminpage/screen/login.dart';
import 'package:adminpage/screen/productlist.dart';
import 'package:adminpage/screen/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser==null?Routes.login:Routes.home,
      routes: {
        Routes.login: (context) =>  const Login(),
        // Routes.register: (context) => const Register(),
        Routes.home: (context) => const Home(),
        Routes.register: (context) => const Register(),
         Routes.prodtlist: (context) => const Productlist(),
      },
    );
  }
}
