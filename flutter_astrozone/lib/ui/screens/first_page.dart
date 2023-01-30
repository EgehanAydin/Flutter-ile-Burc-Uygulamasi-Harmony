import 'package:flutter/material.dart';
import 'package:flutter_astrozone/core/consts/routes.dart';

import '../../core/services/size_service.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F7),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customButton(text: 'Burçlar', page: Routes.homePage),
              customButton(
                  text: 'Burç Uyumu',
                  page: Routes.zodiacCompatibility),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector customButton({text, page}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, page),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Color(0xffCCA245),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ],
        ),
        margin: EdgeInsets.only(top: SizeService.height*0.07),
        width: 350,
        height: 170,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: Color(0xff393F44)),
        ),
      ),
    );
  }
}
