import 'package:cookoff/main.dart';
import 'package:cookoff/screens/HomePage.dart';
import 'package:cookoff/screens/cookPage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(
      Duration(seconds: 1),
      () {},
    );
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 134, 126),
      body: Center(
          child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 141, 107, 234),
        radius: 100,
        child: ClipRRect(
            child: Image.asset("images/image.jpg"),
            borderRadius: BorderRadius.circular(100.0)),
      )),
    );
  }
}
