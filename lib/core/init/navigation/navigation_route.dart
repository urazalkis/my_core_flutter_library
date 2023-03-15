import 'package:flutter/material.dart';
import 'package:flutter_my_core_library/view/test_view.dart';

import '../../constant/navigation/navigation_constant.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      /*case NavigationConstant.LOGIN:
        return normalNavigate(LoginView(), NavigationConstant.LOGIN);*/
      default:
        return MaterialPageRoute(
          builder: (context) => const TestView(),
        );
    }
  }

  String? initialRoute() {
    return NavigationConstant.TEST;
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }

  MaterialPageRoute argNavigate(Widget widget, String pageName, String data) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName, arguments: data));
  }
}
