class Subscription {
  final String? id;
  final int subscriptionDays;
  final String subscriptionName;
  final double amount;

  Subscription(
      {this.id,
      required this.amount,
      required this.subscriptionDays,
      required this.subscriptionName});

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json["id"],
      subscriptionDays: int.parse(json["subscriptionDays"]),
      subscriptionName: json["subscriptionName"],
      amount: double.parse(json["amount"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "subscriptionDays": this.subscriptionDays,
      "subscriptionName": this.subscriptionName,
      "amount": this.amount,
    };
  }
}
