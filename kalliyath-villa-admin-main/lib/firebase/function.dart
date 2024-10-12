import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getFirebaseDetails(String collection) async {
  final CollectionReference firedata =
      FirebaseFirestore.instance.collection(collection);

  QuerySnapshot querySnapshot = await firedata.get();

  List<Map<String, dynamic>> dataList = [];

  for (var doc in querySnapshot.docs) {
    if (doc.exists) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        // Add document ID to the data map
        data['id'] = doc.id;
        dataList.add(data);
      }
    }
  }

  return dataList;
}
