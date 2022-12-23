import 'package:app01/helper/api.dart';
import 'package:app01/models/products_model.dart';

class UpdateProductServices{
  Future<ProductModel>updateProducts({required String title,required int id ,required String price,required String desc,required String image,required String category, })async{
    Map<String,dynamic>data= await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title':title,
      'price':price,
      'description':desc,
      'image':image,
      'category':category,
    });
    return ProductModel.fromJson(data);
  }
}