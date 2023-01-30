import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal List'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return Container(); //HorizontalItem()
          }),
        ),
      ),
    );
  }
}
