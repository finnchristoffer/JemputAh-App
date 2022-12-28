import 'package:flutter/material.dart';
import 'package:jemputah_app/API/FetchData.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/images.dart';
import 'package:jemputah_app/constants/variable.dart';
import 'package:jemputah_app/reuseable_widget/reuseable_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingUI extends StatelessWidget {
  const SettingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Setting UI',
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  var db = FirebaseFirestore.instance;
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController =
      TextEditingController();

  void setProfile() {
    var profile = FetchData().fetchMapData('user', uid);
    profile.then((value) {
      setState(() {
        _nameTextController.text = value['name_user'];
        _emailTextController.text = value['email_user'];
        _phoneNumberTextController.text = value['phone_num_user'];
      });
    });
  }

  @override
  void initState() {
    setProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGreen,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: AppColors.mainGreen,
        title: const Text('Ubah Profil'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
                child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4, color: AppColors.secondaryBorder),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10)),
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(profilePicture))),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2, color: AppColors.secondaryBorder),
                          color: AppColors.buttonBackground),
                      child: const Icon(Icons.edit, color: Colors.white),
                    )),
              ],
            )),
            Container(
                margin: const EdgeInsets.only(top: 50),
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
                margin: const EdgeInsets.only(top: 20),
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
                margin: const EdgeInsets.only(top: 20),
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
            GestureDetector(
              onTap: () {
                final nameText = _nameTextController.value.text;
                final email = _emailTextController.value.text;
                final phoneNum = _phoneNumberTextController.value.text;
                if (nameText.isEmpty || email.isEmpty || phoneNum.isEmpty) {
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
                  final user = <String, dynamic>{
                    "name_user": _nameTextController.text,
                    "email_user": _emailTextController.text,
                    "phone_num_user": _phoneNumberTextController.text,
                  };
                  db.collection("user").doc(uid).update(user);
                  Navigator.pop(context);
                }
              },
              child: Container(
                margin: const EdgeInsets.only(top: 140),
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
                  'SIMPAN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
