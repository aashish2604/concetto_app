import 'package:concetto_app/apis/endpoints.dart';
import 'package:concetto_app/models/exhibitions_model.dart';
import 'package:dio/dio.dart';

class ExhibitionRepository {
  Future<List<ExhibitionModel>?> getExhibitions() async {
    try {
      final apiResponse = await Dio().get(kExhibitionsEndpoint);
      List responseData = apiResponse.data;
      List<ExhibitionModel> exhibitionList = [];
      for (var data in responseData) {
        final json = data as Map<String, dynamic>;
        final ExhibitionModel exhbitionModel = ExhibitionModel.fromJson(json);
        exhibitionList.add(exhbitionModel);
      }
      return exhibitionList;
    } on Exception catch (e) {
      return null;
    }
  }
}
