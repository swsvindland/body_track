import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:body_track/models/models.dart';
import 'dart:async';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var date = DateTime.now();

  Stream<Drinks> streamDrinks(String id) {
    return _db
        .collection('drinks')
        .doc(id)
        .collection('days')
        .doc('${date.year}${date.month}${date.day}')
        .snapshots()
        .map((snap) => Drinks.fromMap(snap.data()!));
  }

  Future<void> updateDrinks(String id, Drinks drinks) {
    return _db
        .collection('drinks')
        .doc(id)
        .collection('days')
        .doc('${date.year}${date.month}${date.day}')
        .set(Drinks.toMap(drinks));
  }

  Stream<Iterable<Weight>> streamWeighIns(String id) {
    return _db
        .collection('weight')
        .where("uid", isEqualTo: id)
        .snapshots()
        .map((event) => event.docs.map((e) => Weight.fromMap(e.data())));
  }

  Future<void> addWeighIn(String id, double weight) {
    return _db
        .collection('weight').doc().set({
      "uid": id,
      "date": new DateTime.now(),
      "weight": weight
    });
  }

  Future<void> addCheckIn(
      String id,
      double neck,
      double shoulders,
      double chest,
      double leftBicep,
      double rightBicep,
      double navel,
      double waist,
      double leftThigh,
      double rightThigh,
      double leftCalf,
      double rightCalf
      ) {
    return _db
        .collection('checkIns').doc().set({
      "uid": id,
      "date": new DateTime.now(),
      "neck": neck,
      "shoulders": shoulders,
      "chest": chest,
      "leftBicep": leftBicep,
      "rightBicep": rightBicep,
      "navel": navel,
      "waist": waist,
      "leftThigh": leftThigh,
      "rightThigh": rightThigh,
      "leftCalf": leftCalf,
      "rightCalf": rightCalf
    });
  }

  Stream<Preferences> streamPreferences(String id) {
    return _db
        .collection('preferences')
        .doc(id)
        .snapshots()
        .map((snap) => Preferences.fromMap(snap.data()!));
  }

  Future<void> updatePreferences(String id, Preferences preferences) {
    return _db
        .collection('preferences')
        .doc(id)
        .set(Preferences.toMap(preferences));
  }
}
