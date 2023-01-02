library jemputah_app.global;

import 'package:firebase_auth/firebase_auth.dart';

String? uid = FirebaseAuth.instance.currentUser?.uid;

void setVariable(String? updateUid) {
  uid = updateUid;
}
