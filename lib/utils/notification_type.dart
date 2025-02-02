import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsec_app/provider/auth_provider.dart';
import 'package:tsec_app/provider/firebase_provider.dart';

import '../models/student_model/student_model.dart';

extension AddTopicsPrefix on String {
  String get addTopicsPrefix => "/topics/$this";
}

abstract class NotificationType {
  static const String notification = "All";
  static String yearTopic = "";
  static String yearBranchTopic = "";
  static String yearBranchDivTopic = "";
  static String yearBranchDivBatchTopic = "";

  static void makeTopic(WidgetRef ref) {
    if (ref.watch(firebaseAuthProvider).currentUser?.uid != null) {
      StudentModel? studentmodel = ref.watch(studentModelProvider);
      String studentYear = studentmodel!.gradyear.toString();
      String studentBranch = studentmodel.branch.toString();
      String studentDiv = studentmodel.div.toString();
      String studentBatch = studentmodel.batch.toString();
      yearTopic = studentYear;
      yearBranchTopic = "$studentYear-$studentBranch";
      yearBranchDivTopic = "$studentYear-$studentBranch-$studentDiv";
      yearBranchDivBatchTopic =
          "$studentYear-$studentBranch-$studentDiv-$studentBatch";
    }
  }
}
