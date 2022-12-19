import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/icons.dart';
import 'package:jemputah_app/extensions/time_code_converter.dart';

import '../API/FetchData.dart';

class DetailPenjemputanScreen extends StatefulWidget {
  final String id_jemput;

  const DetailPenjemputanScreen(this.id_jemput, {super.key});

  @override
  State<StatefulWidget> createState() => InitState(id_jemput);
}

class InitState extends State<DetailPenjemputanScreen> {
  String id_jemput;

  InitState(this.id_jemput);

  dynamic _beratSampahPlastik = 0;
  dynamic _beratSampahKarton = 0;
  dynamic _beratSampahKaca = 0;
  dynamic _beratSampahKaleng = 0;

  dynamic _totalPendapatan = 0;
  dynamic _totalBerat = 0;

  String _alamatPenjemputan = 'Loading...';
  String _tanggalPenjemputan = 'Loading...';
  String _waktuPenjemputan = 'Loading...';
  String _namaDriver = 'Loading...';
  String _noTelpDriver = 'Loading...';
  String _idSampah = '';
  String _idDriver = '';
  TimeCodeConverter timeCodeConverter = TimeCodeConverter();

  void setJemput() {
    var jemput = FetchData().fetchMapData('jemput', id_jemput);
    jemput.then((value) {
      setState(() {
        _totalPendapatan = value['total_koin_user'];
        _totalBerat = value['total_berat'];
        _idSampah = value['id_sampah'];
        _alamatPenjemputan = value['address'];
        _tanggalPenjemputan = value['date'];
        _idDriver = value['id_driver'];
        _waktuPenjemputan =
            timeCodeConverter.timeCodeConverter(value['time_code']);
        setSampah();
        setDriver();
      });
    });
  }

  void setSampah() {
    var sampah = FetchData().fetchMapData('sampah', _idSampah);
    sampah.then((value) {
      setState(() {
        _beratSampahPlastik = value['berat1'].toDouble();
        _beratSampahKarton = value['berat2'].toDouble();
        _beratSampahKaca = value['berat3'].toDouble();
        _beratSampahKaleng = value['berat4'].toDouble();
      });
    });
  }

  void setDriver() {
    var driver = FetchData().fetchMapData('driver', _idDriver);
    driver.then((value) {
      setState(() {
        _namaDriver = value['name_driver'];
        _noTelpDriver = value['phone_num_driver'];
      });
    });
  }

  @override
  void initState() {
    setJemput();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 246, 233, 1),
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: AppColors.mainGreen,
        title: const Text('Detail Pesanan'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.separatorLine,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  margin: const EdgeInsets.only(top: 10, left: 24, bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _namaDriver,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, right: 24, bottom: 10),
                  child: Text((_noTelpDriver),
                      style: const TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 10),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Jenis Sampah Daur Ulang :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
              height: 42,
              margin: const EdgeInsets.only(left: 24, right: 24, top: 5),
              padding: const EdgeInsets.only(left: 10, right: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(178, 186, 159, 1),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 34,
                    height: 34,
                    child: Image.asset(
                      iconPlastik,
                    ),
                  ),
                  const SizedBox(
                    width: 220,
                    child: Text('Plastik'),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Text("$_beratSampahPlastik"),
                        const Text(' Kg'),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
              height: 42,
              margin: const EdgeInsets.only(left: 24, right: 24, top: 8),
              padding: const EdgeInsets.only(left: 10, right: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(178, 186, 159, 1),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 34,
                    height: 34,
                    child: Image.asset(
                      iconKarton,
                    ),
                  ),
                  const SizedBox(
                    width: 220,
                    child: Text('Karton'),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Text("$_beratSampahKarton"),
                        const Text(' Kg'),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
              height: 42,
              margin: const EdgeInsets.only(left: 24, right: 24, top: 8),
              padding: const EdgeInsets.only(left: 10, right: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(178, 186, 159, 1),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 34,
                    height: 34,
                    child: Image.asset(
                      iconKaca,
                    ),
                  ),
                  const SizedBox(
                    width: 220,
                    child: Text('Kaca'),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Text("$_beratSampahKaca"),
                        const Text(' Kg'),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
              height: 42,
              margin: const EdgeInsets.only(left: 24, right: 24, top: 8),
              padding: const EdgeInsets.only(left: 10, right: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(178, 186, 159, 1),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 34,
                    height: 34,
                    child: Image.asset(
                      iconKaleng,
                    ),
                  ),
                  const SizedBox(
                    width: 220,
                    child: Text('Kaleng'),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Text("$_beratSampahKaleng"),
                        const Text(' Kg'),
                      ],
                    ),
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5, right: 24),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Total Berat :',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, right: 35),
                child: Text(("$_totalBerat Kg"),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 15),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Lokasi Pengambilan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
              height: 42,
              margin: const EdgeInsets.only(left: 24, right: 24, top: 8),
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(178, 186, 159, 1),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 34,
                  height: 34,
                  child: const Icon(Icons.location_on),
                ),
                SizedBox(
                    width: 260,
                    child: Text(
                      _alamatPenjemputan,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    )),
              ])),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 15),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Tanggal Pengambilan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
              height: 42,
              margin: const EdgeInsets.only(left: 24, right: 24, top: 8),
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(178, 186, 159, 1),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 34,
                  height: 34,
                  child: const Icon(Icons.calendar_month),
                ),
                SizedBox(
                    width: 260,
                    child: Text(
                      _tanggalPenjemputan,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    )),
              ])),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 15),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Waktu Pengambilan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
              height: 42,
              margin: const EdgeInsets.only(left: 24, right: 24, top: 8),
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(178, 186, 159, 1),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 34,
                  height: 34,
                  child: const Icon(Icons.timer),
                ),
                SizedBox(
                    width: 260,
                    child: Text(
                      '$_waktuPenjemputan',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    )),
              ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25, left: 24),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Total Pendapatan Anda',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25, right: 24),
                child: Text(("$_totalPendapatan Koin"),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
