import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/images.dart';
import 'package:jemputah_app/constants/icons.dart';

void main() => runApp(const Tukar());

class Tukar extends StatelessWidget {
  const Tukar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TukarPage(),
    );
  }
}

class TukarPage extends StatelessWidget {
  TukarPage({super.key});

  final titles = [
    "Google Play",
    "Telkomsel",
    "Disney+",
    "XL",
    "Youtube Premium",
    "Netflix",
    "Spotify",
    "Tri"
  ];

  final images = [
    googlePlay,
    telkomsel,
    disney,
    xl,
    youtube,
    netflix,
    spotify,
    tri
  ];
  final subtitles = [
    "Anda akan mendapatkan Redeem Code Google Play sebesar Rp. 10.000",
    "Anda akan mendapatkan Redeem Code Google Play sebesar Rp. 10.000",
    "Anda akan mendapatkan Redeem Code Google Play sebesar Rp. 10.000",
    "Anda akan mendapatkan Redeem Code Google Play sebesar Rp. 10.000",
    "Anda akan mendapatkan Redeem Code Google Play sebesar Rp. 10.000",
    "Anda akan mendapatkan Redeem Code Google Play sebesar Rp. 10.000",
    "Anda akan mendapatkan Redeem Code Google Play sebesar Rp. 10.000",
    "Anda akan mendapatkan Redeem Code Google Play sebesar Rp. 10.000",
  ];

  final points = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000];

  @override
  Widget build(BuildContext context) {
    //variable contain int number point
    int point = 1500;
    return Scaffold(
        appBar: AppBar(
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
                itemCount: titles.length,
                //change gridview background color

                itemBuilder: (ctx, i) {
                  return Card(
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
                                child: Image.asset(
                                  images[i],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5, top: 5),
                                child: Text(
                                  titles[i],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  subtitles[i],
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Text(
                                points[i].toString() + " Koin",
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
