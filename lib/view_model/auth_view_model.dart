import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_archit/repository/auth_repository.dart';
import '../data/response/api_response.dart';
import '../model/LoginResponseModel.dart';
import '../model/movie_model.dart';
/*
https://medium.com/theotherdev-s/starting-with-flutter-a-simple-guide-for-provider-401b25957989*/


class AuthViewModel with ChangeNotifier
{
  final _authrepo = AuthRepository();
  ApiResponse<LoginModel> loginResponse = ApiResponse.loading();

  setMovieList(ApiResponse<LoginModel> response)
  {
    loginResponse = response;
    notifyListeners();
  }



  Future<void> loginApi(dynamic data,BuildContext context) async
   {
    setMovieList(ApiResponse.loading());
    _authrepo.loginApi(data).then((value)

    {
     if(kDebugMode)
     {
        print(value.toString());
        setMovieList(ApiResponse.completed(value));
      }
    })
        .onError((error, stackTrace)

    {
      if(kDebugMode)
      {
      print(error.toString());
      setMovieList(ApiResponse.error(error.toString()));
      }

      });
  }
}
