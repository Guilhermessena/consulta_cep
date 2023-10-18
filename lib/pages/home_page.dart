import 'package:flutter/material.dart';
import 'package:via_cep/pages/consulta_cep_page.dart';
import 'package:via_cep/pages/list_cep_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageController = PageController();
  var posPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                  controller: pageController,
                  onPageChanged: (value) => setState(() {
                        posPage = value;
                      }),
                  children: const [
                    ConsultaCepPage(),
                    ListCepPage(),
                  ]),
            ),
            BottomNavigationBar(
              onTap: (value) => pageController.jumpToPage(value),
              currentIndex: posPage,
              items: const [
                BottomNavigationBarItem(
                    label: "Home", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "List", icon: Icon(Icons.list)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
