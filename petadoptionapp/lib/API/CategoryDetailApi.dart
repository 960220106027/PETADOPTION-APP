import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;
import 'package:petadoptionapp/Model/CategoryDetail.dart';



class CategoryDetailProvider with ChangeNotifier {
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

  List<CategoryDetail> _products = [];
  List<CategoryDetail> get products {
    return [..._products];
  }

  Future<void>getAllCategoryDetailData({required BuildContext? context,String? categoryid}) async {
    try {
      _isLoading = true;

      var response = await https.get(Uri.parse(
        "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_pets_category.php?category_id=$categoryid",
      ));

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_pets_category.php?category_id=$categoryid");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _products = [];
        var extractedData = json.decode(response.body);

        final List<dynamic> categoriesdetail = extractedData['petDetails'];
        for (var i = 0; i < categoriesdetail.length; i++) {
          _products.add(
            CategoryDetail(
              petid: categoriesdetail[i]['petid'].toString(),
              name: categoriesdetail[i]['name'].toString(),
              species: categoriesdetail[i]['species'].toString(),
              breed: categoriesdetail[i]['breed'].toString(),
              age: categoriesdetail[i]['age'].toString(),
              weight: categoriesdetail[i]['weight'].toString(),
              dob: categoriesdetail[i]['dob'].toString(),
              microchipid: categoriesdetail[i]['microchipid'].toString(),
              sex: categoriesdetail[i]['sex'].toString(),
              color: categoriesdetail[i]['color'].toString(),
              aid: categoriesdetail[i]['aid'].toString(),
              diet: categoriesdetail[i]['diet'].toString(),
              behaviour: categoriesdetail[i]['behaviour'].toString(),
              status: categoriesdetail[i]['status'].toString(),
              notes: categoriesdetail[i]['notes'].toString(),
              addeddate: categoriesdetail[i]['addeddate'].toString(),
              photo: categoriesdetail[i]['photo'].toString(),
            ),
          );
        }
        ;

        print('pet details' + _products.toString());
        _isLoading = false;
        print('pets loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      print('error in pet prod -->>' + e.toString());
      print('Pet Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
}
