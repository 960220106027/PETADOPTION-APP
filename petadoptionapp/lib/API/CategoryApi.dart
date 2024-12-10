import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;
import 'package:petadoptionapp/Model/CategoryModel.dart';


class CategoryProvider with ChangeNotifier {
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

  List<Categories> _products = [];
  List<Categories> get products {
    return [..._products];
  }

  Future getAllCategoryData({required BuildContext context}) async {
    try {
      _isLoading = true;

      var response = await https.get(Uri.parse(
        "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_categories.php",
      ));

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_categories.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _products = [];
        var extractedData = json.decode(response.body);

        final List<dynamic> categories = extractedData['categories'];
        for (var i = 0; i < categories.length; i++) {
          _products.add(
            Categories(
              id: categories[i]['id'].toString(),
              name: categories[i]['name'].toString(),
              photo: categories[i]['photo'].toString(),
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
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
}
