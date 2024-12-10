import 'package:flutter/material.dart';
import 'package:petadoptionapp/API/AdoptionStatusAPI.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';
import 'package:petadoptionapp/Widget/Adoption%20Status%20Widget.dart';


import 'package:provider/provider.dart';

class AdoptionStatus extends StatefulWidget {
  static const routteName = 'all_AdoptionStatus_screen';
  const AdoptionStatus({super.key});

  @override
  State<AdoptionStatus> createState() => _AdoptionStatusState();
}

class _AdoptionStatusState extends State<AdoptionStatus> {
  @override
  void initState() {
    Provider.of<AdoptionStatusProvider>(context, listen: false)
        .getAllAdoptionStatusData(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final adoptStatus = Provider.of<AdoptionStatusProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: pinkish,
      appBar: AppBar(
        backgroundColor:pink,
        title: const Text(
          "My Adoptions",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: adoptStatus.loadingSpinner
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
          : adoptStatus.products.isEmpty
              ? Text('No products...')
              : SizedBox(
                  height: size.height * 0.9,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: adoptStatus.products.length,
                    itemBuilder: (context, index) {
                     return AdoptStatusList(
                        orderId: adoptStatus.products[index].orderId,
                        petId: adoptStatus.products[index].petId,
                        userId: adoptStatus.products[index].userId,
                        name: adoptStatus.products[index].name,
                        age: adoptStatus.products[index].age,
                        orderStatus: adoptStatus.products[index].orderStatus,
                        sex: adoptStatus.products[index].sex,
                        breed: adoptStatus.products[index].breed,
                        photo: adoptStatus.products[index].photo,
                      );
                  },)
                ),
    );
  }
}
