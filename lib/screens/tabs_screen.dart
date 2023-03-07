import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    // return DefaultTabController(     //for default controller
        //   length: 2,
        //   //initialIndex: 0,
        //   child:
    Scaffold(
      appBar: AppBar(
        // title: Text('meal'),  //for title meal
        title: Text(_pages[_selectedPageIndex]['title']),
        // bottom: TabBar(                    //by using default tab
        //   tabs: <Widget>[
        //     Tab(
        //       icon: Icon(
        //         Icons.category,
        //       ),
        //       text: 'Categories',
        //     ),
        //     Tab(
        //       icon: Icon(
        //         Icons.star,
        //       ),
        //       text: 'Favorites',
        //     ),
        //   ],
        // ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',            //instead of title: Text('Favorites'),
          ),
        ],
      ),
      // TabBarView(                     //by using default tabs
      //   children: <Widget>[
      //     CategoriesScreen(),
      //     FavoritesScreen(),
      //   ],
      // ),
    );
    //);
  }
}
