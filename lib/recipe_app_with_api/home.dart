import 'package:august_27/recipe_app_with_api/models/recipe_api.dart';
import 'package:august_27/recipe_app_with_api/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

import 'models/recipe.dart';

class HomePage extends StatefulWidget {
  HomePage({key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(
                width: 10,
              ),
              Text("Food Recipe")
            ],
          ),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) => RecipeCard(
                    title: _recipes[index].name,
                    rating: _recipes[index].rating.toString(),
                    cookTime: _recipes[index].totalTime,
                    thumbnailUrl: _recipes[index].images)));
  }
}
