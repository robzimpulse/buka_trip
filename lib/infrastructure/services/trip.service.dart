import 'package:buka_trip/infrastructure/models/trip.model.dart';
import 'package:buka_trip/infrastructure/providers/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TripService implements TripProvider {

  final List<Trip> _trips = <Trip>[];
  final CollectionReference<Trip> _root = FirebaseFirestore
      .instance.collection('trip')
      .withConverter<Trip>(
        fromFirestore: (snapshot, _ ) => Trip.fromJson(snapshot.data()!),
        toFirestore: (Trip trip, _) => trip.toJson()
      );

  @override
  List<Trip> get trips => <Trip>[..._trips];

  @override
  Future<void> delete({required String id}) async {
    await _root.doc(id).delete();
  }

  @override
  Future<void> insert({required Trip trip}) async {
    await _root.add(trip);
  }

  @override
  Stream<Trip?> listen({required String id}) {
    return _root.doc(id).snapshots()
        .asyncMap((DocumentSnapshot<Trip> event) => event.data());
  }

  @override
  Future<void> update({required String id, required Trip trip}) async {
    await _root.doc(id).update(trip.toJson());
  }

// Trip? findByID(String id) {
//   try { return _data.firstWhere((Trip element) => element.id == id); }
//   catch(e) { return null; }
// }
//
// List<Trip> findByHoster(String hoster) {
//   try {
//     return _data.where((Trip element) => element.hoster == hoster).toList();
//   }
//   catch(e) { return <Trip>[]; }
// }

// Future<void> fetch() {
//   return _root.then((QuerySnapshot<Map<String, Trip>> value) {
//     _data.clear();
//     for(QueryDocumentSnapshot<Map<String, Trip>> element in value.docs) {
//       Trip object = Trip(
//         id: element.get('id'),
//         title: element.get('title'),
//         description: element.get('description'),
//         originalPrice: double.parse(
//           element.get('originalPrice'),
//         ),
//         finalPrice: double.parse(
//             element.get('finalPrice')
//         ),
//         imageUrls: element.get('imageUrls'),
//         hoster: element.get('hoster'),
//       );
//       _data.insert(0, object);
//     }
//   }).then((_) => notifyListeners());
// }
//
// Future<void> insert(Trip object) {
//   return _root.
// }
}