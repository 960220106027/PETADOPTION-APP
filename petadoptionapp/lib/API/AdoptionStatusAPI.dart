import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;
import 'package:petadoptionapp/Model/Adoption%20Status%20Model.dart';


class AdoptionStatusProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }

  List<Orders> _products = [];
  List<Orders> get products {
    return [..._products];
  }

  Future getAllAdoptionStatusData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(Uri.parse(
        "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_adoption_status.php?user_id=1",
      ));

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_adoption_status.php?user_id=1");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _products = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> adoptionstatus = extractedData["orders"];
        for (var i = 0; i < adoptionstatus.length; i++) {
          _products.add(
            Orders(
              orderId: adoptionstatus[i]['order_id'].toString(),
              petId: adoptionstatus[i]['pet_id'].toString(),
              userId: adoptionstatus[i]['user_id'].toString(),
              orderStatus: adoptionstatus[i]['order_status'].toString(),
              date: adoptionstatus[i]['date'].toString(),
              name: adoptionstatus[i]['name'].toString(),
              species: adoptionstatus[i]['species'].toString(),
              breed: adoptionstatus[i]['breed'].toString(),
              age: adoptionstatus[i]['age'].toString(),
              sex: adoptionstatus[i]['sex'].toString(),
              color: adoptionstatus[i]['color'].toString(),
              weight: adoptionstatus[i]['weight'].toString(),
              dob: adoptionstatus[i]['dob'].toString(),
              microchipid: adoptionstatus[i]['microchipid'].toString(),
              diet: adoptionstatus[i]['diet'].toString(),
              behaviour: adoptionstatus[i]['behaviour'].toString(),
              petStatus: adoptionstatus[i]['pet_status'].toString(),
              notes: adoptionstatus[i]['notes'].toString(),
              addeddate: adoptionstatus[i]['addeddate'].toString(),
              photo: adoptionstatus[i]['photo'].toString(),
            ),
          );
        }
        ;

        print('product details' + _products.toString());
        _isLoading = false;
        print('products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
}
