import 'package:flutter/material.dart';
import 'package:petadoptionapp/Screens/homeScreen/colors.dart';


class AdoptStatusList extends StatefulWidget {
  final String orderId;
  final String petId;
  final String userId;
  final String name;
  final String age;
  final String orderStatus;
  final String sex;
  final String breed;
  final String photo;

  const AdoptStatusList(
      {super.key,
      required this.orderId,
      required this.petId,
      required this.userId,
      required this.name,
      required this.age,
      required this.orderStatus,
      required this.sex,
      required this.breed,
      required this.photo});

  @override
  State<AdoptStatusList> createState() => _AdoptStatusListState();
}

class _AdoptStatusListState extends State<AdoptStatusList> {
   Color _statusColor(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return const Color.fromARGB(255, 72, 6, 1); 
    case 'confirmed':
      return const Color.fromARGB(255, 1, 45, 80); 
    case 'delivered':
      return const Color.fromARGB(255, 9, 64, 10); 
    default:
      return Colors.grey; 
  }
}

  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.26,
        decoration:
            BoxDecoration(color: pink.withOpacity(0.6), borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.22,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.photo),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: size.height * 0.25,
                width: size.width * 0.40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 107, 15, 65),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.sex,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.breed,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Age:${widget.age}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                  Card(
  color: pink, 
  elevation: 5,
  child: Padding( 
    padding: const EdgeInsets.all(8.0),
    child: Text(
      "${widget.orderStatus}", 
      style: TextStyle(
        fontSize: 18,
        color: _statusColor(widget.orderStatus), 
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
