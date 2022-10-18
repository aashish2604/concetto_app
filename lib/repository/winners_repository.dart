import 'package:concetto_app/apis/endpoints.dart';
import 'package:concetto_app/models/winners_model.dart';
import 'package:dio/dio.dart';

class WinnersRepository {
  Future<List<WinnerModel>?> getWinners() async {
    try {
      final apiResponse = await Dio().get(kWinnersEndpoint);
      List responseData = apiResponse.data;
      List<WinnerModel> winnersList = [];
      for (var data in responseData) {
        final json = data as Map<String, dynamic>;
        final WinnerModel winnerModel = WinnerModel.fromJson(json);
        winnersList.add(winnerModel);
      }
      return winnersList;
    } on Exception catch (e) {
      return null;
    }
  }
}
