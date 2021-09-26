import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int pressed) {
        if (pressed == 0) {
          Navigator.pushNamed(context, '/');
        }

        if (pressed == 1) {
          Navigator.pushNamed(context, '/insurance');
        }

        if (pressed == 2) {
          Navigator.pushNamed(context, '/profile');
        }

        _currentIndex = pressed;
      },
      items: getNavigationBarItems(_currentIndex),
      selectedItemColor: Colors.green,
    );
  }

  List<BottomNavigationBarItem> getNavigationBarItems(int index) {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Insurances',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];
  }
}
