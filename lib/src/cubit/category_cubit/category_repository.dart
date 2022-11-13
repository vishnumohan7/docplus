import 'package:flutter/foundation.dart';
import 'package:proform1/src/helpers/api_helper.dart';
import 'package:proform1/src/models/api_response_model.dart';
import 'package:proform1/src/web_service/api_routes.dart';
import 'package:proform1/src/models/category_model.dart';

class CategoryRepository {
  Future<ApiResponseModel> addCategory(CategoryModel categoryModel) async {
    ApiResponseModel response = await ApiHelper()
        .makePostRequest(ApiRoutes.categoryroute, categoryModel.toJson());
    return response;
  }

 Future<ApiResponseModel> getAllCategory() async {
    ApiResponseModel response =
        await ApiHelper().makeGetRequest(ApiRoutes.categoryroute);
    return response;
  }

 Future<ApiResponseModel> getCategoryById(CategoryModel categoryModel) async {
    ApiResponseModel response =
        await ApiHelper().makeGetRequest(ApiRoutes.categoryroute+"/${categoryModel.id}");
    return response;
  }

  Future<ApiResponseModel> updateCategoryById(CategoryModel categoryModel) async {
    ApiResponseModel response = await ApiHelper()
        .makePatchRequest(ApiRoutes.categoryroute+"/${categoryModel.id}", categoryModel);
    return response;
  }

 Future<ApiResponseModel> deleteCategoryById(CategoryModel categoryModel) async {
    ApiResponseModel response =
        await ApiHelper().makeDeleteRequest(ApiRoutes.categoryroute+"/${categoryModel.id}");
    return response;
  }
}
