import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petadoptionapp/API/CategoryDetailApi.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';
import 'package:petadoptionapp/Widget/CategoryDetailList.dart';

import 'package:provider/provider.dart';

class CategoryGrid extends StatefulWidget {
  final String id;
  static const routesname = 'all_categorieslist_screen';
  const CategoryGrid({super.key, required this.id});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
  void initState() {
    Provider.of<CategoryDetailProvider>(context, listen: false)
        .getAllCategoryDetailData(context: context, categoryid: widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detailcategory = Provider.of<CategoryDetailProvider>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: pinkish,
        appBar: AppBar(
          backgroundColor: pink,
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            "Dogs",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: detailcategory.loadingSpinner
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading'),
                  CircularProgressIndicator(
                    color: Colors.black,
                  ),
                  SizedBox(width: 10)
                ],
              )
            : detailcategory.products.isEmpty
                ? Center(child: Text('No Category pets'))
                : SizedBox(
                    child: GridView.builder(
                      itemCount: detailcategory.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.9),
                      itemBuilder: (context, index) {
                        return CategoryDetailWidget(
                          petid: detailcategory.products[index].petid,
                          breed: detailcategory.products[index].breed,
                          photo: detailcategory.products[index].photo,
                        );
                      },
                    ),
                  ));
  }
}
