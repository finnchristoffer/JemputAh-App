import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/images.dart';
import 'package:jemputah_app/screens/base_screen.dart';
import './login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jemputah_app/reuseable_widget/reuseable_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  final firestore = FirebaseFirestore.instance;
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _phoneNumberTextController = TextEditingController();
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
              height: 264,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 234,
                      width: 234,
                      child: Image.asset(logo),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
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
                    "Nama Lengkap", Icons.person, false, _nameTextController)),
            Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
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
                margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
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
                child: reusableTextField("Nomor Ponsel", Icons.phone, false,
                    _phoneNumberTextController)),
            Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
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
            signInSignUpButton(context, false, () {
              final nameText = _nameTextController.value.text;
              final phoneNumberText = _phoneNumberTextController.value.text;
              if (nameText.isEmpty || phoneNumberText.isEmpty) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text(
                          "Error",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                        content: Text(
                          "Tolong isi kolom yang masih kosong terlebih dahulu.",
                          textAlign: TextAlign.center,
                        ),
                      );
                    });
              } else {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                  firestore
                      .collection("user")
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .set({
                    "email_user": _emailTextController.text,
                    "jml_berat": 0,
                    "jml_jemput": 0,
                    "jml_koin_user": 0,
                    "name_user": _nameTextController.text,
                    "phone_num_user": _phoneNumberTextController.text,
                    "profile_pic_user": '',
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BaseScreen()));
                }).onError((error, stackTrace) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "Error",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                          content: Text(
                            error.toString(),
                            textAlign: TextAlign.center,
                          ),
                        );
                      });
                });
              }
            }),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Sudah punya akun? '),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()))
                  },
                  child: const Text(
                    'Login di sini',
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
