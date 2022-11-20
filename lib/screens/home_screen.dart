// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/icons.dart';
import 'package:jemputah_app/constants/image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HistoryTransactionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(
        bottom: 40,
        right: 15,
      ),
      icon: Image.asset(
        iconTransaksi,
      ),
      tooltip: "Go to Next Page",
      onPressed: () {
        Navigator.push(context, MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Next page'),
              ),
              body: const Center(
                child: Text(
                  'This is the next page',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
          },
        ));
      },
    );
  }
}

class _LeadAppBar extends StatelessWidget {
  String username = "a";

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: 200,
          margin: EdgeInsets.only(
            left: 14,
            top: 5,
          ),
          child: Image.asset(
            homeLogo,
            fit: BoxFit.fill,
            scale: 0.1,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 14,
          ),
          child: Text(
            "Hai, " + username,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 12,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

class _JemputBox extends StatelessWidget {
  int berat = 10;
  int jmlJemput = 5;
  int koin = 1500;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(178, 186, 159, 1),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Color.fromRGBO(178, 186, 159, 1),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: 35,
              right: 35,
              top: 30,
            ),
            height: 35,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    koin.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
                Text(
                  " Koin",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: AppColors.black,
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 150,
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 13),
                        child: Text(
                          jmlJemput.toString() + " Jemput",
                        ),
                      ),
                      const VerticalDivider(
                        width: 10,
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Text(
                        berat.toString() + " Kg",
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(
                  right: 28,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return Scaffold(
                            appBar: AppBar(
                              title: const Text('Next page'),
                            ),
                            body: const Center(
                              child: Text(
                                'This is the next page',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: Text("Jemput"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBackground,
                    minimumSize: const Size(110, 35),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Carousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselState();
  }
}

class _CarouselState extends State<_Carousel> {
  CarouselController carouselButton = CarouselController();

  int currentPos = 0;
  List<String> carouselImg = [
    carousel1,
    carousel2,
    carousel3,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          height: 170,
          child: CarouselSlider.builder(
            itemCount: carouselImg.length,
            options: CarouselOptions(
              height: 154,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.6,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPos = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return CarouselView(carouselImg[index]);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: carouselImg.map((url) {
            int index = carouselImg.indexOf(url);
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(
                horizontal: 2,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPos == index ? AppColors.black : AppColors.white,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CarouselView extends StatelessWidget {
  String path;

  CarouselView(this.path);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: Image.asset(
          path,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _JadwalJemput extends StatelessWidget {
  final penjemputan = [
    {
      "tgl": "Jumat, 23 September 2022",
      "jam": "08:00 - 10:00",
      "alamat": "Jalan Lengkong Besar No. 47",
    },
    {
      "tgl": "Sabtu, 24 September 2022",
      "jam": "08:00 - 10:00",
      "alamat": "Jalan Lengkong Kecil No. 47",
    }
  ];

  final List<String> entries = <String>['A', 'B', 'C'];

  List<String> tglPenjemputan = [
    "Jumat, 23 September 2022",
    "Sabtu, 24 September 2022",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(
            top: 23.4,
            bottom: 10,
            left: 22,
          ),
          child: const Text(
            "Penjemputanmu Selanjutnya : ",
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 17,
          ),
          height: 250,
          child: ListView.separated(
            itemCount: penjemputan.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  color: AppColors.jadwalCardBackground,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(
                        //bottom: 5,
                        ),
                    title: Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        bottom: 10,
                      ),
                      child: Text(
                        penjemputan[index]["tgl"] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Text(
                            penjemputan[index]["jam"] as String,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Text(
                          penjemputan[index]["alamat"] as String,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    leading: Padding(
                      padding: EdgeInsets.only(
                        left: 5,
                      ),
                      child: Image.asset(
                        iconJadwal,
                        width: 64,
                        height: 64,
                        fit: BoxFit.fill,
                      ),
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(
                        bottom: 5,
                      ),
                      child: const Icon(
                        Icons.navigate_next,
                        size: 60,
                      ),
                    ),
                    onTap: null,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              thickness: 1,
              height: 10,
              color: AppColors.backgroundGreen,
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGreen,
      appBar: AppBar(
        leadingWidth: 200,
        backgroundColor: AppColors.backgroundGreen,
        toolbarHeight: 87,
        elevation: 0,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_LeadAppBar()],
        ),
        actions: [
          _HistoryTransactionButton(),
        ],
      ),
      body: Stack(
        children: [
          Container(
            child: ListView(
              children: [
                Column(
                  children: [
                    _JemputBox(),
                    _Carousel(),
                    _JadwalJemput(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}