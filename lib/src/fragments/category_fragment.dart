import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proform1/src/cubit/category_cubit/category_cubit.dart';
import 'package:proform1/src/models/category_model.dart';
import 'package:proform1/src/pages/add_category.dart';
import 'package:proform1/src/pages/edit_category.dart';
import 'package:proform1/src/widgets/app_load_error.dart';
import 'package:proform1/src/widgets/app_loader.dart';

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
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
              if (state is CategoryLoading) {
                Future.delayed(Duration(seconds: 5000));
                return Center(child: AppLoader());
              } else if (state is CategoryLoadSucess) {
                return _buildCatrgoryListUI(state.categoryList);
              } else if (state is CategoryLoadError) {
                return AppLoadErrorWidget(
                    errorMessage: "errorMessage",
                    onReload: () {
                      context.read<CategoryCubit>().getAllCategories();
                    });
              } else {
                return CircularProgressIndicator();
              }
            }),
          ),
          Positioned(
            bottom: 24,
            right: 24,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddCategory()));
              },
              child: Icon(Icons.add),
            ),
          )
        ],
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditCategory(categoryModel: item,)));
                }, icon: Icon(Icons.edit)),
                IconButton(
                  onPressed: () {
                    context.read<CategoryCubit>().deleteCategory(item);
                  },
                  icon: Icon(Icons.delete),
                )
              ],
            ),
          );
        });
  }
}
