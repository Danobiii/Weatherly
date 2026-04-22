import 'package:dio_practice/resources/pngsvg.dart';
import 'package:dio_practice/views/widgets/firstscreenwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(55, 36, 3, 107),
      body: Padding(
        padding: EdgeInsetsGeometry.only(top: 160.h, left: 20.w, right: 0.w),
        child: Column(
          children: [
            Image.asset(Pngsvg.weatherIcon),
            FirstScreenWidget(text: 'Daily'),
            FirstScreenWidget(text: 'Weather'),
            SizedBox(height: 40.h),
            WriteUp(text: "Get to know your weather"),
            WriteUp(text: "Maps and radar precipitation"),
            WriteUp(text: "forecast"),
            SizedBox(height: 100.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                print("clicked");
                Navigator.pushNamed(context, "/getStarted_button");
              },
              child: Text("Get Started", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
