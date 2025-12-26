import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/core/service/data_base_service.dart';

class FireStoreService extends DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addUser({
    required String path,
    required Map<String, dynamic> json,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(json);
    } else {
      await firestore.collection(path).add(json);
    }
  }

  
  @override
  Future<dynamic> getData({required String path, String? documentId}) async {
    if (documentId != null) {
      var json = await firestore.collection(path).doc(documentId).get();
      return json.data() as Map<String, dynamic>;
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);

      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  


 
}
