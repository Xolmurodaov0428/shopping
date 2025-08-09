import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            width: 3000,
            decoration: BoxDecoration(
              color: Colors.blueAccent[200],
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.white),
            ),
            child: Center(child: Text("XSh", style: TextStyle(fontSize: 30,))),
          ),

          Column(
            children: [
              Text(
                'Xolmurodov Shahzod',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 15),
              Text(
                '+998904131263',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
