import 'package:cook_we/screens/categories_screen.dart';
import 'package:cook_we/screens/favotites_screen.dart';
import 'package:cook_we/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  ///You can add action bar
  final List <Map<String, Object>> _pages = [
    {'page' : CategoriesScreen(), 'title' : 'Categories',},
    {'page' : FavoritesScreen(), 'title': 'My Favorites',}
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
setState(() {
  _selectedPageIndex = index;
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.shifting,
currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text(_pages[_selectedPageIndex]['title']),
          ),
           BottomNavigationBarItem(
             backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text(_pages[_selectedPageIndex]['title']),
          )
        ],
      ),
    );
  }
}
