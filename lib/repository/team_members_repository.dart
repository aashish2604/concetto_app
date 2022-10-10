import 'package:concetto_app/apis/endpoints.dart';
import 'package:concetto_app/models/team_members_model.dart';
import 'package:dio/dio.dart';

class TeamMembersRepository {
  Future<List<TeamMembersModel>?> getTeamMembers() async {
    try {
      final apiResponse = await Dio().get(kTeamMembersEndpoint);
      List responseData = apiResponse.data;
      List<TeamMembersModel> teamMembersList = [];
      for (var data in responseData) {
        final json = data as Map<String, dynamic>;
        final TeamMembersModel eventModel = TeamMembersModel.fromJson(json);
        teamMembersList.add(eventModel);
      }
      return teamMembersList;
    } on Exception catch (e) {
      return null;
    }
  }
}
