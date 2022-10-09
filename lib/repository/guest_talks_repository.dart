import 'package:concetto_app/apis/endpoints.dart';
import 'package:concetto_app/models/guest_talks_model.dart';
import 'package:dio/dio.dart';

class GuestTalksRepository {
  Future<List<GuestTalksModel>?> getGetTalks() async {
    try {
      final apiResponse = await Dio().get(kGuestTalksEndpoint);
      List responseData = apiResponse.data;
      List<GuestTalksModel> guestTalkList = [];
      for (var data in responseData) {
        final json = data as Map<String, dynamic>;
        final GuestTalksModel guestTalkModel = GuestTalksModel.fromJson(json);
        guestTalkList.add(guestTalkModel);
      }
      return guestTalkList;
    } catch (e) {
      return null;
    }
  }
}
