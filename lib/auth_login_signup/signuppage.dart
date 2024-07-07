import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import fluttertoast package

import 'loginapge.dart';

class signuppage extends StatefulWidget {
  signuppage({Key? key});

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController Confirmpasswordcontroller =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  // Method to show toast message
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backgoundsign.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 75),
                Container(
                  height: 150,
                  child: ClipOval(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: "Email Address",
                            labelStyle: TextStyle(color: Colors.black),
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
                        SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: Confirmpasswordcontroller,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: "Confirm Password",
                            hintText: "Confirm Password",
                            labelStyle: TextStyle(color: Colors.black),
                            hintStyle: TextStyle(color: Colors.white60),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != passwordcontroller.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              try {
                                await _auth.createUserWithEmailAndPassword(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text,
                                );
                                print("Successfully signed up");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Loginpage(),
                                  ),
                                );
                              } on FirebaseAuthException catch (e) {
                                print(e);
                                showToast(e.message!); // Use showToast method
                              } catch (e) {
                                showToast("Unexpected error occurred");
                              }
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: Row(
                            children: [
                              Text(
                                "I already have an account!",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Loginpage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
