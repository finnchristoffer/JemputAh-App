import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';

class AddressUI extends StatelessWidget {
  const AddressUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Setting UI',
      home: AddressDetailPage(),
    );
  }
}

class AddressDetailPage extends StatefulWidget {
  const AddressDetailPage({super.key});

  @override
  _AddressDetailState createState() => _AddressDetailState();
}

class _AddressDetailState extends State<AddressDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 246, 233, 1),
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: AppColors.mainGreen,
        title: const Text('Detail Alamat'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
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
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 3,
                cursorColor: AppColors.buttonBackground,
                decoration: InputDecoration(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 35),
                    child: Icon(
                      Icons.home,
                      color: AppColors.mainGreen,
                    ),
                  ),
                  hintText: 'Alamat Lengkap',
                  hintStyle: TextStyle(color: AppColors.hintTextColor),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 5),
              child: const Text(
                '* Nama jalan, nama wilayah, nomor rumah',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
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
                    Icons.home_work,
                    color: AppColors.mainGreen,
                  ),
                  hintText: 'Kecamatan',
                  hintStyle: TextStyle(color: AppColors.hintTextColor),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 45),
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
                    Icons.location_city,
                    color: AppColors.mainGreen,
                  ),
                  hintText: 'Kota',
                  hintStyle: TextStyle(color: AppColors.hintTextColor),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 45),
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
                    Icons.numbers,
                    color: AppColors.mainGreen,
                  ),
                  hintText: 'Kode Pos',
                  hintStyle: TextStyle(color: AppColors.hintTextColor),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {
                /* onClick code nanti disini */
              },
              child: Container(
                margin: const EdgeInsets.only(top: 70),
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
