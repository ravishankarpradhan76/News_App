import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/app_routes.dart';
import 'package:news_app/core/theme_service.dart';

void main() async {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeService themeService = Get.put(ThemeService());

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode:
            themeService.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        initialRoute: '/',
        getPages: AppRoutes.routes,
      );
    });
  }
}
