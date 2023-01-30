import 'package:flutter/material.dart';
import 'package:flutter_astrozone/core/consts/routes.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:web_scraper/web_scraper.dart';

import '../../core/services/size_service.dart';

class ZodiacCompatibility extends StatefulWidget {
  const ZodiacCompatibility({super.key});

  @override
  State<ZodiacCompatibility> createState() => _ZodiacCompatibilityState();
}

class _ZodiacCompatibilityState extends State<ZodiacCompatibility> {
  @override
  void initState() {
    super.initState();
  }

  var value, value2;
  final controller = LoopPageController();
  final controller2 = LoopPageController();
  final colors = {
    Colors.blueGrey,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F7),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffF3F5F7),
        title: Text(
          'Burç Uyumu',
          style: TextStyle(color: Color(0xff398280), fontSize: 22),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: SizeService.height * 0.1),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  loopButton(controller, 'Kadın'),
                  loopButton(controller2, 'Erkek'),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  //arguments olarak a ve b yi gönder yukarıdaki ve buradakileri detaya aktar

                  var firstH = liste[controller.page.toInt()]['title'];
                  var secondH = liste[controller2.page.toInt()]['title'];
                  Navigator.pushNamed(
                    context,
                    Routes.horizontalCompatibility,
                    arguments: {'firstH': firstH, 'secondH': secondH},
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffFE591F),
                    borderRadius: BorderRadius.circular(24),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: SizeService.height * 0.05),
                  width: 250,
                  height: 50,
                  child: const Text(
                    'Burç Uyumunu Göster',
                    style: TextStyle(color: Color(0xffFFEDD2), fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  var liste = <Map<String, dynamic>>[
    {'id': 1, 'title': 'koc', 'realTitle': 'Koç'},
    {'id': 2, 'title': 'boga', 'realTitle': 'Boğa'},
    {'id': 3, 'title': 'ikizler', 'realTitle': 'İkizler'},
    {'id': 4, 'title': 'yengec', 'realTitle': 'Yengeç'},
    {'id': 5, 'title': 'aslan', 'realTitle': 'Aslan'},
    {'id': 6, 'title': 'basak', 'realTitle': 'Başak'},
    {'id': 7, 'title': 'terazi', 'realTitle': 'Terazi'},
    {'id': 8, 'title': 'akrep', 'realTitle': 'Akrep'},
    {'id': 9, 'title': 'yay', 'realTitle': 'Yay'},
    {'id': 10, 'title': 'oglak', 'realTitle': 'Oğlak'},
    {'id': 11, 'title': 'kova', 'realTitle': 'Kova'},
    {'id': 12, 'title': 'balik', 'realTitle': 'Balık'},
  ];
  var images = <String>[
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

  loopButton(LoopPageController myController, String s, {text}) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: SizeService.height * 0.07),
          width: 130,
          height: 220,
          child: LoopPageView.builder(
            scrollDirection: Axis.vertical,
            controller: myController,
            itemCount: liste.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      const BoxShadow(
                        color: Color(0xffFDFFFF),
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                    Text(liste[index]['realTitle'])
                  ],
                ),
              );
            },
          ),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffFE591F),
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: SizeService.height * 0.04),
              width: 120,
              height: 40,
              child: Text(
                s,
                style: const TextStyle(color: Color(0xffFFEDD2)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
