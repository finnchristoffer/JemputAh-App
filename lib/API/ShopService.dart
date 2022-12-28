// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jemputah_app/models/shop.dart';

class FetchShop {
  Future<List<Map<String, dynamic>>> fetchListShop() async {
    List<Map<String, dynamic>> dataList = [];
    var query = await FirebaseFirestore.instance.collection("shop").get();
    List<DocumentSnapshot> documents = query.docs;
    for (DocumentSnapshot snapshot in documents) {
      Map<String, dynamic> data = {};
      data = Shop().snap(snapshot);
      dataList.add(data);
    }
    return dataList.toList();
  }
}
