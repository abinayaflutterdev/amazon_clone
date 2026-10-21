import 'package:amazon_clone/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_rating.dart';

class CustomProductdetail extends StatelessWidget {

  final String image;
  final String productName;
  final String unit;
  final double price;
  final String description;
  final VoidCallback ofAddToCart;

  const CustomProductdetail({
    super.key,
    required this.image,
    required this.productName,
    required this.unit,
    required this.price,
    required this.description,
    required this.ofAddToCart
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.h,),
          CustomRating(
            rating: 4,
          ),
          SizedBox(height: 3.h,),
          Container(
            height: 38.0.h,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade100,Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.55,0.55],),
            ),
            child: Image.asset(
                image,
                fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 2.0.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 3.0.sh
              ),
              ),
              Text('₹$price',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 3.0.sh
              ),
              ),
            ],
          ),
          SizedBox(height: 1.0.h,),
          Text(unit,style: TextStyle(color: Colors.black,fontSize: 2.0.sh),),

          SizedBox(height: 2.0.h,),
          Text(description,
            style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 2.0.sh),),

          SizedBox(height: 5.0.h,),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(70.0.w, 6.0.h),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0.sh))),
                onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ShoppingCartScreen(
                  cartItem: [{
                    'productName': productName,
                    'image': image,
                    'unit': unit,
                    'price': price,
                  },], )));
                },
                child: Text('Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 2.0.sh,
                  fontWeight: FontWeight.bold),),
            ),
          )
        ],
      ),
    );
  }
}
