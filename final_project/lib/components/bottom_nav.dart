import 'package:flutter/material.dart';

import '../views/main_feed.dart';
import '../views/discover_feed.dart';
import '../views/notifications.dart';
import '../views/profile_page.dart';

import '../app_localizations.dart';

/**
 * Top level widget under the 'MyApp' widget
 * This widget is incharge of our bottom naviagtion and any top level state we might need
 */
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Manually making bottom nav items as using the map function
  // would require use to manually hold icon and text data in array anyway

  int _selectedIndex = 0;

  var pages = <Widget>[
    MainFeed(),
    DiscoverFeedPage(),
    // TEMP:
    ProfilePage(userName: 'temp_new_post_owner_name' , userImage: null),
    Notifications(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // set our state onTap, in this case our current page index,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          // items: navItems,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppLocalizations.of(context).translate('btm_nav_home_label'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: AppLocalizations.of(context).translate('btm_nav_search_label'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Account",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: AppLocalizations.of(context).translate('btm_nav_notif_label'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple[600],
        ));
  }
}
