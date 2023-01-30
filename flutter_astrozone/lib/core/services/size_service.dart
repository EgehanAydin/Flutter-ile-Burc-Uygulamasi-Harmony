import 'package:flutter/cupertino.dart';

class SizeService {
  static dynamic myContext;

  static void init(context) {
    myContext = context;
    print(height);
  }

  static final width = MediaQuery.of(myContext).size.width;
  static final height = MediaQuery.of(myContext).size.height;
}
