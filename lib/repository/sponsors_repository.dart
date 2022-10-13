import 'package:concetto_app/apis/endpoints.dart';
import 'package:concetto_app/models/sponsors_model.dart';
import 'package:dio/dio.dart';

class SponsorsRepository {
  Future<List<SponsorsModel>?> getSponsors(bool isMajorRequired) async {
    try {
      final apiResponse = await Dio().get(kSponsorsEndpoint);
      List responseData = apiResponse.data;
      List<SponsorsModel> sponsorsList = [];
      for (var data in responseData) {
        final json = data as Map<String, dynamic>;
        final SponsorsModel sponsorModel = SponsorsModel.fromJson(json);
        if (isMajorRequired) {
          if (sponsorModel.category == 'major') {
            sponsorsList.add(sponsorModel);
          }
        } else {
          sponsorsList.add(sponsorModel);
        }
      }
      return sponsorsList;
    } on Exception catch (e) {
      return null;
    }
  }
}
