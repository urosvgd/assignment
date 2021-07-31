import 'package:flutter/material.dart';
import 'package:moja_garaza/garage_page.dart';
import 'package:moja_garaza/main_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/garage':
        // Validation of correct data type
        return MaterialPageRoute(
          builder: (_) => GaragePage(),
        );

        // Validation of correct data type

        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.

        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
