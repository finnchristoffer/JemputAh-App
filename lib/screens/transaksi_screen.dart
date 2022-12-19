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
  List shopTitle = ['Title'];
  List shopPrice = [0];

  void setShop(int index, String idShop) {
    var shop = FetchData().fetchMapData('shop', idShop);
    shop.then((value) {
      setState(() {
        shopTitle[index] = value['title'];
        shopPrice[index] = value['price'];
      });
    });
  }

  void setTransaksi() {
    var index = 0;
    var penjemputan = FetchData().fetchListData('user_transaction', uid);
    penjemputan.then((value) {
      setState(() {
        dataTransaksi = value;
        value.forEach((element) {
          setShop(index, element['id_shop']);
          index += 1;
        });
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
              const Text(
                "Ups, Anda belum melakukan \ntransaksi apapun",
                style: TextStyle(
                  fontSize: 20,
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
                            shopPrice[index].toString() +
                                'Koin   | ' +
                                shopTitle[index],
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
