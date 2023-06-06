// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationApi {
//   static final _notifications = FlutterLocalNotificationsPlugin();
//
//   static Future init({bool initScheduled=false})async{
//
//     await _notifications.initialize(settings,onSelectNotification:(payload) async{});
//
//   static Future showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//   }) async =>
//       _notifications.show(id, title, body, await notificationDetails());
//
//   static Future notificationDetails() async {
//     return const NotificationDetails(
//       android: AndroidNotificationDetails(
//         'channel id',
//         'channel name',
//         'channel description',
//         importance: Importance.max,
//       ),
//     );
//   }
// }

