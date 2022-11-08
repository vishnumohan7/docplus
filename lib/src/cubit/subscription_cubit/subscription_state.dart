part of 'subscription_cubit.dart';

abstract class SubcriptionState extends Equatable {
  const SubcriptionState();
}

class SubcriptionInitial extends SubcriptionState {
  @override
  List<Object> get props => [];
}

class SubscriptionLoading extends SubcriptionState {
  @override
  List<Object> get props => [];
}

class SubscriptionLoadSuccess extends SubcriptionState {
  @override
  List<Object> get props => [];
}

class SubscriptionLoadError extends SubcriptionState {
  @override
  List<Object> get props => [];
}
