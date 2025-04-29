import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'widgets/input_field.dart';
import 'login_page.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxBool isPasswordHidden = true.obs;
  final RxBool isConfirmPasswordHidden = true.obs;

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Image.asset("assets/images/otaxi.png", width: 150, height: 150),
              Text(
                "Create Account",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              InputField(
                controller: userIdController,
                icon: Icons.account_circle,
                hintText: "User ID",
              ),
              const SizedBox(height: 10),
              InputField(
                controller: fullNameController,
                icon: Icons.person,
                hintText: "Full Name",
              ),
              const SizedBox(height: 10),
              InputField(
                controller: phoneController,
                icon: Icons.phone,
                hintText: "Phone",
              ),
              const SizedBox(height: 10),
              InputField(
                controller: usernameController,
                icon: Icons.person,
                hintText: "Username",
              ),
              const SizedBox(height: 10),
              InputField(
                controller: emailController,
                icon: Icons.email,
                hintText: "Email",
              ),
              const SizedBox(height: 10),

              Obx(
                () => TextField(
                  controller: passwordController,
                  obscureText: isPasswordHidden.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        isPasswordHidden.value = !isPasswordHidden.value;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Obx(
                () => TextField(
                  controller: confirmPasswordController,
                  obscureText: isConfirmPasswordHidden.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        isConfirmPasswordHidden.value =
                            !isConfirmPasswordHidden.value;
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              MaterialButton(
                onPressed: () async {
                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    Get.snackbar("Error", "Passwords don't match");
                  } else {
                    var headers = {
                      'Content-Type': 'application/x-www-form-urlencoded',
                    };
                    var request = http.Request(
                      'POST',
                      Uri.parse('http://localhost/otaxi/read.php'),
                    );
                    request.bodyFields = {
                       'userid': userIdController.text,
                      'fullname': fullNameController.text,
                      'phonenumber': phoneController.text,
                      'username': usernameController.text,
                      'email': emailController.text,
                      'password': passwordController.text,
                    };
                    request.headers.addAll(headers);

                    http.StreamedResponse response = await request.send();

                    if (response.statusCode == 200) {
                      print(await response.stream.bytesToString());

                    } else {
                      print(response.reasonPhrase);
                    }
                    if (response.statusCode == 200) {
                     Get.snackbar("Success", "Account created successfully");
                          Get.to(() => LoginPage()); 
                        } else {
                          Get.snackbar("Error", "Failed to create account");
                         }

                  //  // try {
                  //     var response = await http.post(
                  //       Uri.parse("http://localhost/otaxi/read.php"),
                  //       // headers: {
                  //       //   'Content-Type': 'application/x-www-form-urlencoded',
                  //       // },
                  //       body: requestData,
                  //     );

                  //     // Print the response from the server
                  //     print(response.body);
                  //            print(response.statusCode);

                  //     // Check the response status and show success or error messages
                  //     if (response.statusCode == 200) {
                  //       Get.snackbar("Success", "Account created successfully");
                  //       Get.to(() => LoginPage()); // Redirect to login page
                  //     } else {
                  //       Get.snackbar("Error", "Failed to create account");
                  //     }
                  //  // } catch (e) {
                  //     print("Error occurred: $e");
                  //     Get.snackbar(
                  //       "Error",
                  //       "An error occurred while processing your request",
                  //     );
                  //  // }
                  }
                },
                color: Colors.brown,
                child: const Text(
                  "SignUp",
                  style: TextStyle(color: Colors.yellow),
                ),
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  Get.to(() => LoginPage());
                },
                child: const Text("Already have an account? Login"),
              ),
              const SizedBox(height: 5),
              const Text(
                "'explore cities with us'",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
