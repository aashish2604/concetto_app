import 'package:concetto_app/apis/endpoints.dart';
import 'package:concetto_app/models/merchendise_model.dart';
import 'package:dio/dio.dart';

class MerchendiseRepository {
  Future<List<MerchendiseModel>?> getMerchendise() async {
    try {
      final apiResponse = await Dio().get(kMechendiseEndpoint);
      List responseData = apiResponse.data;
      List<MerchendiseModel> merchendiseList = [];
      for (var data in responseData) {
        final json = data as Map<String, dynamic>;
        final MerchendiseModel merchendiseModel =
            MerchendiseModel.fromJson(json);
        merchendiseList.add(merchendiseModel);
      }
      return merchendiseList;
    } on Exception catch (e) {
      return null;
    }
  }
}
