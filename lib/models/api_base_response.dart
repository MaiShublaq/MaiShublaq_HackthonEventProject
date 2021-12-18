
class ApiBaseResponse {
  late bool status;
  late String message;
  //late User data;

  ApiBaseResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  //  if (json['data'] != null) data = User.fromJson(json['data']);
  }




}
