import 'package:flutter/material.dart';
import 'package:cook_we/dummy_data.dart';

class FoodDetailScreen extends StatelessWidget {
  static const routeName = '/food-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
return  Container(
                 margin: EdgeInsets.symmetric( vertical: 10),
                 child: Text(text, style:Theme.of(context).textTheme.headline6)
               );
  }

  
  Widget buildContainer (BuildContext context,Widget child){
    return
     Container(
                 padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).accentColor),
                  borderRadius: BorderRadius.circular(10)),
                 height:150, width: 350,
                 child: child,
                 );
  }
  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context).settings.arguments as String;
    final selectedFood = DUMMY_FOODS.firstWhere((food) => food.id == foodId);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedFood.title}'),
        ),
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    selectedFood.imageUrl,
                    fit: BoxFit.cover,
                  )),
                buildSectionTitle(context, 'Ingredients'),
                 buildContainer(context,
                     ListView.builder(
                   itemBuilder: (ctx, index) {
return Card(color:Theme.of(context).primaryColor ,child:
 Padding(padding: EdgeInsets.all(8),
  child: Center(child: Text(selectedFood.ingredients[index], style: TextStyle(fontWeight: FontWeight.bold,),))));
                   },
                   itemCount: selectedFood.ingredients.length,
                 ) ,
                ), 
                buildSectionTitle(context, 'Steps'),
                buildContainer(context, 
                ListView.builder(itemBuilder:
                (ctx, index) => ListTile(
                  leading: CircleAvatar(child: Text('# ${index + 1}'),
                  ),title: Text(selectedFood.steps[index],style: TextStyle(color: Colors.white),),
                )
                 ,itemCount: selectedFood.steps.length,)),
            ],
          ),
        ),
  
        );
  }
}
