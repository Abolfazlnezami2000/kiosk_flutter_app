import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:kiosk_machine_app/view/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Sizer(
    builder: (context, orientation, deviceType) {
      return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      );
    }
  );
}