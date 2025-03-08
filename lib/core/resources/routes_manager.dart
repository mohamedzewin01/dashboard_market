import 'package:flutter/material.dart';

import '../../features/layout/presentation/pages/layout_view.dart';


class RoutesManager {
  static const String welcomeScreen = '/welcomeScreen';
  static const String splashScreen = '/';
  static const String registrationScreen = '/registration';

  // static const String dashboardScreen = '/dashboard';
  static const String homeScreen = '/products';
  static const String layout = '/layout';
  static const String categories = '/categories';
  static const String cartScreen = '/cart';
  static const String profile = '/profile';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashScreen:
        return MaterialPageRoute(builder: (_) => LayoutScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
