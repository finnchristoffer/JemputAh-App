import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jemputah_app/models/jemput.dart';

class FetchDataBerat {
  Future<List<Map<String, dynamic>>> fetchListBerat() async {
    List<Map<String, dynamic>> dataList = [];
    var query = await FirebaseFirestore.instance
        .collection("jemput")
        .where("ongoing", isEqualTo: false)
        .where("is_pickup_done", isEqualTo: true)
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
