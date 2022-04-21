import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/responsive_layouts/mobile_screen.dart';
import 'package:instagram/responsive_layouts/responsive_screen_layout.dart';
import 'package:instagram/responsive_layouts/web_screen.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/utills/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options:const  FirebaseOptions(
            apiKey: "AIzaSyBBDM-S5UnKE4yqBqxnTwiWoc7uEsGcYm4",
            appId: "1:140422433925:web:dab0fa96343970fe3e2dec",
            messagingSenderId: "140422433925",
            projectId: "instagram-9aa68",
        storageBucket:"instagram-9aa68.appspot.com", )
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: mobileBackgroundColor
        ),
        home: const LoginScreen(),
        // const ResponsiveScreenLayout(
        //   mobileScreenLayout: MobileScreen(), webScreenLayout: WebScreen(),)
    );
  }
}


