import 'dart:convert';

import 'package:http/http.dart'as http;
class Api_helper{


  static Future<dynamic> GET({String? URL})async{

    var  response = await http.get(Uri.parse(URL!));

    if(response.statusCode ==200){

      return jsonDecode(response.body);

    }else{
      throw Exception('there is a problem with status code ${response.statusCode.toString()}');
    }

  }



  static Future<dynamic> POST({String? URL,dynamic body,String? token})async{


    Map<String,String> headers ={
      'Accept':'application/json',
      'Content-Type':'application/x-www-form-urlencoded',


    };


    var responce = await   http.post(Uri.parse(URL!),body: body);

    if(responce.statusCode == 200){
      var data= jsonDecode(responce.body);
      return data;
    }else{

      throw Exception(jsonDecode(responce.body));
    }




  }


  static Future<dynamic> PUT({String? URL,dynamic body,String? token})async{


    Map<String,String> headers ={
      'Accept':'application/json',
      'Content-Type':'application/x-www-form-urlencoded',


    };


    var responce = await http.put(Uri.parse(URL!),body: body);

    if(responce.statusCode == 200){
      var data= jsonDecode(responce.body);
      return data;
    }else{
      throw Exception(jsonDecode(responce.body));
    }




  }












}