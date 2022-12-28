// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jemputah_app/models/jemput.dart';

class FetchDataJemput {
  Future<List<Map<String, dynamic>>> fetchListJemputDone(String? id) async {
    List<Map<String, dynamic>> dataList = [];
    var query = await FirebaseFirestore.instance
        .collection("jemput")
        .where("id_user", isEqualTo: id)
        .where("done", isEqualTo: true)
        .get();
    List<DocumentSnapshot> documents = query.docs;
    for (DocumentSnapshot snapshot in documents) {
      Map<String, dynamic> data = {};
      data = Jemput().snap(snapshot);
      dataList.add(data);
    }
    return dataList;
  }

  Future<List<Map<String, dynamic>>> fetchListJemputNotDone(String? id) async {
    List<Map<String, dynamic>> dataList = [];
    var query = await FirebaseFirestore.instance
        .collection("jemput")
        .where("id_user", isEqualTo: id)
        .where("done", isEqualTo: false)
        .get();
    List<DocumentSnapshot> documents = query.docs;
    for (DocumentSnapshot snapshot in documents) {
      Map<String, dynamic> data = {};
      data = Jemput().snap(snapshot);
      dataList.add(data);
    }
    return dataList;
  }
}
