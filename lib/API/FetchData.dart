import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jemputah_app/models/address.dart';
import 'package:jemputah_app/models/jemput.dart';
import 'package:jemputah_app/models/sampah.dart';
import 'package:jemputah_app/models/shop.dart';
import 'package:jemputah_app/models/user_transaction.dart';
import 'package:jemputah_app/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class FetchData {
  Future<Map<String, dynamic>> fetchData(
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
    }
    return data;
  }
}
