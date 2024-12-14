import 'package:e_commerce/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../screens/home/home_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      // case Routes.details:
      //   return MaterialPageRoute(
      //     builder: (context) =>  DetailsScreen(
      //       product: ,
      //     ),
      //   );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
