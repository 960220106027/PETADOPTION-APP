import 'package:flutter/material.dart';
import 'package:petadoptionapp/Screens/CategoryScreen/CategoryScreen.dart';
import 'package:petadoptionapp/Screens/ProfileScreen/profile%20screen.dart';
import 'package:petadoptionapp/Screens/favorites/favoriteScreen.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';
import 'package:petadoptionapp/Screens/homeScreen/homeScreen1.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen1(),
    Categoryscreen(),
    FavouriteScreen(),
    
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinkish,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Favorites',
            ),
            
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: pink,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
