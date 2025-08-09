import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  bool _isHidden = true;
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  // Saqlangan login/parolni yuklash
  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLogin = prefs.getString('login');
    String? savedPassword = prefs.getString('password');
    bool? remember = prefs.getBool('remember') ?? false;

    if (remember && savedLogin != null && savedPassword != null) {
      _loginController.text = savedLogin;
      _passwordController.text = savedPassword;
      setState(() {
        isChecked = true;
      });
    }
  }

  final _login = "admin1";

  final _parol = "1234";

  // Login va parolni saqlash
  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isChecked) {
      await prefs.setString('login', _loginController.text);
      await prefs.setString('password', _passwordController.text);
      await prefs.setBool('remember', true);
    } else {
      await prefs.remove('login');
      await prefs.remove('password');
      await prefs.setBool('remember', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // Xush kelibsiz
                    Container(
                      padding: EdgeInsets.all(13),
                      height: 100,
                      width: 5000,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Xush kelibsiz!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "Iltimos tizimga kirish uchun ma'lumotlaringizni kiriting",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),

                    // Login
                    TextField(
                      controller: _loginController,
                      decoration: InputDecoration(
                        labelText: 'Login',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 30),

                    // Parol
                    TextField(
                      controller: _passwordController,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        labelText: 'Parol',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isHidden ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isHidden = !_isHidden;
                            });
                          },
                        ),
                      ),
                    ),

                    // CheckBox - Eslab qolish
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isChecked = newValue ?? false;
                                  });
                                },
                                activeColor: Colors.blueAccent,
                                checkColor: Colors.white,
                              ),
                              Text(
                                "Eslab qolish",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Parolni unutdingizmi? funksiyasi
                          },
                          child: Text(
                            "Parolni unutdingizmi?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),

                    // Kirish tugmasi
                    SizedBox(
                      height: 50,
                      width: 5000,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueAccent,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _saveData();

                          if (_loginController.text == _login &&
                              _passwordController.text == _parol) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          } else {
                            // Login yoki parol xato bo‘lsa
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login yoki parol xato')),
                            );
                          }
                        },
                        child: Text(
                          "Kirish",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    // Ro'yxatdan o'tish
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Akkauntingiz yo'qmi?"),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Ro'yxatdan o'tish",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
