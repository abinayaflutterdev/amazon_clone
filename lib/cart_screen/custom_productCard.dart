import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomProductcard extends StatelessWidget {

  final String image;
  final String Name;
  final String unit;
  final double price;
  final VoidCallback onPressed;
  final VoidCallback onTap;
  final String description;

  const CustomProductcard({
    super.key,
    required this.image,
    required this.Name,
    required this.unit,
    required this.price,
    required this.onPressed,
    required this.onTap,
    required this.description

  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.5.sh)),
        margin: EdgeInsets.symmetric(horizontal: 3.0.w,vertical: 0.6.h),
        color: Colors.blue.shade100,
        child: Row(
          children: [
            SizedBox(width: 3.0.w,),
            Image.asset(
              image,
              width: 22.0.w,
              height: 11.0.h,),
            SizedBox(width: 6.0.w,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(text: TextSpan(style: TextStyle(fontSize: 2.0.sh),
                    children: [
                      WidgetSpan(
                        child: SizedBox(height: 5.0.h),),

                      TextSpan(text: "Name:  ", style: TextStyle(fontSize: 2.0.sh,color: Colors.black),),
                      TextSpan(text: "$Name\n",style: TextStyle(fontSize: 2.0.sh,fontWeight: FontWeight.bold,color: Colors.black),),

                      TextSpan(text: "Unit:  ", style: TextStyle(fontSize: 2.0.sh,color: Colors.black),),
                        TextSpan(text: "$unit\n",style: TextStyle(fontSize: 2.0.sh,fontWeight: FontWeight.bold,color: Colors.black),),

                      TextSpan(text: "Price:  ", style: TextStyle(fontSize: 2.0.sh,color: Colors.black),),
                        TextSpan(text :"₹$price\n",style: TextStyle(fontSize: 2.0.sh,fontWeight: FontWeight.bold,color: Colors.black),),

                  ],
            ),),]
                ),
            ),
            Padding(
              padding:  EdgeInsets.only(right:2.0.w),
              child: ElevatedButton(onPressed: onPressed,
                  style:ElevatedButton.styleFrom(backgroundColor: Colors.black,
                   padding: EdgeInsets.symmetric(
                       horizontal: 5.0.w,
                       vertical: 0.5.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.5.sh),),),
                  child: Text("Add to Cart",
                    style: TextStyle(
                        fontSize: 1.6.sh,
                        color: Colors.white,),),),
            )
          ],
        ),
      ),
    );

  }
}
