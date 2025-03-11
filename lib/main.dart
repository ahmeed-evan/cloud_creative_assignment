import 'package:ecommerce_app_cloud_creative/app/global/bindings/global_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/global/theme/app_theme.dart';
import 'app/modules/home/view/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Global Theme',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // Apply Light Theme
      darkTheme: AppTheme.darkTheme,
      // Apply Dark Theme
      themeMode: ThemeMode.system,
      // Switches between light and dark based on system settings
      home: HomeScreen(),
      initialBinding: GlobalBinding(),
    );
  }
}
