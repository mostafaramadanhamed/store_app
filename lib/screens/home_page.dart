import 'package:app01/models/products_model.dart';
import 'package:app01/services/get_all_products.dart';
import 'package:flutter/material.dart';

import '../widgets/cusom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
static String id='HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,size: 25,color: Colors.black,)),
        title: Text('New Trend',style: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,size: 25,color: Colors.black,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 90,
                  ),
                  itemBuilder: (context, index){
                    return  CustomCard(product: products[index],);
                  });
            }
            else{
             return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}

