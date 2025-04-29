import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'signup_page.dart';
import 'widgets/input_field.dart';
import 'widgets/button.dart';
import 'package:my_app/screens/home_screen.dart';

var store = GetStorage();

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  void login() {
    String username = usernameController.text;

    store.write("username", username);
    Get.snackbar(
      "Welcome",
      "Welcome to Otaxi",
      colorText: Colors.white,
      backgroundColor: Colors.brown,
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.to(() => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Otaxi.Co"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/otaxi.png", width: 150, height: 150),
            const Text(
              "Login Page",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            InputField(
              hintText: "Username",
              controller: usernameController,
              icon: Icons.account_circle,
            ),
            const SizedBox(height: 10),
            InputField(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
              icon: Icons.lock,
            ),
            const SizedBox(height: 20),
            CustomButton(text: "Login", onPressed: login),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Get.to(() => SignupPage());
              },
              child: const Text("Don't have an account? Sign Up"),
            ),
            const SizedBox(height: 180),
            const Text(
              "'explore cities with us'",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
