import 'package:amazon_clone/products_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/gestures.dart';

class OrderPlaceScreen extends StatefulWidget {
  const OrderPlaceScreen({
    super.key,
  });

  @override
  State<OrderPlaceScreen> createState() => _OrderPlaceScreenState();
}

class _OrderPlaceScreenState extends State<OrderPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(3.0.sh),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 20.0.sh,
              color: Colors.green.shade500,),

         SizedBox(height: 10.0.h,),
          Text('Order Successfully Placed',
            style: TextStyle(fontSize: 3.5.sh,fontWeight: FontWeight.bold),),

            SizedBox(height: 2.0.sh,),
            Text('Your order number is 000000010.',
              style: TextStyle(fontSize: 2.8.sh,fontWeight: FontWeight.w500),),

            SizedBox(height: 2.0.sh,),
            Text('We will email you an order confirmation\n'
                      'with details and tracking info',
              style: TextStyle(fontSize: 2.2.sh,color: Colors.grey.shade600),
            ),

            SizedBox(height: 8.0.h,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                minimumSize: Size(70.0.w, 6.0.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0.sh))
              ),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen(),));
                },
                child: Text('View Shopping Receipt',
                  style: TextStyle(
                      color: Colors.white),)),

            SizedBox(height: 3.0.h,),
            TextButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductsScreen(),));
                },
                child: Text("Exit",
                  style: TextStyle(fontSize: 2.0.sh,color: Colors.blue),))
        ],
        ),
      ),
    );
  }
}
