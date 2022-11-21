import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/icons.dart';

class PenjemputanScreen extends StatefulWidget {
  const PenjemputanScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<PenjemputanScreen> {
  double _beratSampahPlastik = 0;
  double _beratSampahKarton = 0;
  double _beratSampahKaca = 0;
  double _beratSampahKaleng = 0;

  double _totalPendapatan = 0;

  void _incrementWeight() {
    setState(() {
      _beratSampahPlastik += 0.5;
    });
  }

  void _decrementWeight() {
    if (_beratSampahPlastik == 0.0) {
      const snackBar = SnackBar(
        content: Text('Berat minimal adalah 0.0 Kg'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      setState(() {
        _beratSampahPlastik -= 0.5;
      });
    }
  }

  String lokasiPengambilan = 'Jalan Lengkong Besar';
  final lokasiPengambilanItems = [
    'Jalan Lengkong Besar',
    'Jalan Buah Batu',
    'Jalan Salam',
    'Jalan Merdeka',
    'Jalan Soekarno Hatta'
  ];

  String waktuPengambilan = '07:00 - 08.00';
  final waktuPengambilanItems = [
    '07:00 - 08.00',
    '08:00 - 09.00',
    '09:00 - 10.00',
    '10:00 - 11.00',
    '11:00 - 12.00',
    '12:00 - 13.00',
    '13:00 - 14.00',
    '14:00 - 15.00',
    '15:00 - 16.00',
    '16:00 - 17.00',
  ];

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
        title: const Text('Pesan Penjemputan'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(left: 24, top: 30),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Jenis Daur Ulang',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
              height: 42,
              margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
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
                    width: 50,
                    child: Text('Plastik'),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 84, right: 18),
                          height: 30,
                          width: 30,
                          child: FloatingActionButton(
                              backgroundColor: AppColors.grayDecrement,
                              onPressed: _decrementWeight,
                              child: const Icon(Icons.remove)),
                        ),
                        Text("$_beratSampahPlastik"),
                        const Text('Kg'),
                        Container(
                          margin: const EdgeInsets.only(left: 18),
                          height: 30,
                          width: 30,
                          child: FloatingActionButton(
                              backgroundColor: Colors.black,
                              onPressed: _incrementWeight,
                              child: const Icon(Icons.add)),
                        ),
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
                    width: 50,
                    child: Text('Karton'),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 84, right: 18),
                          height: 30,
                          width: 30,
                          child: FloatingActionButton(
                              backgroundColor: AppColors.grayDecrement,
                              onPressed: _decrementWeight,
                              child: const Icon(Icons.remove)),
                        ),
                        Text("$_beratSampahKarton"),
                        const Text('Kg'),
                        Container(
                          margin: const EdgeInsets.only(left: 18),
                          height: 30,
                          width: 30,
                          child: FloatingActionButton(
                              backgroundColor: Colors.black,
                              onPressed: _incrementWeight,
                              child: const Icon(Icons.add)),
                        ),
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
                    width: 50,
                    child: Text('Kaca'),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 84, right: 18),
                          height: 30,
                          width: 30,
                          child: FloatingActionButton(
                              backgroundColor: AppColors.grayDecrement,
                              onPressed: _decrementWeight,
                              child: const Icon(Icons.remove)),
                        ),
                        Text("$_beratSampahKaca"),
                        const Text('Kg'),
                        Container(
                          margin: const EdgeInsets.only(left: 18),
                          height: 30,
                          width: 30,
                          child: FloatingActionButton(
                              backgroundColor: Colors.black,
                              onPressed: _incrementWeight,
                              child: const Icon(Icons.add)),
                        ),
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
                    width: 50,
                    child: Text('Kaleng'),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 84, right: 18),
                          height: 30,
                          width: 30,
                          child: FloatingActionButton(
                              backgroundColor: AppColors.grayDecrement,
                              onPressed: _decrementWeight,
                              child: const Icon(Icons.remove)),
                        ),
                        Text("$_beratSampahKaca"),
                        const Text('Kg'),
                        Container(
                          margin: const EdgeInsets.only(left: 18),
                          height: 30,
                          width: 30,
                          child: FloatingActionButton(
                              backgroundColor: Colors.black,
                              onPressed: _incrementWeight,
                              child: const Icon(Icons.add)),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 30),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Lokasi Pengambilan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                  margin: const EdgeInsets.only(right: 20),
                  width: 34,
                  height: 34,
                  child: const Icon(Icons.location_on),
                ),
                SizedBox(
                  width: 260,
                  child: DropdownButton(
                    isExpanded: true,
                    // Initial Value
                    value: lokasiPengambilan,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    dropdownColor: const Color.fromRGBO(178, 186, 159, 1),
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    items: lokasiPengambilanItems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        lokasiPengambilan = newValue!;
                      });
                    },
                  ),
                ),
              ])),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 30),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Waktu Pengambilan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                  margin: const EdgeInsets.only(right: 20),
                  width: 34,
                  height: 34,
                  child: const Icon(Icons.timer),
                ),
                SizedBox(
                  width: 260,
                  child: DropdownButton(
                    isExpanded: true,
                    // Initial Value
                    value: waktuPengambilan,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    dropdownColor: const Color.fromRGBO(178, 186, 159, 1),
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    items: waktuPengambilanItems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        waktuPengambilan = newValue!;
                      });
                    },
                  ),
                ),
              ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 70, left: 24),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Total Pendapatan Anda',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70, right: 24),
                child: Text(("$_totalPendapatan Koin"),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          GestureDetector(
              onTap: () => {
                    /* onClick code nanti disini */
                  },
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
                height: 42,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(62, 75, 42, 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const SizedBox(
                    width: 300,
                    child: Text(
                      'Atur Penjemputan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.arrow_circle_right,
                      color: Colors.white,
                    ),
                  )
                ]),
              )),
        ]),
      ),
    );
  }
}
