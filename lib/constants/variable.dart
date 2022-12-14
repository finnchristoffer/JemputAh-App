library jemputah_app.global;

import 'package:firebase_auth/firebase_auth.dart';

final String? uid = FirebaseAuth.instance.currentUser?.uid;
