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
  final subtitles = ["test"];

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
            Container(
              child: Row(
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
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(right: 30, left: 30, bottom: 50),
                itemCount: titles.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    child: Container(
                      height: 290,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  images[i],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                titles[i],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Subtitle',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              )
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
                  mainAxisExtent: 264,
                ),
              ),
            ),
          ],
        ));
  }
}
