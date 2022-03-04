import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rg_portfolio/core/repositories/cloud_firestore_repository.dart';

class HomeCloudFirestoreRepository extends CloudFirestoreRepository {
  /// [firestore] is the instance of [Firestore] for Mock or another app instance
  HomeCloudFirestoreRepository({FirebaseFirestore? firestore})
      : super(firestore: firestore ?? FirebaseFirestore.instance);

  Future<int> getTotalViews() async {
    final ref = getCollectionReference(webCollection);

    /// The place where the information is stored
    const documentId = 'main_data';

    final doc = await getDocument(ref, documentId);

    if (doc.exists) {
      try {
        final data = doc.get('total_views');
        return data as int;
      } catch (e) {
        print(e);
        return 0;
      }
    }

    return 0;
  }
}
