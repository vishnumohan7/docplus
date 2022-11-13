import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proform1/src/cubit/subscription_cubit/subscription_cubit.dart';
import 'package:proform1/src/models/subscription_model.dart';

class SubscriptionFragment extends StatefulWidget {
  const SubscriptionFragment({Key? key}) : super(key: key);

  @override
  State<SubscriptionFragment> createState() => _SubscriptionFragmentState();
}

class _SubscriptionFragmentState extends State<SubscriptionFragment> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubscriptionCubit()..getAllSubscriptions(),
      child: Scaffold(
        body: BlocBuilder<SubscriptionCubit,SubscriptionState>(
          builder: (context, state) {
            if (state is SubscriptionLoading) {
              return CircularProgressIndicator();
            } else if (state is SubscriptionLoadSuccess) {
              return _buildSubscriptiomListUI(state.subscriptionList);
            } else if (state is SubscriptionLoadError) {
              return Text(state.errorMessage);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  _buildSubscriptiomListUI(List<SubscriptionModel> subscriptionList) {
    return ListView.builder(
        itemCount: subscriptionList.length,
        itemBuilder: (context, index) {
          SubscriptionModel item = subscriptionList[index];
          return ListTile(
            title: Text(item.subscriptionName),
            subtitle: Text(item.subscriptionDays.toString()),
          );
        });
  }
}
