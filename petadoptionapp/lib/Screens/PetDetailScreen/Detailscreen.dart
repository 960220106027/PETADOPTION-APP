import 'package:flutter/material.dart';
import 'package:petadoptionapp/API/PetshopApi.dart';
import 'package:petadoptionapp/API/favoriteApi.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';

import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  static const routename = 'all_details_screen';
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final pets = Provider.of<PetProvider>(context);
    final fav=Provider.of<FavoriteProvider>(context);
    final petdata = Provider.of<PetProvider>(context, listen: false)
        .products
        .firstWhere((element) => element.petid == widget.id);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: pinkish,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.55,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(petdata.photo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text(
                petdata.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("DOB : ${petdata.dob}"),
              trailing: IconButton(
                  onPressed: () {
                    fav.addItemToFavourites( petid: widget.id,userid: '1');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Pet added successfully'),duration: Duration(seconds: 4),));
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    size: 30,
                  )),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height * 0.08,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: pink),
                  child: Column(
                    children: [
                      Text(
                        petdata.sex,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("Sex"),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.08,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: pink),
                  child: Column(
                    children: [
                      Text(
                        petdata.age,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("Age"),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.08,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: pink),
                  child: Column(
                    children: [
                      Text(
                        petdata.weight,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("Weight"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/female.png"),
              ),
              title: Text("Anusha"),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                petdata.behaviour,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 50), backgroundColor: pink),
                onPressed: () {},
                child: Text(
                  "Adopt Me",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 158, 237, 178)),
                )),
          ],
        ),
      ),
    );
  }
}
