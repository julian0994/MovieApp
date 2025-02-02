abstract class FavoritesRepository{
  Future<void> toggleFavorite(int movieId);
  Future<bool> isFavorite(int movieId);
  Future<List<int>> getFavorites();
}