import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proform1/src/cubit/authentication_cubit/auth_cubit.dart';
import 'package:proform1/src/cubit/profile_cubit/profile_cubit.dart';
import 'package:proform1/src/pages/login_page.dart';
import 'package:proform1/src/widgets/app_load_error.dart';
import 'package:proform1/src/widgets/app_loader.dart';
import 'package:proform1/src/widgets/profile/profile_info_widget.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit()..getProfileData(),
        ),
        // BlocProvider(
        //   create: (context) => AuthCubit(),
        // ),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage()));
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return AppLoader();
                } else if (state is ProfileLoadError) {
                  return AppLoadErrorWidget(
                      errorMessage: "errorMessage",
                      buttonLabel: "Login",
                      onButtonTap: () {
                        context.read<AuthCubit>().logout();
                      });
                } else if (state is ProfileLoadSuccess) {
                  return ProfileInfoWidget(state.userData);
                } else {
                  return AppLoader();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
