import 'package:amazon_clone/cart_screen/custom_cart_screen.dart';
import 'package:amazon_clone/order_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ShoppingCartScreen extends StatefulWidget {

 final List<Map<String,dynamic>> cartItem;

  const ShoppingCartScreen({
    super.key,
     required this.cartItem
  });

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen>{

  late List<int> quantities;

  @override
  void initState(){
    super.initState();
    quantities=List.filled(
      widget.cartItem.length,
      1
    );
  }

  void incrementQuantity(int index){
    setState(() {
      quantities[index]++;
    });
  }
  void decrementQuantity(int index){
    if(quantities[index] >1){
      setState(() {
        quantities[index]--;
      });
    }
  }
  double get total{

    double cartTotal =0;
    for(int i=0; i<widget.cartItem.length; i++){

      final double price = widget.cartItem[i]['price'];

      cartTotal += price * quantities[i];
    }
    return cartTotal;

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,)),
        title: Text('My Shopping Cart',
          style: TextStyle(
              fontSize: 3.0.sh,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
      ),
      body: widget.cartItem.isEmpty
      ? Center(
        child: Text('Your cart is empty',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 2.5.sh
        ),),
      )

      :SingleChildScrollView(
        child: Column(
          children: [
          ListView.builder(
            shrinkWrap: true,
              physics:  NeverScrollableScrollPhysics(),
            itemCount: widget.cartItem.length,
              itemBuilder: (context,index){
                final  product = widget.cartItem[index];
                return CustomCartScreen(
                    name: product['productName'],
                    image: product['image'],
                    price: product['price'],
                    unit: product['unit'],
                    ofDecrement: (){
                      decrementQuantity(index);
                    },
                    ofIncrement: (){
                      incrementQuantity(index);
                    },
                    quantity: quantities[index]);
              }),
            SizedBox(height: 6.0.sh,),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 3.0.sh)),
                Text('Total',
                  style: TextStyle(
                      fontSize: 4.0.sh,
                      fontWeight:FontWeight.w900),),

                Padding(padding: EdgeInsets.only(right: 27.0.sh)),
                Text('₹${total.toStringAsFixed(0)}',
                   style: TextStyle(
                        fontSize: 3.0.sh,
                         fontWeight: FontWeight.bold,),),
              ],),
            SizedBox(height: 10.0.h,),
             ElevatedButton(
                 style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.black,
                    minimumSize: Size(70.0.w, 6.0.h),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0.sh))
                 ),
                    onPressed: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                       builder: (context) => OrderPlaceScreen(),));
                     },
                       child: Text('Place the Order',style: TextStyle(color: Colors.white),))
      ],
        ),
    ),

    );
  }
}
