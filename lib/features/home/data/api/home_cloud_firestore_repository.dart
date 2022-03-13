import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/repositories/cloud_firestore_repository.dart';

class HomeCloudFirestoreRepository extends CloudFirestoreRepository {
  /// [firestore] is the instance of [Firestore] for Mock or another app instance
  HomeCloudFirestoreRepository({FirebaseFirestore? firestore})
      : super(firestore: firestore ?? FirebaseFirestore.instance);

  final _documentId = 'main_data';
  final _fieldViews = 'total_views';

  /// Get the total views of my website.
  Future<int> getTotalViews() async {
    final ref = getCollectionReference(webCollection);

    /// The place where the information is stored

    final doc = await getDocument(ref, _documentId);

    if (!doc.exists) return 0;

    final data = doc.data() as Map<String, dynamic>;

    final views = data[_fieldViews] as int;

    print('Total views: $views');

    return views;
  }

  /// Increment the total views of my website.
  void updateTotalViews() async {
    final ref = getCollectionReference(webCollection);
    // Avoid a crash when read at the same time
    await Future.delayed(const Duration(seconds: 1));
    updateDocument(ref, _documentId, {_fieldViews: FieldValue.increment(1)})
        .catchError((err) {
      log('Error updating total views: $err');
    });
  }
}
