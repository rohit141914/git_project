import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavouriteStatus (Meal meal){
    final mealIsFavorite =state.contains(meal);

    if (mealIsFavorite) {
      state=state.where((element) => element.id !=meal.id).toList();
      return false;
    } else {
      state =[...state, meal];
      return true;

    }
  }
}

var favoriteMealsProvider = 
StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref){
return FavoriteMealsNotifier();
});
