import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        print("crudd ----- ${response.statusCode}");
        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 205) {
          Map responsebody = jsonDecode(response.body);
          print("responsebody $responsebody");
          return Right(responsebody);
        } else if (response.statusCode == 403 ||
            response.statusCode == 401 ||
            response.statusCode == 400 ||
            response.statusCode == 404) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.failureException);
    }
  }

  Future<Either<StatusRequest, dynamic>> getData(
    String linkurl, {
    Map<String, String>? headers, // Headers are now optional and nullable
  }) async {
    // try {
    if (await checkInternet()) {
      var response = await http.get(
        Uri.parse(linkurl),
        headers: headers, // Use the provided headers, or null if not provided
      );
      print("crudd ----- ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic responsebody = jsonDecode(utf8.decode(response.bodyBytes));
        print("responsebody $responsebody");
        return Right(responsebody);
      } else if (response.statusCode == 403 ||
          response.statusCode == 400 ||
          response.statusCode == 404) {
        Map<String, dynamic> responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
  // catch (_) {
  //   return const Left(StatusRequest.failureException);
  // }
  // }

  Future<Either<StatusRequest, Map>> deleteData(String linkurl) async {
    try {
      if (await checkInternet()) {
        var response = await http.delete(Uri.parse(linkurl));
        print("crudd ----- ${response.statusCode}");
        if (response.statusCode == 204) {
          Map responsebody = jsonDecode(response.body);
          print("responsebody $responsebody");
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.failureException);
    }
  }
}
