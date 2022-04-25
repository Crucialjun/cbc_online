import 'package:cbc_online/global_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/learner_model.dart';

class FirebaseCloudMethods {
  CollectionReference learners =
      FirebaseFirestore.instance.collection(learnersTableName);

  Future<bool> addLearner(Learner learner, BuildContext context) async {
    try {
      await learners.doc(learner.uid).set(learner.toMap());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
