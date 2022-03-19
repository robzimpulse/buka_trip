import 'package:buka_trip/infrastructure/models/trip.model.dart';
import 'package:buka_trip/infrastructure/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TripsScreen();
}

class _TripsScreen extends State<TripsScreen> {

  Future<void> _generate() async {
    final TripProvider trip = Provider.of<TripProvider>(context, listen: false);

    Trip data = Trip(
      id: '',
      title: 'title',
      description: 'description',
      finalPrice: 100000,
      originalPrice: 200000,
      imageUrls: <String>['a','b'],
      hoster: 'hoster'
    );

    await trip.insert(trip: data);
  }

  @override
  void initState() {
    _generate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}