import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'subscription_state.dart';

class SubcriptionCubit extends Cubit<SubcriptionState> {
  SubcriptionCubit() : super(SubcriptionInitial());
}
