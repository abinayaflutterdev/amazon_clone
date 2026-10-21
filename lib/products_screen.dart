import 'package:amazon_clone/cart_screen/custom_productCard.dart';
import 'package:amazon_clone/productdetail_screen.dart';
import 'package:amazon_clone/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductsScreen extends StatefulWidget {
   ProductsScreen({super.key});

  final List<Map<String,dynamic>> cartItems = [

    {
      'image' : 'asset/apple.png',
      'productName' : 'Apple',
      'unit' : '1 kg',
      'price' : 120.0,
      'description' :  'Fresh and juicy red apples carefully selected for their '
          'crisp texture, natural sweetness, and refreshing taste. '
          'These apples are perfect for eating fresh, preparing '
          'fruit salads, making juices, or adding to your daily meals. '
          'Each apple is packed carefully to maintain its freshness '
          'and quality.',
    },
    {
      'image' : 'asset/mango.png',
      'productName' : 'Mango',
      'unit' : '2 DOZ',
      'price' : 200.0,
      'description':
      'Fresh and naturally sweet mangoes with a delicious aroma '
          'and soft, juicy texture. Carefully selected to provide '
          'excellent taste and quality, these mangoes are perfect '
          'for eating fresh, making smoothies, juices, desserts, '
          'or enjoying as a refreshing summer fruit.',
    },
    {
      'image' : 'asset/banana.png',
      'productName' : 'Banana',
      'unit' : '1 DOZ',
      'price' : 60.0,
      'description':
      'Fresh and naturally sweet bananas with a soft and creamy '
          'texture. They are carefully selected and packed to retain '
          'their freshness and quality. Bananas are perfect for a '
          'quick healthy snack, smoothies, breakfast bowls, desserts, '
          'or enjoying anytime during the day.',
    },
    {
      'image' : 'asset/grapes.png',
      'productName' : 'Grapes',
      'unit' : '1 kg',
      'price' : 50.0,
      'description':
      'Fresh and juicy grapes with a naturally sweet and refreshing '
          'flavour. Each bunch is carefully selected for its freshness, '
          'firm texture, and delicious taste. They are perfect for '
          'eating fresh, preparing fruit salads, making juices, or '
          'enjoying as a healthy snack throughout the day.',
    },
    {
      'image' : 'asset/watermelon.png',
      'productName' : 'Water...',
      'unit' : '1 kg',
      'price' : 100.0,
      'description':
      'Fresh and refreshing watermelon with a juicy texture and '
          'naturally sweet taste. It contains plenty of refreshing '
          'water and is perfect for hot days. Enjoy it freshly sliced, '
          'in fruit salads, smoothies, juices, or as a refreshing '
          'summer snack.',
    },
    {
      'image' :'asset/kiwi.png',
      'productName' : 'Kiwi',
      'unit' : '2 pcs',
      'price' : 50.0,
      'description':
      'Fresh and delicious kiwi fruits with a unique sweet and '
          'slightly tangy flavour. The bright green flesh and soft '
          'texture make them a refreshing addition to your meals. '
          'Perfect for eating fresh, adding to fruit salads, smoothies, '
          'desserts, or enjoying as a healthy snack.',
    },
    {
      'image' : 'asset/orange.png',
      'productName' : 'Orange',
      'unit' :  '1 DOZ',
      'price' : 250.0,
      'description':
      'Fresh and juicy oranges with a bright citrus flavour and '
          'refreshing natural sweetness. Carefully selected for their '
          'quality and freshness, they are perfect for eating fresh, '
          'preparing fresh juice, fruit salads, desserts, or enjoying '
          'as a refreshing snack at any time.',
    },
    {
      'image' : 'asset/peach.png',
      'productName' : 'Peach',
      'unit' : '1 kg',
      'price' : 230.0,
      'description':
      'Fresh and delicious peaches with a soft texture, pleasant '
          'aroma, and naturally sweet flavour. Carefully selected to '
          'maintain their freshness and quality, peaches are perfect '
          'for eating fresh, adding to fruit salads, preparing desserts, '
          'smoothies, or enjoying as a refreshing snack.',
    }

  ];

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  int cartCount = 0;

  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: Text("Product List",
          style: TextStyle(
              fontSize: 3.0.sh,
              color: Colors.white,
              fontWeight: FontWeight.w900),),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 3.0.sh),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
            IconButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShoppingCartScreen(
                        cartItem: cartItems,
                      ),));
                },
                icon: Icon(Icons.shopping_cart, color: Colors.white,)),

                if(cartCount > 0)
                  Positioned(
                      top: 0.3.h,
                      right: 1.5.w,
                      child: Container(
                    height: 3.5.h,
                    width: 3.5.w,
                    decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),
                        child: Center(
                          child: Text('$cartCount',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 1.5.sh,
                             fontWeight: FontWeight.bold
                          ),),
                        ),
                  ))
          ],),),
        ],
      ),
      body:ListView.builder(
        padding: EdgeInsets.all(0.1.sh),
       itemCount: widget.cartItems.length,
         itemBuilder: (context, index){
           final product = widget.cartItems[index];
           return CustomProductcard(
               image: product['image'],
               Name: product['productName'],
               unit: product['unit'],
               price: product['price'],
               description: product['description'],


              onPressed: (){
                 setState(() {
                   cartItems.add(product);

                   cartCount = cartItems.length;
                 });
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                     content:
                     Text('${product['productName']} added to cart',
                     )));
              },
               onTap: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => ProductdetailScreen(
                   image:product['image'],
                   productName: product['productName'],
                   unit: product['unit'],
                   price: product['price'],
                   description: product['description'],
                   ofAddToCart: (){
                     ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content:
                         Text('${product['productName']} number of quantity will be shown in cart page')));
                   },
                 )));
               }
           );

         },),

    );
  }
}
