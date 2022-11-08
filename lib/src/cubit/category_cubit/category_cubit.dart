import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proform1/src/cubit/category_cubit/category_repository.dart';
import 'package:proform1/src/models/api_response_model.dart';
import 'package:proform1/src/models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  CategoryRepository _repository = CategoryRepository();

  getAllCategories() async {
    emit(CategoryLoading());
    try {
      ApiResponseModel response = await _repository.getAllCategory();
      if (response.status) {
       List<CategoryModel> categoryList =  response.data.map<CategoryModel>((e)=>CategoryModel.fromJSON(e)).toList();
       emit(CategoryLoadSucess(categoryList));
      }
    } catch (ex) {
      emit(CategoryLoadError("error loading data"));
    }
  }
}
