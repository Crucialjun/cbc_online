import 'package:cbc_online/global_constants.dart';
import 'package:cbc_online/utils/show_dialogs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/learner_model.dart';
import '../providers/learner_provider.dart';

class FirebaseCloudMethods extends ChangeNotifier {
  CollectionReference learners =
      FirebaseFirestore.instance.collection(learnersTableName);

  Future<bool> addLearner(Learner learner, BuildContext context) async {
    try {
      await learners.doc(learner.uid).set(learner.toMap());
      return true;
    } catch (e) {
      showErrorDialog(context, e.toString());
      return false;
    }
  }

  Future<Learner?> getAuthenticatedLearner(
      String uid, BuildContext context) async {
    try {
      DocumentSnapshot snapshot = await learners.doc(uid).get();
      Learner learner = Learner.fromDocumentSnapshot(snapshot);
      print(learner);
      await Provider.of<LearnerProvider>(context, listen: false)
          .updateLearner(learner);
      return learner;
    } catch (e) {
      return null;
    }
  }
}
