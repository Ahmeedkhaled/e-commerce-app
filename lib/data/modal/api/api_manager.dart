import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:untitled13/data/modal/api/api_constant.dart';
import 'package:untitled13/data/modal/request/RegisterRequest.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:untitled13/data/modal/respones/categoryOrBrandResponDto.dart';
import 'package:untitled13/data/modal/respones/productResponseDto.dart';
import 'package:untitled13/data/modal/respones/registerResponeDto.dart';
import 'package:untitled13/domain/failures.dart';

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, RegisterResponeDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.registerApi);
      var registerBody = RegisterRequest(
        email: email,
        name: name,
        password: password,
        phone: phone,
        rePassword: rePassword,
      );
      var response = await http.post(url, body: registerBody.toJson());
      var registerResponse =
          RegisterResponeDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(registerResponse);
      } else {
        return left(ServerError(errorMessage: registerResponse.message));
      }
    } else {
      return left(
          NetworkError(errorMessage: "please check internet Connection"));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>>
      getAllCategories() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.getAllCategoriesApi);
      var response = await http.get(url);
      var categoryResponse =
          CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(categoryResponse);
      } else {
        return left(ServerError(errorMessage: categoryResponse.message));
      }
    } else {
      return left(
          NetworkError(errorMessage: "please check internet Connection"));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.getAllBrandsApi);
      var response = await http.get(url);
      var categoryOrBrandResponse =
          CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(categoryOrBrandResponse);
      } else {
        return left(ServerError(errorMessage: categoryOrBrandResponse.message));
      }
    } else {
      return left(
          NetworkError(errorMessage: "please check internet Connection"));
    }
  }

  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.getAllProductsApi);
      var response = await http.get(url);
      var productResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(productResponse);
      } else {
        return left(ServerError(errorMessage: productResponse.message));
      }
    } else {
      return left(
          NetworkError(errorMessage: "please check internet Connection"));
    }
  }
}
