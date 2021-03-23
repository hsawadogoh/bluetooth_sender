import 'package:bluetooth/components/home_content.dart';
import 'package:bluetooth/constants.dart';
import 'package:bluetooth/size_config.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItem = 0;

  List<Widget> _tabsWidgetsOptions = [
    HomeContent(),
    Text(
        'Nouvel appareil'
    ),
    Text(
        'Fichiers reçus'
    )
  ];

  void _onItemTaped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Sender'),
        leading: Icon(
            Icons.bluetooth
        ),
        actions: [
          GestureDetector(
            child: Icon(
                Ionicons.ellipsis_vertical_outline
            ),
            onTap: () {
              buildShowMenu(context);
            },
          )
        ],
      ),
      body: Center(
        child: _tabsWidgetsOptions.elementAt(_selectedItem),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Future buildShowMenu(BuildContext context) {
    return showMenu(
        context: context, 
        position: RelativeRect.fromLTRB(300.0, 50.0, 20.0, 600.0),
        items: [
          PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.share, color: kPrimaryColor,),
                  SizedBox(width: 10,),
                  Text('Partager l\'application')
                ],
              ),
            textStyle: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          PopupMenuDivider(),
          PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: kPrimaryColor,),
                  SizedBox(width: 10,),
                  Text('A propos de nous')
                ],
              ),
            textStyle: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          PopupMenuDivider(),
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.exit_to_app, color: kPrimaryColor,),
                SizedBox(width: 10,),
                Text('Quitter')
              ],
            ),
            textStyle: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Nouvel appareil'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_download),
          label: 'Fichiers reçus',
        )
      ],
      currentIndex: _selectedItem,
      onTap: _onItemTaped,
    );
  }
}
