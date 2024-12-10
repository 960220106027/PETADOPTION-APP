import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petadoptionapp/API/CategoryDetailApi.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';

import 'package:provider/provider.dart';

class CategoryDetailPage extends StatefulWidget {
  static const routename = 'all_categorydetails_screen';
  final String id;
  const CategoryDetailPage({super.key, required this.id});

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    final detailcategory = Provider.of<CategoryDetailProvider>(context);
    final categorydata =
        Provider.of<CategoryDetailProvider>(context, listen: false)
            .products
            .firstWhere((element) => element.petid == widget.id);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: pinkish,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(categorydata.photo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text(
                categorydata.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(categorydata.dob),
              trailing: IconButton(
                  onPressed: () {},
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
                        categorydata.sex,
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
                        categorydata.age,
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
                        categorydata.weight,
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
                categorydata.notes,
                style: TextStyle(fontSize: 18),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(400, 50), backgroundColor: pink),
                onPressed: () {},
                child: Text(
                  "Adopt Me",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )),
          ],
        ),
      ),
    );
  }
}
