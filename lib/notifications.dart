import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> createPaymentNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 3, 
      channelKey: 'basic_channel',
      title: '${Emojis.money_credit_card} Payment was Successful!',
      body: '${Emojis.symbols_red_exclamation_mark}If you did not approve of this payment, contact your bank immediately',
      ),
    );
}