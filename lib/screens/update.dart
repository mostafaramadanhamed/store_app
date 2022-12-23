import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../models/products_model.dart';
import '../services/update_products.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_fom_field.dart';


class UpdateProductPage extends StatefulWidget {
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
    ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextFormFiled(
                  onChange: (data) {
                    productName = data;
                  },
                  hint: 'Product Name',
                  type: TextInputType.name,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  onChange: (data) {
                    desc = data;
                  },
                  hint: 'description',
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  onChange: (data) {
                    price = data;
                  },
                  hint: 'price',
                  type: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  onChange: (data) {
                    image = data;
                  },
                  hint: 'image',
                  type: TextInputType.url,
                ),
                SizedBox(
                  height: 70,
                ),
                CustomButton(
                  text: 'Update',
                  onTab: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);

                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductServices().updateProducts(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
