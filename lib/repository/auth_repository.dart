//WE implement all api's here

import 'package:flutter_mvvm_archit/data/network/base_api_service.dart';
import 'package:flutter_mvvm_archit/data/network/network_api_service.dart';
import 'package:flutter_mvvm_archit/res/app_url.dart';

class AuthRepository
{
  BaseApiService _baseApiService = NetworkApiService();

 //Login Api
  Future<dynamic> loginApi(dynamic data)
  async {
    try
    {
    dynamic response = await
          _baseApiService.getPostApiResponse(AppUrl.login_endpointurl, data);
      return response;
    }
    catch (e)
    {
      throw e;
    }
  }



}
