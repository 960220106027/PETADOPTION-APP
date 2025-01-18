import 'package:flutter/material.dart';
import 'package:petadoptionapp/API/AdoptionStatusAPI.dart';
import 'package:petadoptionapp/API/CategoryApi.dart';
import 'package:petadoptionapp/API/CategoryDetailApi.dart';
import 'package:petadoptionapp/API/PetshopApi.dart';
import 'package:petadoptionapp/API/favoriteApi.dart';
import 'package:petadoptionapp/Screens/CategoryDetails/CategoryGrid.dart';
import 'package:petadoptionapp/Screens/Help%20and%20Support/help.dart';
import 'package:petadoptionapp/Screens/PetDetailScreen/Detailscreen.dart';
import 'package:petadoptionapp/Screens/homeScreen/HomeScreen.dart';
import 'package:petadoptionapp/Screens/homeScreen/homeScreen1.dart';


import 'package:provider/provider.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PetProvider(),),
        ChangeNotifierProvider(create: (context) => CategoryProvider(),),
        ChangeNotifierProvider(create: (context) => CategoryDetailProvider(),),
        ChangeNotifierProvider(create: (context) => FavoriteProvider(),),
        ChangeNotifierProvider(create: (context) => AdoptionStatusProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:HomeScreen(),
        routes: {
          'all_pets_screen':(context)=>HomeScreen1(),
          'all_Categories_screen':(context)=>HomeScreen(),
          'all_categorydetails_screen':(context)=>HomeScreen(),
          'all_favorite_screen':(context)=>HomeScreen(),
          'all_AdoptionStatus_screen':(context)=>HomeScreen(),
           'all_details_screen': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return DetailPage(
      id: id,
    );
  },
    'all_categorieslist_screen': (context) {
    var data = ModalRoute.of(context)!.settings.arguments;
    if (data is String) {
      return CategoryGrid(id: data);
    } else if (data is Map<String, dynamic>) {
      return CategoryGrid(id: data['category_id']);
    } else {
      print('Unexpected argument type: ${data.runtimeType}');
      return const Scaffold(
        body: Center(
          child: Text(''),
        ),
      );
    }
  },
          
        },
      ),
    );
  }
}

