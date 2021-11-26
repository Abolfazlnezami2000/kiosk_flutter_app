import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_machine_app/view/kiosk_page.dart';
import 'package:kiosk_machine_app/view/normal_page.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 5.0.h,
              width: 60.0.w,
              margin: EdgeInsets.symmetric(vertical: 5.0.h),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () => Get.to(const KioskPage()),
                child: const Text(
                  "Kiosk Mode",
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 5.0.h,
              width: 60.0.w,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () => Get.to(const NormalPage()),
                child: const Text(
                  "Android Mode",
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
