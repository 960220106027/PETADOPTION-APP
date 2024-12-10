import 'package:flutter/material.dart';
import 'package:petadoptionapp/API/favoriteApi.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';
import 'package:petadoptionapp/Widget/FavoriteWidget.dart';


import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  static const routeName = 'all_favorite_screen';
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    Provider.of<FavoriteProvider>(context, listen: false)
        .getAllFavouriteData(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: pinkish,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        backgroundColor: pink,
        title: Text("Favourites"),
        centerTitle: true,
      ),
      body: fav.loadingSpinner
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('loading'),
                CircularProgressIndicator(
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            )
          : fav.products.isEmpty
              ? Text('No products...')
              : SizedBox(
                  height: size.height * 0.9,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.8),
                    scrollDirection: Axis.vertical,
                    itemCount: fav.products.length,
                    itemBuilder: (context, intex) {
                      return FavouriteWidget(
                        petid: fav.products[intex].petid,
                        name: fav.products[intex].name,
                        favId: fav.products[intex].photo,
                        breed: fav.products[intex].breed,
                        age: fav.products[intex].age,
                        photo: fav.products[intex].photo,
                      );
                    },
                  ),
                ),
    );
  }
}
