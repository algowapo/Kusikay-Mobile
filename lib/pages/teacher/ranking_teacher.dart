import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/models/teacher_ranking.dart';
import 'package:kusikay_mobile/services/ranking_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RankingTeacher extends StatefulWidget {
  const RankingTeacher({Key? key}) : super(key: key);

  @override
  State<RankingTeacher> createState() => _RankingTeacherState();
}

class _RankingTeacherState extends State<RankingTeacher> {
  TeacherRanking myRanking = new TeacherRanking(0, '', 0);
  RankingService rankingService = new RankingService();
  List<TeacherRanking> top3 = [];
  List<TeacherRanking> leaderboard = [];
  bool loading = true;
  int? myId = 0;
  String? token;
  int? teacherId = 0;

  List<TeacherRanking> leaderboardTest = [];

  void sort() {
    leaderboard
        .sort((usuario1, usuario2) => usuario2.score.compareTo(usuario1.score));
    top3.add(leaderboard[0]);
    top3.add(leaderboard[1]);
    top3.add(leaderboard[2]);
    leaderboard.remove(leaderboard[0]);
    leaderboard.remove(leaderboard[0]);
    leaderboard.remove(leaderboard[0]);
    loading = false;
  }

  void assignData() {
    setState(() {
      leaderboard = rankingService.leaderboard;
      myRanking = rankingService.myRankingModel;
    });
    sort();
  }

  void getRanking() async {
    await getData();
    await rankingService.getLeaderboard(myId, token);
    assignData();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    myId = prefs.getInt('userId');
    teacherId = prefs.getInt('teacherId');
  }

  @override
  void initState() {
    super.initState();
    getRanking();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: loading
            ? Container(
                decoration: BoxDecoration(color: Colors.white),
                height: size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Center(
                          child: SpinKitFadingCircle(
                        color: KColors.purple,
                        size: 50,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Cargando Ranking',
                        style: TextStyle(color: KColors.purple),
                      ),
                    )
                  ],
                ))
            : Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text("Voluntario del Mes",
                            style: Theme.of(context).textTheme.headline2),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: KColors.blue,
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(12.0))),
                                    height: 65,
                                    width: 65,
                                    child: Center(
                                        child: Text(
                                      "2",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 5.0, 0, 5.0),
                                    child: Text(
                                        '${top3[1].name.split(" ")[0]} ${top3[1].name.split(" ")[1]}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 5.0, 0, 5.0),
                                    child: Text(top3[1].score.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  )
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: KColors.orange,
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(12.0))),
                                    height: 80,
                                    width: 80,
                                    child: Center(
                                        child: Text("1",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 5.0, 0, 5.0),
                                    child: Text(
                                        '${top3[0].name.split(" ")[0]} ${top3[0].name.split(" ")[1]}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 5.0, 0, 5.0),
                                    child: Text(top3[0].score.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  )
                                ],
                              )),
                          Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: KColors.yellow,
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(12.0))),
                                    height: 50,
                                    width: 50,
                                    child: Center(
                                        child: Text("3",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 5.0, 0, 5.0),
                                    child: Text(
                                        '${top3[2].name.split(" ")[0]} ${top3[2].name.split(" ")[1]}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 5.0, 0, 5.0),
                                    child: Text(top3[2].score.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: ListView.builder(
                            itemCount: leaderboard.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    color: (myId == leaderboard[index].id)
                                        ? Color(0xffC4C4C4)
                                        : Color(0xffE5E5E5),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            flex: 2,
                                            child: Center(
                                                child: Text(
                                              '${leaderboard[index].name.split(" ")[0]} ${leaderboard[index].name.split(" ")[1]}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                        Expanded(
                                            flex: 2,
                                            child: Center(
                                                child: Text(
                                                    leaderboard[index]
                                                        .score
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)))),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    height: 0,
                                    thickness: 1,
                                    color: Colors.black,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                              color: Color(0xff00B5E2),
                              borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(25.0),
                                topRight: const Radius.circular(25.0),
                                bottomLeft: const Radius.circular(25.0),
                                bottomRight: const Radius.circular(25.0),
                              )),
                          child: Center(
                            child: Text("Total de Puntos: ${myRanking.score}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ))
                    ]),
              ));
  }
}
