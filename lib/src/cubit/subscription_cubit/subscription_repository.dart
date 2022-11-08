import 'package:proform1/src/helpers/api_helper.dart';
import 'package:proform1/src/models/api_response_model.dart';
import 'package:proform1/src/models/subscription_model.dart';
import 'package:proform1/src/web_service/api_routes.dart';

class SubcriptionRepository {
  Future<ApiResponseModel> getAllSubscriptions() async {
    ApiResponseModel response =
        await ApiHelper().makeGetRequest(ApiRoutes.getAllSubscription);
    return response;
  }

  Future<ApiResponseModel> createSubscription(Subscription subscription) async {
    ApiResponseModel response = await ApiHelper()
        .makePostRequest(ApiRoutes.getAllSubscription, subscription.toJson());
    return response;
  }

  Future<ApiResponseModel> deleteSubscription(Subscription subscription) async {
    ApiResponseModel response = await ApiHelper().makeDeleteRequest(
        ApiRoutes.getAllSubscription + "/${subscription.id}");
    return response;
  }

  Future<ApiResponseModel> updateSubscription(Subscription subscription) async {
    ApiResponseModel response = await ApiHelper().makePatchRequest(
        ApiRoutes.getAllSubscription + "/${subscription.id}", subscription.toJson());
    return response;
  }

  Future<ApiResponseModel> getSubscriptionbyId(Subscription subscription) async {
    ApiResponseModel response = await ApiHelper()
        .makeGetRequest(ApiRoutes.getAllSubscription + "/${subscription.id}");
    return response;
  }
}
