import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proform1/src/cubit/subscription/subscription_repository.dart';
import 'package:proform1/src/models/api_response_model.dart';
import 'package:proform1/src/models/subscription_model.dart';


part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionInitial());
  final SubscriptionRepository _repository = SubscriptionRepository();

  getAllSubscriptions() async {
    emit(SubscriptionLoading());
    try {
      ApiResponseModel response = await _repository.getAllSubscription();
      if (response.status) {
        List<SubscriptionModel> subscriptionList = response.data
            .map<SubscriptionModel>((e) => SubscriptionModel.fromJSON(e))
            .toList();
        emit(SubscriptionLoadSucess(subscriptionList));
      } else {
        String errorMessage = response.error!;
        emit(SubscriptionLoadError(errorMessage));
      }
    } catch (ex) {
      emit(SubscriptionLoadError("error loading data"));
    }
  }

  addSubscription(SubscriptionModel subscriptionModel) async {
    emit(SubscriptionLoading());

    try {
      ApiResponseModel response =
          await _repository.addSubscription(subscriptionModel);
      if (response.status) {
        SubscriptionModel subscriptionModel =
            SubscriptionModel.fromJSON(response.data);
        emit(SubscriptionCreationSuccess(subscriptionModel));
      } else {
        emit(SubscriptionCreationError(response.error!));
      }
    } catch (ex) {
      emit(const SubscriptionCreationError("something went wrong"));
    }
    await Future.delayed(Duration(seconds: 2));
    getAllSubscriptions();
  }

  getSubscriptionById(SubscriptionModel subscriptionModel) async {
    emit(SubscriptionLoading());

    try {
      ApiResponseModel response =
          await _repository.getSubscriptionById(subscriptionModel);
      if (response.status) {
        SubscriptionModel subscriptionModel =
            SubscriptionModel.fromJSON(response.data);
        emit(SubscriptionByIdLoadSuccess(subscriptionModel));
      } else {
        emit(SubscriptionByIdLoadError(response.error!));
      }
    } catch (ex) {
      emit(const SubscriptionByIdLoadError("something went wrong"));
    }
  }

  deleteSubscription(SubscriptionModel subscriptionModel) async {
    emit(SubscriptionLoading());

    try {
      ApiResponseModel response =
          await _repository.deleteSubscriptionById(subscriptionModel);
      if (response.status) {
        String errorMessage = response.error!;
        emit(SubscriptionDeleteError(errorMessage));
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
          await _repository.updateSubscriptionById(subscriptionModel);
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
