import 'package:flutter/material.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';

class RankingTeacher extends StatelessWidget {
  const RankingTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
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
                          borderRadius:
                              new BorderRadius.all(Radius.circular(12.0))),
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
                      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                      child: Text("usuario2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                      child: Text("99",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
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
                          borderRadius:
                              new BorderRadius.all(Radius.circular(12.0))),
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
                      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                      child: Text("usuario1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                      child: Text("100",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
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
                          borderRadius:
                              new BorderRadius.all(Radius.circular(12.0))),
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
                      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                      child: Text("usuario3",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                      child: Text("98",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
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
            child: ListView(
              children: <Widget>[
                Container(
                  height: 50,
                  color: Color(0xffE5E5E5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text(
                            'usuario4',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('80',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  color: Color(0xffE5E5E5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('usuario5',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('79',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  color: Color(0xffE5E5E5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('usuario6',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('78',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  color: Color(0xffC4C4C4),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('usuario7',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('77',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  color: Color(0xffE5E5E5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('usuario8',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('76',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  color: Color(0xffE5E5E5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('usuario9',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('75',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  color: Color(0xffE5E5E5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('usuario10',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('74',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                    ],
                  ),
                )
              ],
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
              child: Text("Total de Puntos: 77",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ))
      ]),
    ));
  }
}
