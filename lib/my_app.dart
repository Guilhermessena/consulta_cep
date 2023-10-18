import 'package:flutter/material.dart';
import 'package:via_cep/pages/consulta_cep_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConsultaCepPage(),
    );
  }
}