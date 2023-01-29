import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proform1/src/cubit/category/category_cubit.dart';
import 'package:proform1/src/models/category_model.dart';
import 'package:proform1/src/widgets/app_button.dart';
import 'package:proform1/src/widgets/app_loader.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {

 final TextEditingController _categoryCodeController = TextEditingController();
 final TextEditingController _categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add new category"),
        ),
        body: SafeArea(
            child: Form(
                child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextFormField(
                controller: _categoryCodeController,
                decoration: InputDecoration(labelText: "Category Code"),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _categoryNameController,
                decoration: InputDecoration(labelText: "Category Name"),
              ),
              const SizedBox(
                height: 40,
              ),
              BlocConsumer<CategoryCubit, CategoryState>(
                listener: (context, state) {
                  if (state is CategoryCreationSuccess) {
                    Navigator.pop(context);
                  } else if (state is CategoryCreationError) {
                    Fluttertoast.showToast(
                        msg: "${state.errorMessage}",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return AppLoader();
                  }
                  return AppButton(
                    buttonName: "Submit",
                    onTap: () {
                      String categoryCode = _categoryCodeController.text.trim();
                      String categoryName = _categoryNameController.text.trim();
                      CategoryModel categoryModel = CategoryModel(
                          categoryName: categoryName,
                          categoryCode: categoryCode);
                      context.read<CategoryCubit>().addCategory(categoryModel);
                    },
                  );
                },
              )
            ],
          ),
        ))),
      ),
    );
  }
}
