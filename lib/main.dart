import 'package:flutter/material.dart';
import 'package:weather_test_app/app_router.dart';
import 'package:weather_test_app/app_strings.dart';
import 'package:weather_test_app/core/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppRouter.routes,
      initialRoute: AppRouter.main,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('Ошибка пути'),
            ),
          );
        });
      },
    );
  }
}
