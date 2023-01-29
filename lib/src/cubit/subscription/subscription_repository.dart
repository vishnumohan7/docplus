import 'package:proform1/src/helpers/api_helper.dart';
import 'package:proform1/src/models/api_response_model.dart';
import 'package:proform1/src/models/subscription_model.dart';
import 'package:proform1/src/web_service/api_routes.dart';

class SubscriptionRepository {
  Future<ApiResponseModel> addSubscription(
      SubscriptionModel subscriptionModel) async {
    ApiResponseModel response = await ApiHelper().makePostRequest(
        ApiRoutes.getAllSubscription, subscriptionModel.toJson());
    return response;
  }

  Future<ApiResponseModel> getAllSubscription() async {
    ApiResponseModel response =
        await ApiHelper().makeGetRequest(ApiRoutes.getAllSubscription);
    return response;
  }

  Future<ApiResponseModel> getSubscriptionById(
      SubscriptionModel subscriptionModel) async {
    ApiResponseModel response = await ApiHelper().makeGetRequest(
        ApiRoutes.getAllSubscription + "/${subscriptionModel.id}");
    return response;
  }

  Future<ApiResponseModel> updateSubscriptionById(
      SubscriptionModel subscriptionModel) async {
    ApiResponseModel response = await ApiHelper().makePatchRequest(
        ApiRoutes.getAllSubscription + "/${subscriptionModel.id}",
        subscriptionModel);
    return response;
  }

  Future<ApiResponseModel> deleteSubscriptionById(
      SubscriptionModel subscriptionModel) async {
    ApiResponseModel response = await ApiHelper().makeDeleteRequest(
        ApiRoutes.getAllSubscription + "/${subscriptionModel.id}");
    return response;
  }
}
