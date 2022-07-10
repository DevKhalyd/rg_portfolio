import 'package:cloud_firestore/cloud_firestore.dart';

/// Main methods for the features repositories
abstract class CloudFirestoreRepository {
  /// Use the [firestore] to mock it or to use the real firestore
  CloudFirestoreRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  /// Avoid showing to the children classes
  final FirebaseFirestore _firestore;

  final webCollection = 'web';

  Future<DocumentSnapshot<Object?>> getDocument(
    CollectionReference ref,
    String documentId,
  ) async {
    final doc = await ref.doc(documentId).get();
    return doc;
  }

  /// Write a document to the database
  Future<void> writeDocument(
    CollectionReference ref,
    String documentId,
    Map<String, dynamic> data,
  ) async {
    await ref.doc(documentId).set(data);
  }

  /// Update a document in the database
  Future<void> updateDocument(
    CollectionReference ref,
    String documentId,
    Map<String, dynamic> data,
  ) async {
    await ref.doc(documentId).update(data);
  }

  /// Delete a document from the database
  Future<void> deleteDocument(
    CollectionReference ref,
    String documentId,
  ) async {
    await ref.doc(documentId).delete();
  }

  /// Run a transaction given a transactionHandler
  ///
  /// Just run the required methods to make it work it
  ///
  /// Example: https://firebase.flutter.dev/docs/firestore/usage#transactions
  Future<T> runTransaction<T>(
    TransactionHandler<T> transactionHandler,
  ) async {
    return _firestore.runTransaction<T>(transactionHandler);
  }

  CollectionReference getCollectionReference(String collection) {
    return _firestore.collection(collection);
  }
}
