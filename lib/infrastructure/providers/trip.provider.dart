import 'package:buka_trip/infrastructure/models/trip.model.dart';

abstract class TripProvider  {
  List<Trip> get trips;
  Future<void> insert({required Trip trip});
  Future<void> update({required String id, required Trip trip});
  Future<void> delete({required String id});
  Stream<Trip?> listen({required String id});
}