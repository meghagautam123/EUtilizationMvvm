import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_archit/data/response/api_response.dart';
import 'package:flutter_mvvm_archit/model/movie_model.dart';
import 'package:flutter_mvvm_archit/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier
{
  final _myRepo = HomeRepository();

  ApiResponse<MovieModel> moviesList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieModel> response) {

    moviesList = response;


    notifyListeners();

  }

  Future<void> fetchMoviewsList() async {
    setMovieList(ApiResponse.loading());
    await _myRepo
        .movieApi()
        .then((value)
    {
    setMovieList(ApiResponse.completed(value));

    })

        .onError((error, stackTrace)
    {
      setMovieList(ApiResponse.error(error.toString()));

    });
  }
}
