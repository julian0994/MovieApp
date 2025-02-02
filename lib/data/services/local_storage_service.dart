import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{
  static const String _favoritesKey= 'favorites';

  Future<void> toggleFavorite(int movieId) async{
    final preferences= await SharedPreferences.getInstance();
    final favorites= preferences.getStringList(_favoritesKey)??[];
    if (favorites.contains(movieId.toString())){
      favorites.remove(movieId.toString());
    }else{
      favorites.add(movieId.toString());
    }
    await preferences.setStringList(_favoritesKey, favorites);
  }


  Future<bool> isFavorite(int movieId) async{
    final preferences =await SharedPreferences.getInstance();
    final favorites=preferences.getStringList(_favoritesKey)??[];
    return favorites.contains(movieId.toString());
  }

  Future<List<int>> getFavorites() async{
    final preferences=await SharedPreferences.getInstance();
    final favorites=preferences.getStringList(_favoritesKey) ?? [];
    return favorites.map((id)=>int.parse(id)).toList();
  }
}