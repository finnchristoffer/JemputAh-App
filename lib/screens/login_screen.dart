import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/screens/base_screen.dart';
import './signup_screen.dart';
import 'package:jemputah_app/constants/image.dart';
import 'package:jemputah_app/reuseable_widget/reuseable_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

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
                height: 50,
                margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
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
                child: reusableTextField(
                    "Email", Icons.email, false, _emailTextController)),
            Container(
                height: 50,
                margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
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
                child: reusableTextField("Kata Sandi", Icons.vpn_key, true,
                    _passwordTextController)),
            Container(
              margin: const EdgeInsets.only(top: 20, right: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: const Text('Lupa Kata Sandi?'),
                onTap: () => {},
              ),
            ),
            signInSignUpButton(context, true, () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                  .then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => BaseScreen()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });
            }),
            signUpOption()
          ],
        ),
      ),
    );
  }

  Container signUpOption() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Belum punya akun? '),
        GestureDetector(
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()))
          },
          child: const Text(
            'Daftar di sini',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
