import 'package:flutter/material.dart';
import 'package:shopping/account.dart';
import 'package:shopping/login.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
              SizedBox(height: 20,),
              AccountPage(),
              Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: Container(
                    child: const Text(
                      'Tizimdan chiqish',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30,),
            ],
        )
      ),
    );
  }
}
