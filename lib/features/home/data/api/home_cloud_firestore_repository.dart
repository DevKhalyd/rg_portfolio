import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/repositories/cloud_firestore_repository.dart';

// TODO: Implement this methods in the bloc method

class HomeCloudFirestoreRepository extends CloudFirestoreRepository {
  /// [firestore] is the instance of [Firestore] for Mock or another app instance
  HomeCloudFirestoreRepository({FirebaseFirestore? firestore})
      : super(firestore: firestore ?? FirebaseFirestore.instance);

  final _documentId = 'main_data';
  final _fieldViews = 'total_views';

  Future<int> getTotalViews() async {
    final ref = getCollectionReference(webCollection);

    /// The place where the information is stored

    final doc = await getDocument(ref, _documentId);

    if (doc.exists) {
      try {
        final data = doc.get(_fieldViews);
        return data as int;
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }

  void updateTotalViews() {
    final ref = getCollectionReference(webCollection);
    updateDocument(ref, _documentId, {_fieldViews: FieldValue.increment(1)})
        .catchError((err) {
      log('Error updating total views: $err');
    });
  }
}
