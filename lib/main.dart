import 'package:dio_practice/core/routes/approutes.dart';
import 'package:dio_practice/views/get_started.dart';
import 'package:dio_practice/views/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      child: MaterialApp(
        routes: {Approutes.getStartedButton: (context) => WeatherScreen()},
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: GetStarted(),
      ),
    );
  }
}
