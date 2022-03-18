import 'package:flutter/material.dart';

import 'widgets/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.location_city_outlined),
      activeIcon: Icon(Icons.location_city),
      label: 'Explore',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map_outlined),
      activeIcon: Icon(Icons.map),
      label: 'Trips',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.mail_outline),
      activeIcon: Icon(Icons.mail),
      label: 'Inbox',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      activeIcon: Icon(Icons.account_circle),
      label: 'Profile',
    )
  ];

  final List<Widget> _bodies = const [
    ExploreWidget(),
    TripsWidget(),
    InboxWidget(),
    ProfileWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: _items,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() { _selectedIndex = index; }),
      ),
      body: Center(child: _bodies[_selectedIndex]),
    );
  }

}