import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proform1/src/cubit/authentication_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proform1/src/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController( text: "admin@docplus.com");
  TextEditingController _passwordController = TextEditingController( text: "@dminPlus2020#");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Pro App"),
        centerTitle: true,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(color: Colors.red))),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(color: Colors.red))),
              ),
              SizedBox(
                height: 15,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoadSuccess) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()));
                  } else if (state is AuthLoadFailure) {
                    String errorMessage = state.errorMessage;
                    showDialog(
                        context: context,
                        builder: (
                          _,
                        ) {
                          return AlertDialog(
                            title: const Text("Login Failed"),
                            content: Text("$errorMessage"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Ok"))
                            ],
                          );
                        });
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Center(child: CupertinoActivityIndicator());
                  }
                  return ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().login(
                            _emailController.text.trim(),
                            _passwordController.text);
                      },
                      child: Text("Login"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
