import 'package:flutter/material.dart';
import 'package:flutter_astrozone/core/services/size_service.dart';

import '../../core/consts/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goFirstPage();
  }

  Future<void> goFirstPage() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.firstPage, (route) => false);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeService.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/egoli.png',
          width: SizeService.width * 1,
        ),
      ),
    );
  }
}
