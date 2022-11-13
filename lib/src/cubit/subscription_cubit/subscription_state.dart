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

class SubscriptionLoadSuccess extends SubscriptionState {
  final List<SubscriptionModel> subscriptionList;

  SubscriptionLoadSuccess(this.subscriptionList);

  @override
  List<Object> get props => [subscriptionList];
}

class SubscriptionLoadError extends SubscriptionState {

  final String errorMessage;

  SubscriptionLoadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SubscriptionCreateSuccess extends SubscriptionState {
  final SubscriptionModel subscriptionModel;

  SubscriptionCreateSuccess(this.subscriptionModel);

  @override
  List<Object> get props => [subscriptionModel];
}

class SubscriptionCreateError extends SubscriptionState {
  final String errorMessage;

 const SubscriptionCreateError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SubscriptionUpdateSuccess extends SubscriptionState {
  final SubscriptionModel subscriptionModel;

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

class SubscriptionbyIdSuccess extends SubscriptionState {
  final SubscriptionModel subscriptionModel;

  SubscriptionbyIdSuccess(this.subscriptionModel);

  @override
  List<Object> get props => [subscriptionModel];
}

class SubscriptionbyIdError extends SubscriptionState {
  final String errorMessage;

 const SubscriptionbyIdError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SubscriptionDeleteSuccess extends SubscriptionState {
  final SubscriptionModel subscriptionModel;

  SubscriptionDeleteSuccess(this.subscriptionModel);

  @override
  List<Object> get props => [subscriptionModel];
}

class SubscriptionDeleteError extends SubscriptionState {
  final String errorMessage;

 const SubscriptionDeleteError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}