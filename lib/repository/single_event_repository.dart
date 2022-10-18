import 'package:concetto_app/models/events_model.dart';
import 'package:dio/dio.dart';

class SingleEventRepository {
  Future<EventModel?> getSingleEvent(String index) async {
    try {
      final apiResponse =
          await Dio().get('https://admin.concetto.in/events/$index');
      Map<String, dynamic> responseData = apiResponse.data;
      EventModel eventModel = EventModel.fromJson(responseData);
      return eventModel;
    } on Exception catch (e) {
      return null;
    }
  }
}
