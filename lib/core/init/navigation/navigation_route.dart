import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_core_library/view/test_view.dart';

import '/core/widget/card/not_found_navigation_card.dart';
import '../../constant/navigation/navigation_constants.dart';

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
          builder: (context) => const NotFoundNavigationCard(),
        );
    }
  }

  String? initialRoute() {}

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }
}
