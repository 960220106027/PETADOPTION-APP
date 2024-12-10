import 'package:flutter/material.dart';

import 'package:petadoptionapp/API/favoriteApi.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';
import 'package:provider/provider.dart';

class FavouriteWidget extends StatefulWidget {
final String favId;
final String petid;
final String name;
final String age;
final String breed;
final String photo;

  const FavouriteWidget({super.key,required this.favId,required this.petid,required this.name,required this.age,required this.breed,required this.photo});

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
   final fav=Provider.of<FavoriteProvider>(context);
return Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
     
    decoration: BoxDecoration(
      color:pink, 
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: pink,
        child: Column(
          children: [
            Stack(
              children: [
                
                Container(
                  height: size.height * 0.18,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.photo),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                
                Positioned(
                  top: 1,
                  right: 1,
                  child: IconButton(
                    style: IconButton.styleFrom(backgroundColor: pinkish),
                    onPressed: () {
                      fav.deleteFav(widget.favId, context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Pet deleted succesfully')));
                    },
                    icon: Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
             Text(
              widget.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              widget.breed,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    )
  )
);

  }
}