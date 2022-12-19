import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jemputah_app/models/address.dart';
import 'package:jemputah_app/models/driver.dart';
import 'package:jemputah_app/models/jemput.dart';
import 'package:jemputah_app/models/sampah.dart';
import 'package:jemputah_app/models/shop.dart';
import 'package:jemputah_app/models/user_transaction.dart';
import 'package:jemputah_app/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class FetchData {
  Future<List<Map<String, dynamic>>> fetchListData(
      String collection, String? id) async {
    List<Map<String, dynamic>> dataList = [];
    var query = await FirebaseFirestore.instance
        .collection(collection)
        .where("id_user", isEqualTo: id)
        .get();
    List<DocumentSnapshot> documents = query.docs;
    for (DocumentSnapshot snapshot in documents) {
      Map<String, dynamic> data = {};
      switch (collection) {
        case "address":
          {
            data = Address().snap(snapshot);
          }
          break;
        case "user_transaction":
          {
            data = UserTransaction().snap(snapshot);
          }
          break;
      }
      dataList.add(data);
    }
    return dataList.toList();
  }

  Future<Map<String, dynamic>> fetchMapData(
      String collection, String? document) async {
    Map<String, dynamic> data = {};
    var ref = FirebaseFirestore.instance.collection(collection).doc(document);
    var snapshot = await ref.get();
    switch (collection) {
      case "user":
        {
          data = Users().snap(snapshot);
        }
        break;
      case "address":
        {
          data = Address().snap(snapshot);
        }
        break;
      case "shop":
        {
          data = Shop().snap(snapshot);
        }
        break;
      case "user_transaction":
        {
          data = UserTransaction().snap(snapshot);
        }
        break;
      case "sampah":
        {
          data = Sampah().snap(snapshot);
        }
        break;
      case "jemput":
        {
          data = Jemput().snap(snapshot);
        }
        break;
      case "driver":
        {
          data = Driver().snap(snapshot);
        }
        break;
    }
    return data;
  }
}
