import 'package:app_receitas/database/db.dart';
import 'package:app_receitas/modelsDataBase/ingredientsRecipes.dart';
import 'package:app_receitas/repositorie/ingredientsRepository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class IngredientsRecipesRepository extends ChangeNotifier{
  late Database db;
  late IngredientsRepository ingredients;

  List<IngredientsRecipes> _ingredientsRecipes = [];

  List<IngredientsRecipes> get IngredientsRecipes =>_ingredientsRecipes;
      

  insertIngredientsRecipes(IngredientsRecipes ingredientsRecipes, int? idRecipe) async{
    db = await DB.instance.database;  
    List consult = await db.query('ingredients',where: '"name" = ${ingredientsRecipes.ingredient.name}');

    if(consult.isNotEmpty) {
      db.insert('ingredients_recipes', {
        'recipe_id': idRecipe,
        'ingredient_id': consult.first['id'],
        'amount_ingredient': ingredientsRecipes.amount,
        'measurement': ingredientsRecipes.measurement
      });
    }
    else{
      ingredients.insertIngredients(ingredientsRecipes.ingredient);
      insertIngredientsRecipes(ingredientsRecipes, idRecipe);
    }
    notifyListeners();
  }
  
}