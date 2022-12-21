import 'package:cloud_firestore/cloud_firestore.dart';

class Shop {
  Map<String, dynamic> snap(DocumentSnapshot snapshot) {
    var data = {
      "id_shop": snapshot.id.toString(),
      "desc": snapshot['desc'],
      "logo": snapshot['logo'],
      "price": snapshot['price'],
      "title": snapshot['title'],
    };
    return data;
  }
}
