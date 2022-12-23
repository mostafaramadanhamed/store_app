
import 'package:app01/models/products_model.dart';
import 'package:app01/screens/update.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    required this.product,
    Key? key,
  }) : super(key: key);
ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 50,
                      color: Colors.grey.withOpacity(.1),
                      spreadRadius: 20,
                      offset: const Offset(10,10)
                  )
                ]
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('${product.title.substring(0,11)}',style:  const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),) ,
                    const SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(r'$' '${product.price}',style:  const TextStyle(
                            color: Colors.black,
                            fontSize: 16
                        ),),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite,color: Colors.red,)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 25,
              top: -60,
              child: Image.network(product.image,height: 100,width: 100,))
        ],
      ),
    );
  }
}