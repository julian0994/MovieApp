import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/data/services/local_storage_service.dart';
import 'package:movieapp/domain/repositories/favorites_repository.dart';

import '../repositories/favorites_repository_impl.dart';

final localStorageServiceProvider= Provider<LocalStorageService>((ref){
  return LocalStorageService();
}
);

final favoriteRepositoryProvider= Provider<FavoritesRepository>((ref){
  final localStorageService=ref.read(localStorageServiceProvider);
  return FavoritesRepositoryImpl(localStorageService:localStorageService);
});

final favoritesProvider= StateNotifierProvider<FavoritesNotifier, List<int>>((ref){
  final repository= ref.read(favoriteRepositoryProvider);
  return FavoritesNotifier(repository);
}

);


class FavoritesNotifier extends StateNotifier<List<int>>{
  final FavoritesRepository repository;

  FavoritesNotifier(this.repository): super([]){
    loadFavorites();
  }

  Future<void> loadFavorites()async{
    final favorites= await repository.getFavorites();
    state=favorites;
  }

  Future<void> toggleFavorite(int movieId) async{
    await repository.toggleFavorite(movieId);
    final isFavorite= await repository.isFavorite(movieId);
    if(isFavorite){
      state=[...state,movieId];
    }else{
      state= state.where((id)=> id != movieId).toList();
    }
  }
}