import 'package:flutter/material.dart';
import 'package:flutter_my_core_library/core/component/view/no_navigation_view.dart';
import 'package:flutter_my_core_library/core/constant/navigation/navigation_constants.dart';

import '../../../view/test_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST:
        return normalNavigate(const TestView(), NavigationConstants.TEST);
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationView(),
        );
    }
  }

  String? initialRoute() {
    return NavigationConstants.TEST;
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }
}
