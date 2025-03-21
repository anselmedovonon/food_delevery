import 'package:flutter/material.dart';
import 'package:food_delevery/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:food_delevery/pages/popular_food_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PopularFoodDetail(),
    );
  }
}

