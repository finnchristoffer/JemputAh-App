import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserTransaction {
  Map<String, dynamic> snap(DocumentSnapshot snapshot) {
    var data = {
      "id_shop": snapshot['id_shop'],
      "id_user": snapshot['id_user'],
      "tgl_transaksi_user": snapshot['tgl_transaksi_user'],
    };
    return data;
  }
}
