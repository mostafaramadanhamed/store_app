import 'dart:convert';
import 'package:app01/helper/api.dart';
import 'package:http/http.dart' as http;
class AllCategory{
  Future<List<dynamic>> getAllCategory() async {

      List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/categories');
      return data;

  }
}