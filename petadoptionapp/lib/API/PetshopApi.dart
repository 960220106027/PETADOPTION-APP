import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:petadoptionapp/Model/PetModel.dart';


class PetProvider with ChangeNotifier {
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

  List<PetDetails> _products = [];
  List<PetDetails> get products {
    return [..._products];
  }

  List<PetDetails> _searchproducts = [];
  List<PetDetails> get searchproducts {
    return [..._searchproducts];
  }

  List<PetDetails> _filterproducts = [];
  List<PetDetails> get filterproducts {
    return [..._filterproducts];
  }



  
  Future getAllPetData({required BuildContext context}) async {
    try {
      _isLoading = true;
      var response = await https.get(
        Uri.parse("http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/viewallpets.php"),
      );

      if (response.statusCode == 200) {
        _isLoading = false;
        _products = [];
        _filterproducts=[];
        var extractedData = json.decode(response.body);

        final List<dynamic> petDetails = extractedData['petDetails'];
        for (var i = 0; i < petDetails.length; i++) {
          _products.add(
            PetDetails(
              petid: petDetails[i]['petid'].toString(),
              name: petDetails[i]['name'].toString(),
              species: petDetails[i]['species'].toString(),
              breed: petDetails[i]['breed'].toString(),
              age: petDetails[i]['age'].toString(),
              sex: petDetails[i]['sex'].toString(),
              color: petDetails[i]['color'].toString(),
              weight: petDetails[i]['weight'].toString(),
              dob: petDetails[i]['dob'].toString(),
              microchipid: petDetails[i]['microchipid'].toString(),
              aid: petDetails[i]['aid'].toString(),
              diet: petDetails[i]['diet'].toString(),
              behaviour: petDetails[i]['behaviour'].toString(),
              status: petDetails[i]['status'].toString(),
              notes: petDetails[i]['notes'].toString(),
              addeddate: petDetails[i]['addeddate'].toString(),
              price: petDetails[i]['price'].toString(),
              photo: petDetails[i]['photo'].toString(),
            ),
          );
        }
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      print('Error fetching all pet data: ' + e.toString());
      _isLoading = false;
      _isSelect = false;
      notifyListeners();
    }
  }

  
  Future<void> search(dynamic? query) async {
    _isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse('http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/search_pet.php?keyword=$query');
      final response = await https.get(url);

      if (response.statusCode == 200) {
        _searchproducts = [];
        var extractedData = json.decode(response.body);
        
        final List<dynamic> petDetails = extractedData['petDetails'];
        for (var i = 0; i < petDetails.length; i++) {
          _searchproducts.add(
            PetDetails(
              petid: petDetails[i]['petid'].toString(),
              name: petDetails[i]['name'].toString(),
              species: petDetails[i]['species'].toString(),
              breed: petDetails[i]['breed'].toString(),
              age: petDetails[i]['age'].toString(),
              sex: petDetails[i]['sex'].toString(),
              color: petDetails[i]['color'].toString(),
              weight: petDetails[i]['weight'].toString(),
              dob: petDetails[i]['dob'].toString(),
              microchipid: petDetails[i]['microchipid'].toString(),
              aid: petDetails[i]['aid'].toString(),
              diet: petDetails[i]['diet'].toString(),
              behaviour: petDetails[i]['behaviour'].toString(),
              status: petDetails[i]['status'].toString(),
              notes: petDetails[i]['notes'].toString(),
              addeddate: petDetails[i]['addeddate'].toString(),
              price: petDetails[i]['price'].toString(),
              photo: petDetails[i]['photo'].toString(),
            ),
          );
        }
        notifyListeners();
      } else {
        print('Search API returned an error: ${response.statusCode}');
      }
    } on HttpException catch (e) {
      print('Error in search: ' + e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
