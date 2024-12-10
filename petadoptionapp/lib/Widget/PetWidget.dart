import 'package:flutter/material.dart';
import 'package:petadoptionapp/Screens/PetDetailScreen/Detailscreen.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';


class PetWidget extends StatefulWidget {
  final String id;
  final String name;
  final String photo;
  final String age;
  final String sex;

  const PetWidget(
      {super.key,
      required this.name,
      required this.photo,
      required this.id,
      required this.age,
      required this.sex});

  @override
  State<PetWidget> createState() => _PetWidgetState();
}

class _PetWidgetState extends State<PetWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      id: widget.id,
                    )));
      },
      child: Card(
        elevation: 5,
        color: pink,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height * 0.18,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            widget.photo,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "Name: ${widget.name}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Age: ${widget.age}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
                ),
                Text(
                  widget.sex,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
