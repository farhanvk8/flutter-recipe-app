import 'package:cook_we/dummy_data.dart';
import 'package:cook_we/screens/category_food_screen.dart';
import 'package:cook_we/screens/filters_screen.dart';
import 'package:cook_we/screens/food_details.dart';
import 'package:cook_we/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import './screens/category_food_screen.dart';
import './models/food.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters ={
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Food> _availableFood = DUMMY_FOODS;
  void _setFilter(Map<String, bool> filterData) {
setState(() {
  _filters = filterData;

  _availableFood = DUMMY_FOODS.where((food)  {

    if(_filters['gluten'] && !food.isGlutenFree) {
return false;
    } if(_filters['lactose'] && !food.isLactoseFree) {
return false;
    } if(_filters['vegan'] && !food.isVegan) {
return false;
    }if(_filters['vegetarian'] && !food.isVegetarian) {
return false;
    }
return true;
  }).toList();
});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cook We',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.purple,
        canvasColor: Colors.black45,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
             bodyText2: TextStyle(
            color: Colors.white,
            ),
            headline6: TextStyle(
              color: Colors.white ,
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold
            ),
        )
      ),
      home: TabsScreen(),
      routes: {
        CategoryFoodScreen.routeName: (ctx) => CategoryFoodScreen(_availableFood),
        FoodDetailScreen.routeName: (ctx) => FoodDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters,_setFilter)
      } ,
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);  // get route names of clicked
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      onUnknownRoute:(settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

