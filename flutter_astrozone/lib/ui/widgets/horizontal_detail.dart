import 'package:flutter/material.dart';
import 'package:flutter_astrozone/core/consts/horizontal.dart';

class HorizontalDetail extends StatefulWidget {
  const HorizontalDetail({super.key});

  @override
  State<HorizontalDetail> createState() => _HorizontalDetailState();
}

class _HorizontalDetailState extends State<HorizontalDetail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Horizontal;
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F7),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffF3F5F7),
        elevation: 0,
        title: Text(
          '${args.name} Burcu ve Özellikleri',
          style: TextStyle(
              color: Colors.blue.shade700, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  args.image!,
                ),
                const SizedBox(height: 20),
                Text(
                  'Hakkında',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey.shade800),
                ),
                const SizedBox(height: 10),
                Text(
                  args.features,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
