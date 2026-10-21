import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCartScreen extends StatelessWidget {

  final String name;
  final String image;
  final double price;
  final String unit;
  final VoidCallback ofIncrement;
  final VoidCallback ofDecrement;
  final int quantity;

  const CustomCartScreen({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.unit,
    required this.ofDecrement,
    required this.ofIncrement,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {

    final parts = unit.split(' ');

    final double unitNumber =
        double.tryParse(parts[0]) ?? 1;

    final String unitName =
    parts.length > 1 ? parts[1] : '';

    final double updatedUnitNumber =
        unitNumber * quantity;

    final double total =
        price * quantity;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 3.w,
        vertical: 1.h,
      ),
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.sh),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 14.h,
            width: 28.w,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(1.5.sh),),
            child: Image.asset(
              image,
              fit: BoxFit.contain,),),

          SizedBox(width: 4.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 2.5.sh,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,),),

                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${updatedUnitNumber.toInt()} $unitName',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 1.9.sh,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '₹${total.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 2.0.sh,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 1.h),
                Row(
                  children: [
                    Container(
                      height: 4.h,
                      width: 9.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                        BorderRadius.circular(0.8.sh),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: quantity > 1
                            ? ofDecrement
                            : null,
                        icon: Icon(
                          Icons.remove,
                          size: 2.2.sh,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(width: 3.w),
                    Text(
                      '$quantity',
                      style: TextStyle(
                        fontSize: 2.sh,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 3.w),
                    Container(
                      height: 4.h,
                      width: 9.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                        BorderRadius.circular(0.8.sh),),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: ofIncrement,
                        icon: Icon(
                          Icons.add,
                          size: 2.2.sh,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}