import 'package:flutter/material.dart';
import 'package:telephone_directory_app_firebase/presentation/views/home_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

@override
  void initState() {
    super.initState();
    transition();
  }

  transition() async {
   await Future.delayed(const Duration(seconds: 2));
   if(!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/telephone_image.png"),
            fit: BoxFit.cover)),
      ),
    );
  }
}