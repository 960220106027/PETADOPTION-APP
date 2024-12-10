import 'package:flutter/material.dart';
import 'package:petadoptionapp/Screens/PetDetailScreen/Detailscreen.dart';


import 'package:provider/provider.dart';
import '../Screens/homeScreen/colors.dart';

class CategoryDetailWidget extends StatefulWidget {
  final String petid;
  final String breed;
  final String photo;

  const CategoryDetailWidget({
    super.key,
    required this.petid,
    required this.breed,
    required this.photo,
  });

  @override
  State<CategoryDetailWidget> createState() => _CategoryDetailWidgetState();
}

class _CategoryDetailWidgetState extends State<CategoryDetailWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
                .pushNamed(DetailPage.routename ,arguments:widget.petid); 
        },
        child: Container(
          
          color: pink,
          child: Column(
            children: [
             Container(
                    height: size.height * 0.18,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.photo),
                        fit: BoxFit.cover,
                      ),
                     
                    ),
                  ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                widget.breed,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
