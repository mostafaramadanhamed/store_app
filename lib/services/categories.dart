
import 'dart:convert';

import 'package:app01/helper/api.dart';
import 'package:app01/models/products_model.dart';

import 'package:http/http.dart' as http;

class Categories {
  Future<List<ProductModel>> getCategories({required String categoryName}) async {
    List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');

      List<ProductModel> ProductsList = [];
      for (int i = 0; i < data.length; i++) {
        ProductsList.add(
          ProductModel.fromJson(data[i]),
        );
      }
      return ProductsList;
  }
}
