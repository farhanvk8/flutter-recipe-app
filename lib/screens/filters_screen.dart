import 'package:cook_we/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map filters;



  FiltersScreen(this.filters,this.saveFilters);

  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

@override
  initState() {
_glutenFree = widget.filters['gluten'];
_vegetarian = widget.filters['vegetarian'];
_vegan = widget.filters['vegan'];
_lactoseFree = widget.filters['lactose'];
  }

  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      inactiveTrackColor: Theme.of(context).primaryColor,
      value: currentValue,
      subtitle: Text(
        description,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Add Filters'),actions: <Widget>[
          IconButton(icon: Icon(Icons.save),onPressed: () {
            final selectedFilter ={
    'gluten': _glutenFree,
    'lactose': _lactoseFree,
    'vegan': _vegan,
    'vegetarian': _vegetarian
  };
            widget.saveFilters(selectedFilter);
            },)
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile('Gluten-free',
                    'Only include gluten-free foods', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                 _buildSwitchTile('Vegetarian',
                    'Only include non-vegetarian foods', _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                 _buildSwitchTile('Vegan',
                    'Only include vegan foods', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),_buildSwitchTile('Lactose-free',
                    'Only include Lactose free foods', _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
