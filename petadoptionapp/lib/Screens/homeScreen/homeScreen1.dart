import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petadoptionapp/API/CategoryApi.dart';
import 'package:petadoptionapp/API/CategoryDetailApi.dart';
import 'package:petadoptionapp/API/PetshopApi.dart';
import 'package:petadoptionapp/Model/PetModel.dart';
import 'package:petadoptionapp/Screens/Help%20and%20Support/help.dart';
import 'package:petadoptionapp/Screens/MyAdoptionScreen/AdoptionStatusScreen.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';
import 'package:petadoptionapp/Widget/PetWidget.dart';
import 'package:petadoptionapp/Widget/categorylistWidget.dart';

import 'package:provider/provider.dart';

class HomeScreen1 extends StatefulWidget {
  static const routename = 'all_pets_screen';
  static const routeename = 'all_categories_screen';
  static const routesname = 'all_categoriesdetail_screen';

  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
    TextEditingController filtercontroller = TextEditingController();
  @override
  void initState() {
    Provider.of<PetProvider>(context, listen: false)
        .getAllPetData(context: context);
    Provider.of<CategoryProvider>(context,listen: false).getAllCategoryData(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pet = Provider.of<PetProvider>(context);
    final category = Provider.of<CategoryProvider>(context);
    final detailcategory = Provider.of<CategoryDetailProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        title: Text(
          "Pets Adoption & care",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/female.png"),
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: pinkish.withOpacity(0.8),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: pink.withOpacity(0.8),
              ),
              accountName: Text(
                "Anusha",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "anusha@gmail.com",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/female.png"),
              ),
            ),
             ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.pets),
              ),
              title: InkWell(
                onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => (),));
                 },
                child: Text("All Pets")),
            ),
             ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.category),
              ),
              title: InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HelpSupport(),));
                },
                child: Text("Categories")),
            ),

            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.pets),
              ),
              title: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdoptionStatus(),));
                },
                child: Text("My Adoptions")),
            ),
             ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.message),
              ),
              title: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HelpSupport(),));
                },
                child: Text("Help & Support")),
            ),
           
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: pinkish,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFormField(
                controller: filtercontroller,
                onChanged: (value) {
                  if(value!=''){
                    String searchquery=value.toLowerCase();
                    pet.search(searchquery);
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(90)),
                    hintText: "Search",
                    prefixIconColor: Colors.black,
                    hintStyle: TextStyle(color: Colors.black)),
              ),
              Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                height: size.height * 0.12,
                child: ListView.builder(
                  itemCount: category.products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ListCategoryWidget(
                      id: category.products[index].id,
                      name: category.products[index].name,
                      photo: category.products[index].photo,
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text("All Pets",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.02),
              pet.loadingSpinner
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Loading'),
                        CircularProgressIndicator(
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  : pet.products.isEmpty
                      ? Center(child: Text('No Pets...')):pet.searchproducts.isEmpty&&filtercontroller.text.isNotEmpty?Text('No Pets Availble'):
                      pet.searchproducts.isNotEmpty&&filtercontroller.text.isNotEmpty?
                      SizedBox(
                          height: size.height * 0.9,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.75,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15),
                            scrollDirection: Axis.vertical,
                            itemCount: pet.searchproducts.length,
                            itemBuilder: (context, intex) {
                              return PetWidget(
                                id: pet.searchproducts[intex].petid,
                                name: pet.searchproducts[intex].name,
                                photo: pet.searchproducts[intex].photo,
                                age: pet.searchproducts[intex].age,
                                sex: pet.searchproducts[intex].sex,
                              );
                            },
                          ),
                        )



                      : SizedBox(
                          height: size.height * 0.9,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.73,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15),
                            scrollDirection: Axis.vertical,
                            itemCount: pet.products.length,
                            itemBuilder: (context, intex) {
                              return PetWidget(
                                id: pet.products[intex].petid,
                                name: pet.products[intex].name,
                                photo: pet.products[intex].photo,
                                 age: pet.products[intex].age,
                                sex: pet.products[intex].sex,

                             
                              );
                            },
                          ),
                        ),
            ])),
      ),
    );
  }
}
