import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/first_pages/start_page.dart';
import 'package:flutter_food/helpers/platform_aware_asset_image.dart';
import 'package:flutter_food/pages/profile/profile_page.dart';
import 'package:flutter_food/pages/shop/shop_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedDrawerItemIndex = 0;

  final _pageDataList = [
    {
      'icon': Icons.add_shopping_cart,
      'title': 'Shopping',
      'page': ShopMainPage(),
    },
    {
      'icon': Icons.person,
      'title': 'Profile',
      'page': ProfilePage(),
    },
    {
      'icon': Icons.logout,
      'title': 'Log Out',
      'page': Start(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDataList[_selectedDrawerItemIndex]['title'] as String),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.background,
                  ],
                ),
                //color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      child: PlatformAwareAssetImage(
                        assetPath: 'assets/images/profile2.jpg',
                      ),
                    )
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Tanawoot Samerjai',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'tanawoot.work@gmail.com',
                    style: TextStyle(
                        fontSize: 14.0, color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
            for (var item in _pageDataList)
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      color: item == _pageDataList[_selectedDrawerItemIndex]
                          ? Theme.of(context).accentColor
                          : null,
                    ),
                    SizedBox(width: 8.0),
                    Text(item['title'] as String),
                  ],
                ),
                onTap: () {
                  setState(() {
                    _selectedDrawerItemIndex =
                        _pageDataList.indexWhere((element) => item == element);
                  });
                  Navigator.of(context).pop();
                },
                selected: item == _pageDataList[_selectedDrawerItemIndex],
              ),
          ],
        ),
      ),
      body: Container(
        child: _pageDataList[_selectedDrawerItemIndex]['page'] as Widget,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:
              Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
              colors: <Color>[
              Color(0xff34ee00),
            Color(0xff00f8a4)
          ],
          ),
        ),
      ),
    );
  }
}