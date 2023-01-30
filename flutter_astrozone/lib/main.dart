import 'package:flutter/material.dart';
import 'package:flutter_astrozone/core/services/route_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/consts/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.cabin().fontFamily,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.purple),
      ),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: RouteService.generateRoute,
    );
  }
}

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('NO PAGE')),
    );
  }
}


