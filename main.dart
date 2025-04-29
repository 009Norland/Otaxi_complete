import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/login_page.dart';
import 'package:my_app/utils/routs.dart';

void main() async{
  await GetStorage.init();
  runApp(GetMaterialApp(
   initialRoute: "/",
  getPages: myroutes,
  home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 250, 244),
      ),
      home:LoginPage(),
    );
  }
}