import 'package:dio/dio.dart';
import 'package:dio_practice/controller/weather_provider.dart';
import 'package:dio_practice/core/network/dio_client.dart';
import 'package:dio_practice/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  int currentIndex = 0;

  String selectedCity = "Lagos";
  List<String> cities = [
    "Abia",
    "Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
    "Edo",
    "Ekiti",
    "Enugu",
    "Gombe",
    "Imo",
    "Jigawa",
    "Kaduna",
    "Kano",
    "Katsina",
    "Kebbi",
    "Kogi",
    "Kwara",
    "Lagos",
    "Nasarawa",
    "Niger",
    "Ogun, Nigeria",
    "Ondo",
    "Osun",
    "Oyo",
    "Plateau",
    "Rivers",
    "Sokoto",
    "Taraba",
    "Yobe",
    "Zamfara",
    "Abuja",
  ];
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(weatherProvider.notifier).fetchweather(selectedCity);
    });
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherProvider);

    return Scaffold(
      // backgroundColor: Color.fromARGB(55, 36, 3, 107),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff0D1B3D),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),

                value: selectedCity,

                dropdownColor: Colors.black,
                style: TextStyle(color: Colors.white),
                items: cities.map((city) {
                  return DropdownMenuItem(value: city, child: Text(city));
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedCity = value;
                    });
                  }
                  ref.read(weatherProvider.notifier).fetchweather(value);
                },
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(children: [DrawerHeader(child: Row())]),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0D1B3D), Color(0xff050B1E)],
            begin: AlignmentDirectional.center,
            end: AlignmentGeometry.center,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
          child: weatherState.when(
            data: (weather) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Today",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Column(
                    children: [
                      Text(
                        weather.cityName,
                        style: TextStyle(
                          fontSize: 28.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Image.network(
                        "https://openweathermap.org/img/wn/${weather.weatherIcon}@2x.png",
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        "${weather.temp}°C",
                        style: TextStyle(
                          fontSize: 40.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),

                      Text(
                        weather.condition,
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: const Color.fromARGB(179, 233, 33, 33),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      Text(
                        "Humidity: ${weather.humidity}%",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            error: (error, stackTrace) => Center(
              child: Text(
                "Data failed to Load",
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
          // Column(
          //   // mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       "About Today",
          //       style: TextStyle(
          //         fontSize: 30.sp,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white,
          //       ),
          //     ),
          //     SizedBox(height: 20.h),

          //     SizedBox(height: 20),

          //     SizedBox(height: 20.h),

          //     // weatherState.when(
          //     //   loading
          //     // )
          //   ],
          // ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: ,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 40), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 40),
            label: '',
          ),

          // BottomNavigationBarItem(icon: Icon(Icons.home, size: 40), label: ''),
        ],
      ),
    );
  }
}
