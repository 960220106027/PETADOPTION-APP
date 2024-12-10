import 'package:flutter/material.dart';
import 'package:petadoptionapp/API/CategoryApi.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';
import 'package:petadoptionapp/Widget/CategoryWidget.dart';

import 'package:provider/provider.dart';

class Categoryscreen extends StatefulWidget {
  static const routeName = 'all_Categories_screen';
  const Categoryscreen({super.key});

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: pinkish,
      appBar: AppBar(
        backgroundColor: pink,
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Categories",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: category.loadingSpinner
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Loading'),
                CircularProgressIndicator(
                  color: pink,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            )
          : category.products.isEmpty
              ? Text('No products...')
              : SizedBox(
                  height: size.height * 0.9,
                  child: ListView.builder(
                    itemCount: category.products.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Categorywidget(
                        id: category.products[index].id,
                        name: category.products[index].name,
                        photo: category.products[index].photo,
                      );
                    },
                  ),
                ),
    );
  }
}
