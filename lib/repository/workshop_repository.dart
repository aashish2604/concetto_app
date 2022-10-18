import 'package:concetto_app/apis/endpoints.dart';
import 'package:concetto_app/models/workshop_model.dart';
import 'package:dio/dio.dart';

class WorkshopRepository {
  Future<List<WorkShopModel>?> getWorkshops() async {
    try {
      final apiResponse = await Dio().get(kWorkShopEndpoint);
      List responseData = apiResponse.data;
      List<WorkShopModel> workshopList = [];
      for (var data in responseData) {
        final json = data as Map<String, dynamic>;
        final WorkShopModel workShopModel = WorkShopModel.fromJson(json);
        workshopList.add(workShopModel);
      }
      return workshopList;
    } on Exception catch (e) {
      return null;
    }
  }
}
