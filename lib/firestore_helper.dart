import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// ADD DATA
  static Future<String> addData({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collection).add(data);
      return "Data added successfully";
    } catch (e) {
      return "Failed to add data";
    }
  }

  /// GET DATA
  static Future<List<Map<String, dynamic>>> getData({
    required String collection,
  }) async {
    try {
      QuerySnapshot snapshot = await _firestore.collection(collection).get();

      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// UPDATE DATA
  static Future<String> updateData({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).update(data);
      return "Data updated successfully";
    } catch (e) {
      return "Failed to update data";
    }
  }

  /// DELETE DATA
  static Future<String> deleteData({
    required String collection,
    required String docId,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).delete();
      return "Data deleted successfully";
    } catch (e) {
      return "Failed to delete data";
    }
  }
}
