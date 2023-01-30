import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_astrozone/core/consts/routes.dart';
import '../../core/consts/horizontal.dart';
import '../widgets/horizontal_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  List<String> smallImages = [
    'assets/images/koc1.png',
    'assets/images/boga1.png',
    'assets/images/ikizler1.png',
    'assets/images/yengec1.png',
    'assets/images/aslan1.png',
    'assets/images/basak1.png',
    'assets/images/terazi1.png',
    'assets/images/akrep1.png',
    'assets/images/yay1.png',
    'assets/images/oglak1.png',
    'assets/images/kova1.png',
    'assets/images/balik1.png',
  ];

  var list = <Horizontal>[];
/*
     var images = <String>[
    'assets/images/koc2.png',
    'assets/images/boga2.png',
    'assets/images/ikizler2.png',
    'assets/images/yengec2.png',
    'assets/images/aslan2.png',
    'assets/images/basak2.png',
    'assets/images/terazi2.png',
    'assets/images/akrep2.png',
    'assets/images/yay2.png',
    'assets/images/oglak2.png',
    'assets/images/kova2.png',
    'assets/images/balik2.png',
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffF3F5F7),
        title: const Text(
          'Burç Seçimi',
          style: TextStyle(color: Color(0xff398280), fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2, 20, 2, 2),
        child: HorizontalList(),
      ),
      backgroundColor: const Color(0xffF3F5F7),
    );
  }

  GridView HorizontalList() {
    return GridView.builder(
        padding: const EdgeInsets.all(7),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 17,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.horizontalDetail,
                  arguments: list[index]);
            },
            child: Column(
              children: [
                Image.asset(
                  smallImages[index],
                  fit: BoxFit.fill,
                  width: 40,
                ),
                const SizedBox(height: 10),
                Text(
                  list[index].name,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        });
  }

  var images = <String>[
    'assets/images/koc2.png',
    'assets/images/boga2.png',
    'assets/images/ikizler2.png',
    'assets/images/yengec2.png',
    'assets/images/aslan2.png',
    'assets/images/basak2.png',
    'assets/images/terazi2.png',
    'assets/images/akrep2.png',
    'assets/images/yay2.png',
    'assets/images/oglak2.png',
    'assets/images/kova2.png',
    'assets/images/balik2.png',
  ];

  fetchdata() async {
    final String response =
        await rootBundle.loadString('assets/jsons/horoscope.json');
    final data = await json.decode(response);

    list = List<Horizontal>.from(
      data['horoscopeList'].map(
        (item) => Horizontal.fromJson(item),
      ),
    );
    for (int i = 0; i < list.length; i++) {
      list[i].image = images[i];
    }
    setState(() {});
  }
}
