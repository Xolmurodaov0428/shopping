import 'package:flutter/material.dart';
import 'package:shopping/pages/frindpage.dart';
import 'package:shopping/pages/home.dart';
import 'package:shopping/pages/scanpage.dart';
import 'package:shopping/pages/setting.dart';
import 'package:shopping/pages/shopping.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndesx = 4;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndesx = index;
    });
  }

  final List<Widget> _children = [
    Home(),
    FrindPage(),
    ScanPage(),
    ShopPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndesx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndesx,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business_sharp),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people_sharp), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }
}


