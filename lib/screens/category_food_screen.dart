import 'package:cook_we/widgets/food_item.dart';
import 'package:flutter/material.dart';
import '../models/food.dart';


class CategoryFoodScreen extends StatelessWidget {
  final List<Food> availableFoods;

  CategoryFoodScreen(this.availableFoods);
  static final String routeName = '/category_food';
//   final String categoryId;
//   final String categoryTitle;

// CategoryFoodScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryFoods = availableFoods.where((foods) { 
      return foods.categories.contains(categoryId);
    }).toList();
      
    return Scaffold(
      appBar: AppBar(title: Text('Cook ' + categoryTitle),
      ),
          body: 
          ListView.builder(itemBuilder: (ctx, index)  {
return FoodItem(id:categoryFoods[index].id ,affordability: categoryFoods[index].affordability, complexity: categoryFoods[index].complexity,
 duration: categoryFoods[index].duration, imageUrl: categoryFoods[index].imageUrl, title: categoryFoods[index].title);
          },
          itemCount: categoryFoods.length, )
    );
  }
}