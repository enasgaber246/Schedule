import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../features/schedule_task/presentation/screens/schedule_screen.dart';
class Routes {
  static const String initialRoute = '/';
  static const String createTaskRoute = '/createTask';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return  ScheduleScreen();
        });

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        )));
  }
}