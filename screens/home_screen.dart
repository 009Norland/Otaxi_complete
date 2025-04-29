import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_app/controllers/home_screen_controller.dart';
import 'package:my_app/screens/dashboard.dart';
import 'package:my_app/screens/orders.dart';
import 'package:my_app/screens/products.dart';
import 'package:my_app/screens/profile.dart';
import 'package:my_app/screens/settings.dart'; 

HomeScreenController homeScreenController = HomeScreenController();
var myScreens = [
  DashBoard(),
  Products(),
  Orders(),
  Profile(),
]; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otaxi.Co"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.yellow,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings), 
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ), 
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: 
          [ BottomNavigationBarItem(icon: Icon(Icons.home),label: "Dashboard",),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "Products"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Orders"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
          unselectedItemColor: Colors.blueGrey,
          selectedItemColor: Colors.brown,
          currentIndex: homeScreenController.selectedPageIndex.value,
          onTap: (index) => homeScreenController.UpdateSelection(index),
          showUnselectedLabels: true,
        ),
      ),
      body: Obx(() => myScreens[homeScreenController.selectedPageIndex.value]),
    );
  }
}
