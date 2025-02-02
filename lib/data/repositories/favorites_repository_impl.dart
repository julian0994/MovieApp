import 'package:movieapp/data/services/local_storage_service.dart';
import 'package:movieapp/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository{
  final LocalStorageService localStorageService;

  FavoritesRepositoryImpl({required this.localStorageService});

  @override
  Future<void> toggleFavorite(int movieId)async {
    await localStorageService.toggleFavorite(movieId);
  }

  @override
  Future<bool> isFavorite(int movieId) async{
    return await localStorageService.isFavorite(movieId);
  }

  @override
  Future<List<int>> getFavorites() async{
    return await localStorageService.getFavorites();
  }
}