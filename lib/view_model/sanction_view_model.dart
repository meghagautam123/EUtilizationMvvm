import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import '../data/response/api_response.dart';
import '../repository/home_repository.dart';


class SanctionViewModel with ChangeNotifier
 {
  final _myRepo = HomeRepository();
  bool isInternetConnected = true;

  ApiResponse<List<Map<String,dynamic>>> moviesList = ApiResponse.loading();

  setSanctionList(ApiResponse<List<Map<String,dynamic>>> response)
  {
    moviesList = response;
    notifyListeners();

  }


  Future<void> fetchSanctionList(dynamic data) async
  {
    isInternetConnected = await isInternetConnect();
    if(isInternetConnected) {
      setSanctionList(ApiResponse.loading());

      await _myRepo
          .sanctionApi(data)
          .then((value) {
        setSanctionList(ApiResponse.completed(value));
      })
          .onError((error, stackTrace) {
        setSanctionList(ApiResponse.error(error.toString()));
      });
    }
    else
      {

      }




   }

  Future<bool> isInternetConnect() async
  {
    // Check internet connection using the connectivity package or other methods
    // Return true if connected, false otherwise
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }



   }