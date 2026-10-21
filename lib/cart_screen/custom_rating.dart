import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomRating extends StatelessWidget {

  final double rating;

  const CustomRating({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(int i=1; i<=5; i++)
        Icon(
          i<= rating
              ? Icons.star
              : Icons.star_border,
          color: Colors.amber,
          size: 2.5.sh,
        ),
        Text('$rating',
        style: TextStyle(
          color: Colors.grey.shade800,
          fontSize: 1.7.sh
        ),
        )
      ],
    );
  }
}


