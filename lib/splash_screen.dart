import 'package:amazon_clone/products_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed( Duration(seconds: 3), () {
      if(mounted){
        Navigator.pushReplacement(
            context, MaterialPageRoute(
            builder: (context) =>  ProductsScreen()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('asset/amazon.png')
      ),
    );
  }
}
