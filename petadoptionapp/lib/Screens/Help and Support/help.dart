import 'package:flutter/material.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';

import 'package:url_launcher/url_launcher.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
 void launchEmailSubmission() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'mailto:myownemailaddress@gmail.com',
      queryParameters: {
        'subject': 'Default Subject',
        'body': 'Default body'
      }
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        title: Text("Help & Support"),
        centerTitle: true,
      ),
      backgroundColor: pinkish,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Support",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
               SizedBox(
                height: size.height * 0.02,
              ),
              Text("Let us know your feedback & queries"),
              SizedBox(
                height: size.height * 0.1,
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Call us",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        width: size.width * 0.62,
                      ),
                      Icon(Icons.call, color: Colors.white),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  launchEmailSubmission();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Email us",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        width: size.width * 0.6,
                      ),
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "Feedback",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text("Enter your feedback"),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Your feedback here',
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: pink),
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
