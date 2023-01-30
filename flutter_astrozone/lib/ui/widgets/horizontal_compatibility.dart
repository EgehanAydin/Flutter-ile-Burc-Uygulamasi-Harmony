import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class HorizontalCompatibility extends StatefulWidget {
  const HorizontalCompatibility({super.key});

  @override
  State<HorizontalCompatibility> createState() =>
      _HorizontalCompatibilityState();
}

class _HorizontalCompatibilityState extends State<HorizontalCompatibility> {
  var baseTitle = '';
  List<Map<String, dynamic>> titles = [];
  List<Map<String, dynamic>> descriptions = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    fetch(args['firstH'], args['secondH']);
  }

  var user = {};

  var list = [];

  Future<void> fetch(firstH, secondH) async {
    final webScraper = WebScraper('https://www.hurriyet.com.tr');
    if (await webScraper.loadWebPage(
        '/mahmure/astroloji/burc-uyumu/$firstH-burcu-kadini-$secondH-burcu-erkegi/')) {
      List<Map<String, dynamic>> elements = webScraper
          .getElement('div.horoscope-detail-tab-content > h2', ['href']);
      setState(() {
        baseTitle = elements[0]['title'].split(' ')[0] + ' - ' + elements[0]['title'].split(' ')[3] + ' Burç Uyumu';              
      });
      titles = webScraper
          .getElement('div.horoscope-detail-tab-content > h3', ['href']);
      descriptions =
          webScraper.getElement('div.horoscope-detail-tab-content > p', []);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F7),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffF3F5F7),
        elevation: 0,
        title: Text(
          baseTitle,
          style: const TextStyle(
            color: Color(0xff398280),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          shrinkWrap: true,
          itemCount: titles.length,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                titles[index]['title'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 35, 6, 6),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                descriptions[index]['title'],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade800,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
