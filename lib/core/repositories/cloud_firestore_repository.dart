import 'package:cloud_firestore/cloud_firestore.dart';

/// Main methods for the features repositories
abstract class CloudFirestoreRepository {
  const CloudFirestoreRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  final FirebaseFirestore _firestore;

  final webCollection = 'web';

  Future<DocumentSnapshot<Object?>> getDocument(
    CollectionReference ref,
    String documentId,
  ) async {
    final doc = await ref.doc(documentId).get();
    return doc;
  }

  CollectionReference getCollectionReference(String collection) {
    return _firestore.collection(collection);
  }
}
