import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proform1/src/cubit/subscription/subscription_cubit.dart';
import 'package:proform1/src/models/subscription_model.dart';
import 'package:proform1/src/widgets/app_button.dart';
import 'package:proform1/src/widgets/app_loader.dart';

class EditSubscription extends StatefulWidget {
  final SubscriptionModel subscriptionModel;

  const EditSubscription({required this.subscriptionModel});

  @override
  State<EditSubscription> createState() => _EditSubscriptionState();
}

class _EditSubscriptionState extends State<EditSubscription> {
  TextEditingController _subscriptionDaysController = TextEditingController();
  TextEditingController _subscriptionNameController = TextEditingController();

  void initState() {
    _subscriptionNameController =
        TextEditingController(text: widget.subscriptionModel.subscriptionName);
    _subscriptionDaysController =
        TextEditingController(text: widget.subscriptionModel.subscriptionDays.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubscriptionCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Subscription"),
        ),
        body: SafeArea(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _subscriptionNameController,
                    decoration: InputDecoration(
                        labelText: "Subscription Name",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _subscriptionDaysController,
                    decoration: InputDecoration(
                        labelText: "Subscription Days",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  BlocConsumer<SubscriptionCubit, SubscriptionState>(
                    listener: (context, state) {
                      if (state is SubscriptionCreationSuccess) {
                        Navigator.pop(context);
                      } else if (state is SubscriptionCreationError) {
                        Text("error message");
                      }
                    },
                    builder: (context, state) {
                      if (state is SubscriptionLoading) {
                        return AppLoader();
                      }
                      return AppButton(
                          buttonName: "Update Category",
                          onTap: () {
                            String subscriptionDays =
                            _subscriptionDaysController.text.trim();
                            String subscriptionName =
                            _subscriptionNameController.text.trim();
                            widget.subscriptionModel.subscriptionDays = subscriptionDays as int;
                            widget.subscriptionModel.subscriptionName = subscriptionName;

                            context
                                .read<SubscriptionCubit>()
                                .updateSubscription(widget.subscriptionModel);
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
