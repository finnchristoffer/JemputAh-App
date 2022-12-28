import 'package:flutter/material.dart';
import 'package:jemputah_app/API/FetchData.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/reuseable_widget/reuseable_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jemputah_app/constants/variable.dart';

class AddressEditPage extends StatefulWidget {
  final String idAddress;

  const AddressEditPage(this.idAddress, {super.key});

  @override
  State<StatefulWidget> createState() => InitState(idAddress);
}

class InitState extends State<AddressEditPage> {
  String idAddress;

  InitState(this.idAddress);

  var db = FirebaseFirestore.instance;
  final firestore = FirebaseFirestore.instance;
  final TextEditingController _addressTextController = TextEditingController();
  final TextEditingController _districtTextController = TextEditingController();
  final TextEditingController _cityTextController = TextEditingController();
  final TextEditingController _postalCodeTextController = TextEditingController();

  void setAddress() {
    var address = FetchData().fetchMapData('address', idAddress);
    address.then((value) {
      setState(() {
        _addressTextController.text = value['address'];
        _districtTextController.text = value['district'];
        _cityTextController.text = value['city'];
        _postalCodeTextController.text = value['postal_code'];
      });
    });
  }

  @override
  void initState() {
    setAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
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
                child: reusableAddressTextField("Alamat Lengkap", Icons.home,
                    true, _addressTextController)),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 5),
              child: const Text(
                '* Nama jalan, nama wilayah, nomor rumah',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 35),
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
                child: reusableAddressTextField("Kecamatan", Icons.home_work,
                    false, _districtTextController)),
            Container(
                margin: const EdgeInsets.only(top: 45),
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
                child: reusableAddressTextField(
                    "Kota", Icons.location_city, false, _cityTextController)),
            Container(
                margin: const EdgeInsets.only(top: 45),
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
                child: reusableAddressTextField("Kode Pos", Icons.numbers,
                    false, _postalCodeTextController)),
            GestureDetector(
              onTap: () {
                final addressText = _addressTextController.value.text;
                final districtText = _districtTextController.value.text;
                final cityText = _cityTextController.value.text;
                final postalCodeText = _postalCodeTextController.value.text;
                if (addressText.isEmpty ||
                    districtText.isEmpty ||
                    cityText.isEmpty ||
                    postalCodeText.isEmpty) {
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
                  final address = <String, dynamic>{
                    "address": _addressTextController.text,
                    "district": _districtTextController.text,
                    "city": _cityTextController.text,
                    "postal_code": _postalCodeTextController.text,
                    "id_user": uid,
                  };
                  db.collection("address").doc(idAddress).set(address);
                  Navigator.pop(context);
                }
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
