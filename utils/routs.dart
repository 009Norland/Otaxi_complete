import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_app/login_page.dart';
import 'package:my_app/screens/home_screen.dart';

List <GetPage> myroutes=[
  GetPage(name: "/", page:() => LoginPage()),
  GetPage(name: "/HomeScreen", page: () => HomeScreen()),
];