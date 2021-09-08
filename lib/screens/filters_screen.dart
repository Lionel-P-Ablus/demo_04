import 'package:demo_04/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue) => setState(() {
                    _glutenFree = newValue;
                  }),
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) => setState(() {
                    _lactoseFree = newValue;
                  }),
                ),
                _buildSwitchListTile(
                  'Vegetarian-free',
                  'Only include vegetarian-free meals.',
                  _vegetarian,
                  (newValue) => setState(() {
                    _vegetarian = newValue;
                  }),
                ),
                _buildSwitchListTile(
                  'Vegan-free',
                  'Only include vegan-free meals.',
                  _vegan,
                  (newValue) => setState(() {
                    _vegan = newValue;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
