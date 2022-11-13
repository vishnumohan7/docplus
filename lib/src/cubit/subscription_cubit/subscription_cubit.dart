import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proform1/src/cubit/subscription_cubit/subscription_repository.dart';
import 'package:proform1/src/models/subscription_model.dart';
import 'package:proform1/src/models/api_response_model.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionInitial());

  final SubscriptionRepository _repository = SubscriptionRepository();

  getAllSubscriptions() async {
    emit(SubscriptionLoading());
    try {
      ApiResponseModel response = await _repository.getAllSubscriptions();
      if (response.status) {
        List<SubscriptionModel> subscriptionList = response.data
            .map<SubscriptionModel>((e) => SubscriptionModel.fromJSON(e))
            .toList();
        emit(SubscriptionLoadSuccess(subscriptionList));
      }
    } catch (ex) {
      emit(SubscriptionLoadError("error loading data"));
    }
  }

  addSubscription(SubscriptionModel subscriptionModel) async {
    emit(SubscriptionLoading());

    try {
      ApiResponseModel response =
          await _repository.createSubscription(subscriptionModel);
      if (response.status) {
        SubscriptionModel subscriptionModel =
            SubscriptionModel.fromJSON(response.data);
        emit(SubscriptionCreateSuccess(subscriptionModel));
      } else {
        emit(SubscriptionCreateError(response.error!));
      }
    } catch (ex) {
      emit(const SubscriptionCreateError("something went wrong"));
    }
    await Future.delayed(Duration(seconds: 2));
    getAllSubscriptions();
  }

  getSubscriptionbyId(SubscriptionModel subscriptionModel) async {
    emit(SubscriptionLoading());

    try {
      ApiResponseModel response =
          await _repository.getSubscriptionbyId(subscriptionModel);
      if (response.status) {
        SubscriptionModel subscriptionModel =
            SubscriptionModel.fromJSON(response.data);
        emit(SubscriptionbyIdSuccess(subscriptionModel));
      } else {
        emit(SubscriptionbyIdError(response.error!));
      }
    } catch (ex) {
      emit(const SubscriptionbyIdError("something went wrong"));
    }
  }

  deleteSubscription(SubscriptionModel subscriptionModel) async {
    emit(SubscriptionLoading());

    try {
      ApiResponseModel response =
          await _repository.deleteSubscription(subscriptionModel);
      if (response.status) {
        emit(SubscriptionDeleteSuccess(subscriptionModel));
      } else {
        emit(SubscriptionDeleteError(response.error!));
      }
    } catch (ex) {
      emit(const SubscriptionDeleteError("something went wrong"));
    }
    await Future.delayed(Duration(seconds: 2));
    getAllSubscriptions();
  }

  updateSubscription(SubscriptionModel subscriptionModel) async {
    emit(SubscriptionLoading());

    try {
      ApiResponseModel response =
          await _repository.updateSubscription(subscriptionModel);
      if (response.status) {
        SubscriptionModel subscriptionModel =
            SubscriptionModel.fromJSON(response.data);
        emit(SubscriptionUpdateSuccess(subscriptionModel));
      } else {
        emit(SubscriptionUpdateError(response.error!));
      }
    } catch (ex) {
      emit(const SubscriptionUpdateError("something went wrong"));
    }
    await Future.delayed(Duration(seconds: 2));
    getAllSubscriptions();
  }
}
