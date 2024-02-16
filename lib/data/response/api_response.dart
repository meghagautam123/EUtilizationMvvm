import 'package:flutter_mvvm_archit/data/response/status.dart';
import 'package:flutter_mvvm_archit/model/sanction_model.dart';

class ApiResponse<T>
 {
  Status? status;
  T? data;
  String? message;


  ApiResponse(this.status,this.data,this.message);

  ApiResponse.loading():status = Status.LOADING;

  ApiResponse.completed(this.data):status = Status.COMPLETED;

  ApiResponse.error(this.message):status=Status.ERROR;





 /* @override
  String toString()
  {
  return "Status : $status \n  Message: $message \n  Data:$data";
  }
*/

 }
