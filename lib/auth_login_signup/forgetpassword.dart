import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgetpassword extends StatelessWidget {
  forgetpassword({super.key});
  final emailcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget password"),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/finalbackgound1.png"),
                    fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelText: "Email Address",
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  auth
                      .sendPasswordResetEmail(
                          email: emailcontroller.text.toString())
                      .then((value) {
                    Get.snackbar("Check Email",
                        "Password reset link sent to your email");
                  });
                },
                child: Text("Forget password"),
              )
            ],
          )
        ],
      ),
    );
  }
}
