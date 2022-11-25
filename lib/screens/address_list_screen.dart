import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/icons.dart';
import 'package:jemputah_app/screens/address_detail_screen.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({Key? key}) : super(key: key);

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  final address = [
    {
      "alamat": "Jl. Lengkong Besar No. 47",
      "kecamatan": "Lengkong",
      "kota": "Bandung",
      "kodePos": "40261",
    },
    {
      "alamat": "Jl. Lengkong Kecil No. 47",
      "kecamatan": "Lengkong",
      "kota": "Bandung",
      "kodePos": "40261",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainGreen,
        leading: BackButton(
          color: AppColors.white,
        ),
        title: Text(
          "Daftar Alamat",
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
        actions: [
          InkWell(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 10,
              ),
              child: Text(
                "Tambah Alamat",
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const AddressDetailPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 34,
              left: 24,
              bottom: 10,
            ),
            child: Text("Alamat Penjemputan"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemCount: address.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.secondaryBorder,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          top: 10,
                          bottom: 5,
                        ),
                        child: Text(
                          address[index]["alamat"] as String,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          bottom: 5,
                        ),
                        child: Text(
                          address[index]["kecamatan"] as String,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            Text(
                              address[index]["kota"] as String,
                            ),
                            Text("  |   "),
                            Text(
                              address[index]["kodePos"] as String,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          bottom: 15,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 250,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: null,
                                child: Text(
                                  "Ubah Alamat",
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 30,
                              ),
                              width: 30,
                              height: 30,
                              child: Image.asset(
                                iconDelete,
                                width: 27,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                thickness: 1,
                height: 30,
                color: AppColors.backgroundGreen,
              ),
            ),
          )
        ],
      ),
      backgroundColor: AppColors.backgroundGreen,
    );
  }
}
