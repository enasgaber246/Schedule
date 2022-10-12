import 'package:flutter/material.dart';

import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/schedule_task/presentation/screens/schedule_screen.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
     home: ScheduleScreen(),
    );
  }
}