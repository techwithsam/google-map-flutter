import 'package:flutter/material.dart';
import 'package:flutter_google_map/provider/location_provider.dart';
import 'screens/contribute.dart';
import 'screens/explore.dart';
import 'screens/go.dart';
import 'screens/saved.dart';
import 'screens/updates.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GoogleMapPage extends StatefulWidget {
  GoogleMapPage({Key? key}) : super(key: key);

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  int _currentIndex = 0;
  List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initialization();
    _children.insert(0, ExplorePage());
    _children.insert(1, GoPage());
    _children.insert(2, SavedPage());
    _children.insert(3, ContributePage());
    _children.insert(4, UpdatesPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle:
            GoogleFonts.poppins(fontSize: 8, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            GoogleFonts.poppins(fontSize: 8, fontWeight: FontWeight.w600),
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        iconSize: 22,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.time_to_leave),
            label: 'Go',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Contribute ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Updates',
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
