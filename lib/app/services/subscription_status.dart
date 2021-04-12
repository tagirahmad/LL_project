class SubscriptionStatus {
  static final SubscriptionStatus _subscriptionStatus =
      SubscriptionStatus._internal();

  late bool isPro;

  factory SubscriptionStatus() {
    return _subscriptionStatus;
  }

  SubscriptionStatus._internal();
}

final isPro = SubscriptionStatus();
