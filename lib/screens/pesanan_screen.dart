import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/icons.dart';

class Pesanan extends StatelessWidget {
  const Pesanan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PesananPage(),
    );
  }
}

class PesananPage extends StatelessWidget {
  PesananPage({super.key});

  final titles = ["Pesanan Selesai", "Pesanan Selesai", "Pesananan Selesai"];
  final subtitles = [
    "10:00 | 23 Sept 2022",
    "11:00 | 23 Sept 2022",
    "12:00 | 23 Sept 2022"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundGreen,
        appBar: AppBar(
          //make background color black
          backgroundColor: AppColors.mainGreen,
          title: const Text('Pesanan'),
          centerTitle: false,
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
                    subtitle: Text(subtitles[index]),
                    leading: Image.asset(
                      iconPesananSelesai,
                      width: 50,
                      height: 50,
                    ),
                  ));
            }));
  }
}
