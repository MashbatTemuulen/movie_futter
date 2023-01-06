import "package:flutter/material.dart";
import "package:movie/model/movie/index.dart";

class CommonProvider extends ChangeNotifier {
  List<MovieModel> movies = [];
  List<int> wishListIds = [];
  int currentIndex = 0;
  bool isLoggedIn = false;

  List<MovieModel> get wishMovies =>
      movies.where((element) => isWishMovies(element)).toList();

  void setMovies(List<MovieModel> data) {
    movies = data;
    notifyListeners();
  }

  bool isWishMovies(MovieModel data) {
    return wishListIds.any((element) => element == data.id);
  }

  void addWishList(int id) {
    if (wishListIds.contains(id)) {
      wishListIds.remove(id);
    } else {
      wishListIds.add(id);
    }
    notifyListeners();
  }

  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onLogin() {
    isLoggedIn = true;
    notifyListeners();
  }

  void onLogout() {
    isLoggedIn = false;
    notifyListeners();
  }
}
