// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jemputah_app/models/driver.dart';

class FetchDataDriver {
  Future<List<Map<String, dynamic>>> fetchListDriver(int? timecode) async {
    List<Map<String, dynamic>> dataList = [];
    var query = await FirebaseFirestore.instance
        .collection("driver")
        .where("slot_$timecode", isEqualTo: "")
        .get();
    List<DocumentSnapshot> documents = query.docs;
    for (DocumentSnapshot snapshot in documents) {
      Map<String, dynamic> data = {};
      data = Driver().snap(snapshot);
      dataList.add(data);
    }
    return dataList;
  }
}
