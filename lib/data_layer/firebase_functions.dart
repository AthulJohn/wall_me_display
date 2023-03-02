import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseFunctions {
  static FirebaseFirestore db = FirebaseFirestore.instance;

  static Future<Map<String, dynamic>> firebaseGetSite(String siteUrl) async {
    /*return a map with the following structure:
    {
      "data":QuerySnapshot<Map<String, dynamic>>?,
      "status": String
    }
    */
    QuerySnapshot<Map<String, dynamic>>? data;
    String status = '';

    try {
      await db.runTransaction((transaction) async {
        final snapshot =
            await transaction.get(db.collection('sites').doc(siteUrl));

        if (snapshot.exists) {
          data = await snapshot.reference.collection("0").get();

          transaction.update(db.collection('sites').doc(siteUrl),
              {"views": snapshot.data()!["views"] + 1});
          status = 'Success';
        } else {
          status = '404: No site Found in the Url';
        }
      });
    } catch (e) {
      status = e.toString();
    }
    return {'data': data, 'status': status};
  }
}
