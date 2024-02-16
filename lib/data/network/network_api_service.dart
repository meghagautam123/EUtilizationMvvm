import 'dart:convert';
import 'dart:io';
import 'package:flutter_mvvm_archit/data/app_exceptions.dart';
import 'package:flutter_mvvm_archit/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
/*https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51*/


class NetworkApiService extends BaseApiService
 {
   List<Map<String, dynamic>> dataList = [];

   @override
  Future getGetApiResponse(String url) async
  {
    dynamic responseJson;
    try
    {
      final response =  await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
      print(response);

    }
    on SocketException
    {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }


  @override
  Future getPostApiResponse(String url, dynamic data) async
  {
    List<Map<String, dynamic>> responseJson;
    try
    {
      final Map<String, String> heade =
      {
        'Content-Type': 'application/json',
        'userid': 'eUC_API',
        'pwd':'0ab58c589c342d6d52851d146dd8927ce0b51cdf9bafb8c0c45b87cfee73acae'

        //Replace with your access token if needed
      };

      Response response =
          await post(Uri.parse(url), body: data,headers: heade).timeout(Duration(seconds: 50));
      responseJson = returnResponse(response);

    //dataList = returnSanctionResponse(response);
    }
    on SocketException
    {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }










  List<Map<String, dynamic>> returnResponse(http.Response response)
  {

    switch (response.statusCode)
    {

      case 200:

      /*List<dynamic> apiResponse = [
          {'id': 1, 'name': 'Item 1'},
          {'id': 2, 'name': 'Item 2'},
          // ... more items
        ];*/


         /*dataList = jsonDecode(response.body);
           return dataList;*/

        List<dynamic> data = jsonDecode(response.body);

         //Map each dynamic map to a list of Items
         //List<SanctionModel> items = data.map((itemMap) => SanctionModel.fromJson(itemMap)).toList();

         //return items;


        List<Map<String, dynamic>> result = List<Map<String, dynamic>>.from(data);
        return result;




       /*List<dynamic> responseJson = jsonDecode(response.body);
        return responseJson;

*/
      //return responseJson=userFromJson(jsonDecode(response.body)[0]);

     /*dynamic responseJson = response.body[0];
      return userFromJson(responseJson);*/

   //   dynamic responseJson = ((json.decode(response.body) as List).map((i) => SanctionModel.fromJson(i)).toList());
     // return responseJson;


  /*    List<dynamic> apiResponse = await fetchDataFromApi();

      // Check if the response is a list
      if (apiResponse is List<dynamic>) {
        // Check if each element in the list is a map
        dataList = apiResponse.cast<Map<String, dynamic>>();
      } else {
        // Handle the case where the response is not a list of maps
        print('Unexpected API response format');
      }

*/

     /*final data = json.decode(response.body);
      List<SanctionModel> responses =
      data.map((j) => SanctionModel.fromJson(j)).toList();
      return  responses;*/


       case 400:
        throw BadRequestException(response.body.toString());


      case 401:
        throw UnAuthorizedException(response.body.toString());


      default:
        throw FetchDataException('Error occured' +
            'with status code' +
            response.statusCode.toString());
    }
    }
}
