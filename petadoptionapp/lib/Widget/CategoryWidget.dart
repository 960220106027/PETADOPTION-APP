import 'package:flutter/material.dart';
import 'package:petadoptionapp/Screens/CategoryDetails/CategoryGrid.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';

import 'package:provider/provider.dart';

class Categorywidget extends StatefulWidget {
  final String id;
  final String name;
  final String photo;
  const Categorywidget({super.key,required this.id,required this.name,required this.photo});

  @override
  State<Categorywidget> createState() => _CategorywidgetState();
}

class _CategorywidgetState extends State<Categorywidget> {
 
  
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return 
    InkWell(
      onTap: () {
            Navigator.of(context)
                .pushNamed(CategoryGrid.routesname ,arguments:widget.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          
          height:size.height*0.099,
          decoration: BoxDecoration(border:Border.all(color: pink)),
          child:Row(
            
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: CircleAvatar(radius: 40,backgroundImage: NetworkImage(widget.photo),),
              ),
              SizedBox(width: size.width*0.07,),
              Text(widget.name,style: TextStyle(fontSize: 23,),)
            ],
          ),
        ),
      ),
    );;
  }
}