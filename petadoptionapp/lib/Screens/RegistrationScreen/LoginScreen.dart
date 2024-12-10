import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:petadoptionapp/Screens/RegistrationScreen/signup.dart';
import 'package:petadoptionapp/Screens/homeScreen/HomeScreen.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';


class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<void> registerAdopter(
    String email,
    String password,
  ) async {
    const url = 'http://campus.sicsglobal.co.in/Project/pet_shop/api/login.php';

    Map<String, String> body = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: const Text(
                'Login Successful!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
          print(body);
          print("Response body${response.body}");
        }
        print(body);
        print("Response body${response.body}");
        print('Registration successful');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.white,
            content: Text(
              'Already email and password Exists',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            duration: Duration(seconds: 4),
          ),
        );
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: pinkish,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome!",
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 133, 46),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              Text(
                "A journey of new love begins here",
                style: TextStyle(
                    color: const Color.fromARGB(255, 230, 93, 34),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(height: size.height * 0.04),
              TextFormField(
                validator: (value) {
                  if (emailcontroller.text.isEmpty) {
                    return "please enter your Email";
                  } else {
                    return null;
                  }
                },
                controller: emailcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    prefixIcon: Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(90)),
                    hintText: "Enter Email",
                    prefixIconColor: Colors.black,
                    hintStyle: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: size.height * 0.04),
              TextFormField(
                validator: (value) {
                  if (passwordcontroller.text.isEmpty) {
                    return "please enter your password";
                  } else {
                    return null;
                  }
                },
                controller: passwordcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(90)),
                    hintText: "Enter Password",
                    prefixIconColor: Colors.black,
                    hintStyle: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: size.height * 0.04),
              Text(
                "Forgot Password?",
                style: TextStyle(
                    color: Color.fromARGB(255, 254, 75, 55),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.04),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 230, 93, 34)),
                  onPressed: () {
                    registerAdopter(emailcontroller.text.toString(),
                        passwordcontroller.text.toString());
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  )),
              SizedBox(height: size.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "It's your first time here? ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignPage()));
                      },
                      child: Text(
                        "sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
