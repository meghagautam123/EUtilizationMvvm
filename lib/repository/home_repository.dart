import 'package:flutter_mvvm_archit/model/movie_model.dart';
import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../res/app_url.dart';


class HomeRepository
 {

  BaseApiService _baseApiService = NetworkApiService();

  //For Movies List
  Future<MovieModel> movieApi() async
   {
    try
    {
       dynamic response = await   _baseApiService.getGetApiResponse(AppUrl.movie_endpointurl);
       return response = MovieModel.fromJson(response);
    }

    catch (e)
    {
      print(e.toString());
      throw e;
    }
  }


  //For Sanction Detail List

  Future<List<Map<String,dynamic>>> sanctionApi(dynamic data) async
  {
    try
    {
      List<Map<String,dynamic>> response = await   _baseApiService.getPostApiResponse(AppUrl.sanctiondetail_url,data);
      return response;
    }

    catch (e)
    {
      print(e.toString());
      throw e;
    }
    }



   }