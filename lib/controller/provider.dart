import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movie/service/service.dart';
import 'package:movie/model/model.dart'; 
class MovieProvider extends ChangeNotifier {
  MovieService service = MovieService();

  List<MovieModel> movies = [];         
  List<MovieModel> searchedMovies = [];  
  bool isload = false;

  MovieProvider(){
    getProvider();
    
  }

  Future<void> getProvider() async {
    isload = true;
    notifyListeners();
    try {
      movies = await service.fetchMovieService();
      searchedMovies = movies;
      log('Movies added to the list');
    } catch (e) {
      log('Error in the provider');
      throw Exception('There is an error');
    } finally {
      isload = false;
      notifyListeners();
    }
  }

  void searchMovies(String query) {
    if (query.isEmpty) {
      searchedMovies = movies;
    } else {
      searchedMovies = movies
          .where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
