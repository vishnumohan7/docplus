import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proform1/src/cubit/category_cubit/category_cubit.dart';
import 'package:proform1/src/models/category_model.dart';

class CategoryFragment extends StatefulWidget {
  const CategoryFragment({Key? key}) : super(key: key);

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getAllCategories(),
      child: Scaffold(
        body: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
          if (state is CategoryLoading) {
            return CircularProgressIndicator();
          } else if (state is CategoryLoadSucess) {
            return _buildCatrgoryListUI(state.categoryList);
          } else if (state is CategoryLoadError) {
            return Text(state.errorMessage);
          } else {
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }

  _buildCatrgoryListUI(List<CategoryModel> category) {
    return ListView.builder(
        itemCount: category.length,
        itemBuilder: (context, index) {
          CategoryModel item = category[index];
          return ListTile(
            title: Text(item.categoryName),
            subtitle: Text(item.categoryCode),
          );
        });
  }
}
