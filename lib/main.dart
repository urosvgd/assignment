import 'package:moja_garaza/main_page.dart';
import 'package:flutter/material.dart';
import './routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/garage',
      home: MainPage(),
    );
  }
}
