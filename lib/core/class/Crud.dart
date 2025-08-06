import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
  try{
      if (await checkInternet()) {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody =jsonDecode(response.body) ;
      
          return Right(responseBody);
        
      } 
      else {
          return Left(StatusRequest.failure);
        }
    } else {
      return Left(StatusRequest.offline);
    }
  }catch(_){
      return Left(StatusRequest.serverError);
    }
  }
  }

