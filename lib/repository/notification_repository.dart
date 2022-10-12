import 'package:concetto_app/apis/endpoints.dart';
import 'package:concetto_app/models/notifications_model.dart';
import 'package:dio/dio.dart';

class NotificationRepository {
  Future<List<NotificationModel>?> getNotifications() async {
    try {
      final apiResponse = await Dio().get(kNotificationsEndpoint);
      List responseData = apiResponse.data;
      List<NotificationModel> notificationList = [];
      for (var data in responseData) {
        final json = data as Map<String, dynamic>;
        final NotificationModel notificationModel =
            NotificationModel.fromJson(json);
        notificationList.add(notificationModel);
      }
      return notificationList;
    } on Exception catch (e) {
      return null;
    }
  }
}
