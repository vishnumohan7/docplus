class SubscriptionModel {
  SubscriptionModel({
    required this.id,
    required this.subscriptionDays,
    required this.subscriptionName,
    required this.amount,
    // required this.v,
  });

  factory SubscriptionModel.fromJSON(Map<String, dynamic> json) {
    return SubscriptionModel(
        id: json["_id"],
        subscriptionDays: json["subscriptionDays"],
        subscriptionName: json["subscriptionName"],
        amount: json["amount"],
        );
  }
  String id;
  int subscriptionDays;
  String subscriptionName;
  int amount;
  // int v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['_id'] = id;
    map['subscriptionDays'] = subscriptionDays;
    map['subscriptionName'] = subscriptionName;
    map['amount'] = amount;
    // map['__v'] = v;
    return map;
  }
}
