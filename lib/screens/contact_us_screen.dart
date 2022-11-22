import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';

class ContactUsUI extends StatelessWidget {
  const ContactUsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Us UI',
      home: ContactUsPage(),
    );
  }
}

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 246, 233, 1),
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: AppColors.mainGreen,
        title: const Text('Kontak Kami'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Text(
                'Apabila Anda memiliki pertanyaan atau kendala, silahkan hubungi nomor telepon di bawah ini.',
                style: TextStyle(fontSize: 18, color: AppColors.contactUs),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Icon(
                Icons.phone,
                size: 100,
                color: AppColors.contactUs,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text(
                '+62 857-9509-4888',
                style: TextStyle(fontSize: 18, color: AppColors.contactUs),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
