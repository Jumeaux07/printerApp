import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printer_app2/pages/connectBt.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Print App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)
        ),
        primarySwatch: Colors.orange,
      ),
      home:  ConnectView(),
    );
  }
}
