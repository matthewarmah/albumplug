import 'package:albumplug3/sceens/auth/auth.dart';
import 'package:albumplug3/sceens/pages/Listen.dart';
import 'package:albumplug3/sceens/pages/home.dart';
import 'package:albumplug3/sceens/pages/profile.dart';
import 'package:albumplug3/sceens/pages/search.dart';
import 'package:albumplug3/sceens/pages/signup.dart';
import 'package:albumplug3/sceens/pages/upload.dart';
import 'package:albumplug3/util/explore_grid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'sceens/pages/auth_scrn.dart';
import 'sceens/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);
  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: Authentication().authStateChanges,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return UserListen();
          }
          return AuthScrn();
        }));
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthWrapper(),
    );
  }
}
