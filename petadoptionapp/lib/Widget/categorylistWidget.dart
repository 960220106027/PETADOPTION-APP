import 'package:flutter/material.dart';
import 'package:petadoptionapp/Screens/CategoryDetails/CategoryGrid.dart';


class ListCategoryWidget extends StatefulWidget {
  final String id;
  final String name;
  final String photo;
  const 
  ListCategoryWidget({super.key,required this.id,required this.name,required this.photo});


  @override
  State<ListCategoryWidget> createState() => _ListCategoryWidgetState();
}

class _ListCategoryWidgetState extends State<ListCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () {
            Navigator.of(context)
                .pushNamed(CategoryGrid.routesname ,arguments:widget.id);
      },
      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(3.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:NetworkImage(widget.photo),
                            ),
                          ),
                          Text(widget.name),
                        ],
                      ),
    );
  }
}



