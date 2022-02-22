import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kusikay_mobile/models/teacher_ranking.dart';
import 'package:kusikay_mobile/utils/config.dart';

var urlRanking = Uri.parse('$BACKEND_URL/api/leaderboard');

class RankingService {
  TeacherRanking myRankingModel = new TeacherRanking(0, '', 0);
  List<TeacherRanking> leaderboard = [];
  Future<void> getLeaderboard(id, token) async {
    try {
      http.Response response = await http
          .get(urlRanking, headers: {HttpHeaders.authorizationHeader: token});
      if (response.statusCode == 200) {
        Map leaderboardResponse = jsonDecode(utf8.decode(response.bodyBytes));
        for (int i = 0; i < leaderboardResponse['content'].length; i++) {
          leaderboard.add(new TeacherRanking(
              leaderboardResponse['content'][i]['id'],
              leaderboardResponse['content'][i]['name'],
              leaderboardResponse['content'][i]['score']));
        }
      }

      http.Response myRanking = await http.get(
          Uri.parse('$BACKEND_URL/api/ranking/$id'),
          headers: {HttpHeaders.authorizationHeader: token});
      Map responseMyRanking = jsonDecode(utf8.decode(myRanking.bodyBytes));
      myRankingModel.id = responseMyRanking['id'];
      myRankingModel.name = responseMyRanking['name'];
      myRankingModel.score = responseMyRanking['score'];
    } catch (e) {
      print('caught error $e');
      return null;
    }
  }
}
