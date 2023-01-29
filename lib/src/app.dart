import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proform1/src/cubit/authentication_cubit/auth_cubit.dart';
import 'package:proform1/src/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..checkAutoLogin(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.lightGreen),
        home: LoginPage(),
      ),
    );
  }
}
