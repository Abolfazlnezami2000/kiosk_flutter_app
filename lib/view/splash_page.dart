import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_machine_app/view/home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String image = "assets/images/logo.png";

  @override
  void initState() {
    action();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 30.0.h,
              width: 60.0.h,
              margin: EdgeInsets.symmetric(vertical: 8.0.h),
              child: Image.asset(image)),
          Text(
            "Fara Feed Back",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0.sp),
          ),
          SizedBox(height: 15.0.h),
          SizedBox(
            height: 5.0.h,
            child: const SpinKitSpinningLines(
              color: Colors.blueAccent,
            ),),
        ],
      ),
    );
  }

  void action() async {
    await Future.delayed(const Duration(seconds: 8));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
        ModalRoute.withName('/')
    );
  }
}
