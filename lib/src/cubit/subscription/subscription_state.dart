part of 'subscription_cubit.dart';

abstract class SubscriptionState extends Equatable {
  const SubscriptionState();
}

class SubscriptionInitial extends SubscriptionState {
  @override
  List<Object> get props => [];
}

class SubscriptionLoading extends SubscriptionState {
  @override
  List<Object> get props => [];
}

class SubscriptionLoadSucess extends SubscriptionState {
  final List<SubscriptionModel> subscriptionList;

  SubscriptionLoadSucess(this.subscriptionList);

  @override
  List<Object> get props => [subscriptionList];
}

class SubscriptionLoadError extends SubscriptionState {
  final String errorMessage;

  SubscriptionLoadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SubscriptionByIdLoadSuccess extends SubscriptionState {
  final SubscriptionModel subscriptionModel;

  @override
  List<Object> get props => [subscriptionModel];

  SubscriptionByIdLoadSuccess(this.subscriptionModel);
}

class SubscriptionByIdLoadError extends SubscriptionState {
  final String errorMessage;

  const SubscriptionByIdLoadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SubscriptionCreationSuccess extends SubscriptionState {
  final SubscriptionModel subscriptionModel;

  const SubscriptionCreationSuccess(this.subscriptionModel);

  @override
  List<Object> get props => [subscriptionModel];
}

class SubscriptionCreationError extends SubscriptionState {
  final String errorMessage;

  const SubscriptionCreationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SubscriptionUpdateSuccess extends SubscriptionState {
  SubscriptionModel subscriptionModel;

  SubscriptionUpdateSuccess(this.subscriptionModel);
  @override
  List<Object> get props => [subscriptionModel];
}

class SubscriptionUpdateError extends SubscriptionState {
  final String errorMessage;

  const SubscriptionUpdateError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class SubscriptionDeleteSuccess extends SubscriptionState {
  @override
  List<Object> get props => [];
}

class SubscriptionDeleteError extends SubscriptionState {
  final String errorMessage;

  const SubscriptionDeleteError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
