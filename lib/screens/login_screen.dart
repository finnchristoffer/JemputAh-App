import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/screens/base_screen.dart';
import './signup_screen.dart';
import 'package:jemputah_app/constants/image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      backgroundColor: AppColors.backgroundGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      height: 234,
                      width: 234,
                      child: Image.asset(logo),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                cursorColor: AppColors.buttonBackground,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: AppColors.mainGreen,
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: AppColors.hintTextColor),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                obscureText: true,
                cursorColor: AppColors.buttonBackground,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: AppColors.mainGreen,
                  ),
                  hintText: 'Kata Sandi',
                  hintStyle: TextStyle(color: AppColors.hintTextColor),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, right: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: const Text('Lupa Kata Sandi?'),
                onTap: () => {},
              ),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const BaseScreen()))
              },
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 60),
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(62, 75, 42, 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: const Text(
                  'MASUK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Belum punya akun? '),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()))
                  },
                  child: const Text(
                    'Daftar di sini',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
