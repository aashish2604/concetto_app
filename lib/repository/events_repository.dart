import 'package:concetto_app/apis/endpoints.dart';
import 'package:concetto_app/models/events_model.dart';
import 'package:dio/dio.dart';

class EventsRepository {
  Future<List<EventModel>?> getEvents() async {
    try {
      final apiResponse = await Dio().get(kEventsEndpoint);
      List responseData = apiResponse.data;
      List<EventModel> eventList = [];
      for (var data in responseData) {
        final json = data as Map<String, dynamic>;
        final EventModel eventModel = EventModel.fromJson(json);
        eventList.add(eventModel);
      }
      return eventList;
    } on Exception catch (e) {
      return null;
    }
  }
}
