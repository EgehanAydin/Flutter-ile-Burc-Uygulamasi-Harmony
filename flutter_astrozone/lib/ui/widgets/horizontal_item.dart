import 'package:flutter/material.dart';
import 'package:flutter_astrozone/core/consts/horizontal.dart';
import 'package:flutter_astrozone/core/consts/routes.dart';

class HorizontalItem extends StatelessWidget {
  final String text;
  const HorizontalItem({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     /*  onTap: () => Navigator.pushNamed(context, Routes.horizontalDetail,
          arguments: horizontalListed), */
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Card(
          color: const Color(0xffFFFFFF),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              title: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
