import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/icons.dart';
import 'package:jemputah_app/constants/images.dart';
import 'package:jemputah_app/API/FetchDataJemput.dart';
import 'package:jemputah_app/extensions/time_code_converter.dart';
import 'package:jemputah_app/constants/variable.dart';

class Pesanan extends StatefulWidget {
  const Pesanan({super.key});

  @override
  PesananPage createState() => PesananPage();
}

class PesananPage extends State<Pesanan> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    setPesanan();
  }

  void setPesanan() {
    var penjemputan = FetchDataJemput().fetchListJemputDone(uid);
    penjemputan.then((value) {
      setState(() {
        data = value;
      });
    });
  }

  TimeCodeConverterHour timeCodeConverterHour = TimeCodeConverterHour();

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Scaffold(
          backgroundColor: AppColors.backgroundGreen,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.mainGreen,
            title: const Text('Pesanan'),
            centerTitle: false,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  pesananKosong,
                  width: 250,
                  height: 280,
                  fit: BoxFit.fill,
                ),
                Text(
                  'Ups, Anda belum melakukan \npemesanan',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 20, color: AppColors.hintTextColor),
                ),
              ],
            ),
          ));
    } else {
      return Scaffold(
          backgroundColor: AppColors.backgroundGreen,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.mainGreen,
            title: const Text('Pesanan'),
            centerTitle: false,
          ),
          body: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (data[index]['is_pickup_done'] == true) {
                  return Card(
                      color: AppColors.backgroundGreen,
                      child: ListTile(
                        //set title with style bold
                        title: const Text('Pesanan Selesai',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            '${timeCodeConverterHour.timeCodeConverterHour(data[index]['time_code'])} | ${data[index]['date']}'),
                        leading: Image.asset(
                          iconPesananSelesai,
                          width: 50,
                          height: 50,
                        ),
                      ));
                } else {
                  return Card(
                      color: AppColors.backgroundGreen,
                      child: ListTile(
                        //set title with style bold
                        title: const Text('Pesanan Batal',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            '${timeCodeConverterHour.timeCodeConverterHour(data[index]['time_code'])} | ${data[index]['date']}'),
                        leading: Image.asset(
                          iconPesananBatal,
                          width: 50,
                          height: 50,
                        ),
                      ));
                }
              }));
    }
  }
}
