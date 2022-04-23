import 'package:flutter/cupertino.dart';

import '../models/learner_model.dart';

class LearnerProvider extends ChangeNotifier {
  Learner? _learner;

  Learner? get learner => _learner;

  updateLearner(Learner learner) {
    _learner = learner;
    notifyListeners();
  }
}
