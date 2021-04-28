import 'package:cook_we/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(BuildContext context, String title, IconData icon, Function tapHandler) {

       return ListTile(
            leading: Icon(icon, size: 26,color: Theme.of(context).primaryColor,),
            title: Text(title,style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            ),
            onTap: () {
              tapHandler();
            },
          );
        
  }
  @override
  Widget build(BuildContext context) {
  

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(height: 120,
          width: double.infinity,
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 60),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Center(
            child: Text('Cook We', style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor
            )),
          )),
          SizedBox(height: 20,),
         buildListTile(context,'Foods', Icons.restaurant,() {
           Navigator.of(context).pushReplacementNamed('/');
         } ),
         buildListTile(context,'Filter', Icons.settings,() {
           Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
         } ),
        ],
      ),
    );
  }
}