import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  Map<String, dynamic> snap(DocumentSnapshot snapshot) {
    var data = {
      "email_user": snapshot['email_user'],
      "jml_berat": snapshot['jml_berat'],
      "jml_jemput": snapshot['jml_jemput'],
      "jml_koin_user": snapshot['jml_koin_user'],
      "name_user": snapshot['name_user'],
      "phone_num_user": snapshot['phone_num_user'],
      "profile_pic_user":snapshot['profile_pic_user'],
    };
    return data;
  }
}
