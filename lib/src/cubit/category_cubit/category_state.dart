part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadSucess extends CategoryState {
  final List<CategoryModel> categoryList;

  CategoryLoadSucess(this.categoryList);

  @override
  List<Object> get props => [categoryList];
}

class CategoryLoadError extends CategoryState {
  final String errorMessage;

  CategoryLoadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
