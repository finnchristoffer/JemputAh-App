import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/icons.dart';

class Transaksi extends StatelessWidget {
  const Transaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransaksiScreen(),
    );
  }
}

class TransaksiScreen extends StatelessWidget {
  TransaksiScreen({super.key});

  final titles = [
    "Penukaran Koin Berhasil",
    "Penukaran Koin Berhasil",
    "Penukaran Koin Berhasil"
  ];
  final subtitles = [
    "2000 Koin | Pulsa Telkomsel",
    "3000 Koin | Disney+ 1 Bulan",
    "2000 Koin | Pulsa Tri"
  ];
  final date = ["23 Sept 2022", "24 Sept 2022", "25 Sept 2022"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundGreen,
        appBar: AppBar(
          leading: const BackButton(color: Colors.white),
          backgroundColor: AppColors.mainGreen,
          title: const Text('Transaksi'),
        ),
        body: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Card(
                  color: AppColors.backgroundGreen,
                  child: ListTile(
                    //set title with style bold
                    title: Text(titles[index],
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subtitles[index],
                          style: const TextStyle(color: Colors.black),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(date[index]),
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
