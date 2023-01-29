import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proform1/src/cubit/subscription/subscription_cubit.dart';
import 'package:proform1/src/models/subscription_model.dart';
import 'package:proform1/src/pages/edit_subscription.dart';

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
            } else if (state is SubscriptionLoadSucess) {
              return _buildSubscriptionListUI(state.subscriptionList);
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

  _buildSubscriptionListUI(List<SubscriptionModel> subscriptionList) {
    return ListView.builder(
        itemCount: subscriptionList.length,
        itemBuilder: (context, index) {
          SubscriptionModel item = subscriptionList[index];
          return ListTile(
            title: Text(item.subscriptionName),
            subtitle: Text(item.subscriptionDays.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(item.amount.toString()),
                IconButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditSubscription(subscriptionModel: item,)));
                }, icon: Icon(Icons.edit)),
                IconButton(
                  onPressed: () {
                    context.read<SubscriptionCubit>().deleteSubscription(item);
                  },
                  icon: Icon(Icons.delete),
                )
              ],
            ),
          );
        });
  }
}
