import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jemputah_app/API/FetchData.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/components/dl_alert.dart';
import 'package:jemputah_app/API/ShopService.dart';
import 'package:jemputah_app/constants/variable.dart';
import 'package:jemputah_app/extensions/date_time_converter.dart';

class Tukar extends StatefulWidget {
  const Tukar({super.key});

  @override
  TukarPage createState() => TukarPage();
}

class TukarPage extends State<Tukar> {
  int jmlKoinUser = 0;
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
        jmlKoinUser = value["jml_koin_user"];
      });
    });
  }

  void validationCoin(int i) {
    if (jmlKoinUser < data[i]['price']) {
      const snackBar = SnackBar(
        content: Text('Koin anda tidak mencukupi'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      uploadTransaction(i);
    }
  }

  void uploadTransaction(int i) {
    final userTransaction = <String, dynamic>{
      'id_user': uid,
      'tgl_transaksi_user': dateTimeConverter.formatWithoutDay(dateNow),
      'id_shop': data[i]['id_shop'],
    };
    firestore.collection('user_transaction').add(userTransaction);

    setState(() {
      updatePoint(i);
      setUser();
    });
  }

  // make void for calculate point by point - price and update to firebase
  void updatePoint(int i) {
    var point = jmlKoinUser - data[i]['price'];
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
    int point = jmlKoinUser;
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
                margin: const EdgeInsets.only(top: 40, left: 45),
                child: const Text(
                  "Total Koin",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 40, right: 60),
                child: Text(
                  "$point   Koin",
                  style: const TextStyle(
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
                        "Apakah anda yakin ingin melakukan transaksi voucher ${data[i]['title']} ?";
                    DLAlert(
                        cancelTitle: 'Batalkan',
                        alertTitle: 'Konfirmasi Penukaran',
                        alertDetailMessage: alertDetailPesanan,
                        alertActionTitles: alertTitles,
                        onAlertAction: (int selectedActionIndex) {
                          validationCoin(i);
                        }).show(context);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //make border
                      ),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  data[i]['desc'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Text(
                                "${data[i]['price']} Koin",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 5,
                mainAxisExtent: 280,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.backgroundGreen,
    );
  }
}
