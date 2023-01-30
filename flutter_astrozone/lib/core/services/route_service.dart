import 'package:flutter/material.dart';
import 'package:flutter_astrozone/core/consts/horizontal.dart';
import 'package:flutter_astrozone/core/consts/routes.dart';
import 'package:flutter_astrozone/ui/screens/first_page.dart';
import 'package:flutter_astrozone/ui/screens/home_page.dart';
import 'package:flutter_astrozone/ui/screens/splash_screen.dart';
import 'package:flutter_astrozone/ui/screens/compatibility_screen.dart';
import 'package:flutter_astrozone/ui/widgets/horizontal_compatibility.dart';
import 'package:flutter_astrozone/ui/widgets/horizontal_detail.dart';
import 'package:flutter_astrozone/ui/widgets/horizontal_item.dart';

import '../../main.dart';

class RouteService {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.horizontalItem:
        return MaterialPageRoute(
          builder: (context) =>
              HorizontalItem(text: settings.arguments as String),
        );
      case Routes.firstPage:
        return MaterialPageRoute(
          builder: (context) => const FirstPage(),
        );
      case Routes.horizontalDetail:
        return MaterialPageRoute(
          builder: (context) =>
              HorizontalDetail(),
              settings: RouteSettings(arguments: settings.arguments)
        );
      case Routes.zodiacCompatibility:
        return MaterialPageRoute(
          builder: (context) => const ZodiacCompatibility(),
        );
      case Routes.horizontalCompatibility:
        return MaterialPageRoute(
          builder: (context) => const HorizontalCompatibility(),
          settings: RouteSettings(arguments: settings.arguments)
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Empty(),
        );
    }
  }
}
//HorizontalItem(horizontal: settings.arguments as Horizontal))
