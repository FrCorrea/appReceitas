
import 'package:app_receitas/modelsDataBase/ingredientsGelator.dart';
import 'package:app_receitas/modelsDataBase/person.dart';

class Gelator{
  int id;
  List<IngredientsGelator> ingredients;
  Person person; 

  Gelator({
    required this.id,
    required this.ingredients,
    required this.person
  });
}