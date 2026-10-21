import 'package:amazon_clone/cart_screen/custom_productdetail.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'cart_screen/custom_rating.dart';

class ProductdetailScreen extends StatelessWidget {

  final String image;
  final String productName;
  final double price;
  final String unit;
  final VoidCallback ofAddToCart;
  final String description;

  const ProductdetailScreen({
    super.key,
    required this.image,
    required this.productName,
    required this.price,
    required this.ofAddToCart,
    required this.unit,
    required this.description

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        leading:
        Padding(
          padding: EdgeInsets.only(left: 2.0.sh,top: 1.0.sh),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child:  IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.0,top: 1.0.sh),
            child: CircleAvatar(
              backgroundColor: Colors.white,
                child: Icon(Icons.heart_broken,color: Colors.black,)),
          )
        ],
      ),
      body: SingleChildScrollView(child: Column(children: [
      Padding(
        padding: EdgeInsets.all(2.0.sh),
        child: CustomProductdetail(
            image: image,
            productName: productName,
            unit: unit,
            price: price,
            description: description,
            ofAddToCart: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content:
                  Text('$productName Item selection accepted successfully.')));
            }
        ),
      ),

      ],
      ),
      ),
    );
  }
}
