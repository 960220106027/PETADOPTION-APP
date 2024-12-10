import 'package:flutter/material.dart';
import 'package:petadoptionapp/Screens/ProfileScreen/EditProfile%20Screen.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: pink,
        leading: Icon(Icons.arrow_back_ios),
      ),
      backgroundColor: pinkish,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/female.png"),
                    ),
                    Positioned(
                        bottom: 2,
                        right: 0,
                        child: CircleAvatar(
                            child: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ))),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                "Anusha",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text("anusha@gmail.com", style: TextStyle(fontSize: 18)),
              SizedBox(
                height: size.height * 0.04,
              ),
               
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: pink),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(),
                        ));
                  },
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.settings,
                              size: 30,
                              color: Colors.black,
                            )),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.pets,
                              size: 30,
                              color: Colors.black,
                            )),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Text(
                          "Adopted Pets",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.alarm,
                              size: 30,
                              color: Colors.black,
                            )),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Text(
                          "Application Status",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.black,
                            )),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Text(
                          "User Management",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.info_outline,
                              size: 30,
                              color: Colors.black,
                            )),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Text(
                          "Information",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        SizedBox(
                          width: 120,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.logout,
                              size: 30,
                              color: Colors.red,
                            )),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(fontSize: 25, color: Colors.red),
                        ),
                        SizedBox(
                          width: 120,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
