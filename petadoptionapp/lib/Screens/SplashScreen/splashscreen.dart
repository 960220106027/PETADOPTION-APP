import 'package:flutter/material.dart';
import 'package:petadoptionapp/Screens/RegistrationScreen/LoginScreen.dart';



class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
  super.initState();
  navigationhome();
}

navigationhome() async{
  await Future.delayed(Duration(seconds: 5));

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
}

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/splashscreen.jpg"),fit: BoxFit.cover),),
        
        
      ),
    );
  }
}