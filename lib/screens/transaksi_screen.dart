import 'package:flutter/material.dart';
import 'package:jemputah_app/API/FetchData.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/icons.dart';
import 'package:jemputah_app/constants/images.dart';
import 'package:jemputah_app/constants/variable.dart';

class TransaksiScreen extends StatefulWidget {
  const TransaksiScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TransaksiScreenState();
}

class _TransaksiScreenState extends State<TransaksiScreen> {
  List<Map<String, dynamic>> dataTransaksi = [];
  List shopTitle = [];
  List shopPrice = [];

  void setShop(int index, String idShop) {
    var shop = FetchData().fetchMapData('shop', idShop);
    shop.then((value) {
      setState(() {
        shopTitle.add(value['title']);
        shopPrice.add(value['price']);
      });
    });
  }

  void setTransaksi() {
    var i = 0;
    var index = 0;
    var penjemputan = FetchData().fetchListData('user_transaction', uid);
    penjemputan.then((value) {
      setState(() {
        dataTransaksi = value;
        index = value.length;

        for (i; i < index; i++) {
          setShop(i, value[i]['id_shop']);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setTransaksi();
  }

  @override
  Widget build(BuildContext context) {
    if (dataTransaksi.isEmpty) {
      return Scaffold(
          backgroundColor: AppColors.backgroundGreen,
          appBar: AppBar(
            leading: const BackButton(color: Colors.white),
            backgroundColor: AppColors.mainGreen,
            title: const Text('Transaksi'),
          ),
          body: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 250, bottom: 50),
                child: Image.asset(
                  historyEmpty,
                ),
              ),
              Text(
                "Ups, Anda belum melakukan \ntransaksi apapun",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.hintTextColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )));
    } else {
      return Scaffold(
          backgroundColor: AppColors.backgroundGreen,
          appBar: AppBar(
            leading: const BackButton(color: Colors.white),
            backgroundColor: AppColors.mainGreen,
            title: const Text('Transaksi'),
          ),
          body: ListView.builder(
              itemCount: dataTransaksi.length,
              itemBuilder: (context, index) {
                return Card(
                    color: AppColors.backgroundGreen,
                    child: ListTile(
                      title: const Text('Penukaran Koin Berhasil',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${shopPrice[index]} Koin   | ${shopTitle[index]}',
                            style: const TextStyle(color: Colors.black),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                                dataTransaksi[index]["tgl_transaksi_user"]),
                          )
                        ],
                      ),
                      isThreeLine: true,
                      leading: Image.asset(
                        iconKoin,
                        width: 50,
                        height: 50,
                      ),
                    ));
              }));
    }
  }
}
