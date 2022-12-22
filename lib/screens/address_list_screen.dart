import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/icons.dart';
import 'package:jemputah_app/screens/address_detail_screen.dart';
import 'package:jemputah_app/screens/address_edit_screen.dart';
import '../constants/variable.dart';
import '../API/FetchData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jemputah_app/constants/images.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({Key? key}) : super(key: key);

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  List<Map<String, dynamic>> data = [];
  late DocumentReference _documentReference;

  void setAddress() {
    var address = FetchData().fetchListData("address", uid);
    address.then((value) {
      setState(() {
        data = value;
      });
    });
  }

  onGoBack(dynamic value) {
    setState(() {
      setAddress();
    });
  }

  @override
  void initState() {
    super.initState();
    setAddress();
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainGreen,
          leading: BackButton(
            color: AppColors.white,
          ),
          title: Text(
            "Daftar Alamat",
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
          actions: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 10,
                ),
                child: Text(
                  "Tambah Alamat",
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
              onTap: () {
                Route route = MaterialPageRoute(
                    builder: (context) => AddressDetailPage());
                Navigator.push(context, route).then(onGoBack);
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                pesananKosong,
                width: 250,
                height: 250,
                fit: BoxFit.fill,
              ),
              Text(
                'Ups, Anda belum memasukkan alamat',
                style: TextStyle(fontSize: 20, color: AppColors.hintTextColor),
              )
            ],
          ),
        ),
        backgroundColor: AppColors.backgroundGreen,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainGreen,
          leading: BackButton(
            color: AppColors.white,
          ),
          title: Text(
            "Daftar Alamat",
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
          actions: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 10,
                ),
                child: Text(
                  "Tambah Alamat",
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
              onTap: () {
                Route route = MaterialPageRoute(
                    builder: (context) => AddressDetailPage());
                Navigator.push(context, route).then(onGoBack);
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 34,
                left: 24,
                bottom: 10,
              ),
              child: const Text("Alamat Penjemputan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.secondaryBorder,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            top: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            data[index]["address"] as String,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            bottom: 5,
                          ),
                          child: Text(
                            data[index]["district"] as String,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                data[index]["city"] as String,
                              ),
                              const Text("  |   "),
                              Text(
                                data[index]["postal_code"] as String,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            bottom: 15,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) => AddressEditPage(
                                          data[index]['id_address']));
                                  Navigator.push(context, route).then(onGoBack);
                                },
                                child: SizedBox(
                                  width: 250,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: null,
                                    child: Text(
                                      "Ubah Alamat",
                                      style: TextStyle(
                                          color: AppColors.hintTextColor),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _documentReference = FirebaseFirestore
                                        .instance
                                        .collection('address')
                                        .doc(data[index]['id_address']);
                                    _documentReference.delete();
                                    setAddress();
                                  });
                                  const snackBar = SnackBar(
                                    content: Text(
                                        'Alamat yang dipilih berhasil dihapus.'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 30,
                                  ),
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    iconDelete,
                                    width: 27,
                                    height: 30,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => Divider(
                  thickness: 1,
                  height: 30,
                  color: AppColors.backgroundGreen,
                ),
              ),
            )
          ],
        ),
        backgroundColor: AppColors.backgroundGreen,
      );
    }
  }
}
