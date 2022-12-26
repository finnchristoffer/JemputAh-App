import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jemputah_app/API/FetchData.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/images.dart';
import 'package:jemputah_app/constants/icons.dart';
import 'package:jemputah_app/components/dl_alert.dart';
import 'package:jemputah_app/API/ShopService.dart';
import 'package:jemputah_app/constants/variable.dart';
import 'package:jemputah_app/models/user_transaction.dart';

import '../extensions/date_time_converter.dart';

class Tukar extends StatefulWidget {
  const Tukar({super.key});

  @override
  TukarPage createState() => TukarPage();
}

class TukarPage extends State<Tukar> {
  var jml_koin_user = 0;
  var dateNow = DateTime.now().toString();
  var firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> data = [];

  DateTimeConverter dateTimeConverter = DateTimeConverter();

  void setShop() {
    var shop = FetchShop().fetchListShop();
    shop.then((value) {
      setState(() {
        data = value;
      });
    });
  }

  void setUser() {
    var user = FetchData().fetchMapData("user", uid);
    user.then((value) {
      setState(() {
        jml_koin_user = value["jml_koin_user"];
      });
    });
  }

  void uploadTransaction(int i) {
    final UserTransaction = <String, dynamic>{
      'id_user': uid,
      'tgl_transaksi_user': dateTimeConverter.formatWithoutDay(dateNow),
      'id_shop': data[i]['id_shop'],
    };
    firestore.collection('user_transaction').add(UserTransaction);
  }

  // make void for calculate point by point - price and update to firebase
  void updatePoint(int i) {
    var point = jml_koin_user - data[i]['price'];
    firestore.collection('user').doc(uid).update({'jml_koin_user': point});
  }

  @override
  void initState() {
    super.initState();
    setShop();
    setUser();
  }

  @override
  Widget build(BuildContext context) {
    //variable contain int number point
    int point = jml_koin_user;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.mainGreen,
          title: const Text('Tukar Page'),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40, left: 45),
                  child: Text(
                    "Total Poin",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 40, right: 60),
                  child: Text(
                    point.toString() + "   Koin",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(right: 15, left: 15, bottom: 50),
                itemCount: data.length,
                //change gridview background color

                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      final alertTitles = ["Konfirmasi"];
                      final alertDetailPesanan =
                          "Apakah anda yakin ingin melakukan transaksi voucher " +
                              data[i]['title'] +
                              " ?";
                      DLAlert(
                          cancelTitle: 'Batalkan',
                          alertTitle: 'Konfirmasi Penukaran',
                          alertDetailMessage: alertDetailPesanan,
                          alertActionTitles: alertTitles,
                          onAlertAction: (int selectedActionIndex) {
                            uploadTransaction(i);
                            setState(() {
                              updatePoint(i);
                              setUser();
                            });
                          }).show(context);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //make border
                        ),
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              // mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    data[i]['logo'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 5, top: 5),
                                  child: Text(
                                    data[i]['title'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    data[i]['desc'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Text(
                                  data[i]['price'].toString() + " Koin",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 280,
                ),
              ),
            ),
          ],
        ));
  }
}
