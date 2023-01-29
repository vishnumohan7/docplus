import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proform1/src/cubit/authentication_cubit/auth_cubit.dart';
import 'package:proform1/src/models/user_response.dart';
import 'package:proform1/src/widgets/app_button.dart';

class ProfileInfoWidget extends StatefulWidget {
  final UserResponse userData;
  const ProfileInfoWidget(this.userData, {Key? key}) : super(key: key);

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_pin),
            title: Text(widget.userData.name ?? ""),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.maps_home_work_outlined),
            title: Text(widget.userData.getFullAddress()),
          ),
          const SizedBox(
            height: 200,
          ),
          AppButton(
            buttonName: "Change Password",
            onTap: () {},
          ),
          const SizedBox(
            height: 100,
          ),
          AppButton(
            buttonName: "Log out",
            onTap: () {
              context.read<AuthCubit>().logout();
            },
          ),
        ],
      ),
    );
  }
}
