import 'package:flutter/material.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/models/token_user_data.dart';
import 'dart:ui' as ui;

import 'package:kusikay_mobile/services/login_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginService loginService = LoginService();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String token = '';
  int id = 0;
  String usernameData = '';
  String passwordData = '';
  String roleData = '';
  bool enabledData = false;
  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _login() async {
    TokenUserData tokenResponse = await loginService.login(
        username.text.toString(), password.text.toString());
    setState(() {
      token = tokenResponse.token.toString();
      id = tokenResponse.id;
      usernameData = tokenResponse.username;
      passwordData = tokenResponse.password;
      roleData = tokenResponse.role;
      enabledData = tokenResponse.enabled;
    });

    print(usernameData);
    print(token);
    if (token != '') {
      if (roleData == 'teacher') {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/home', (Route<dynamic> route) => false, arguments: {
          'id': id,
          'token': token,
          'usernameData': usernameData
        });
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/leader', (Route<dynamic> route) => false, arguments: {
          'id': id,
          'token': token,
          'usernameData': usernameData
        });
      }
      //print("Inicio Sesión Exitoso");
    } else {
      print("NO SE PUDO INICIAR SESIÓN");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: CustomPaint(
                  size: Size(
                      width,
                      (width * 0.6055555555555555)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                    width: width * 0.6,
                    child: Image(image: AssetImage('assets/logo-azul.png'))),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Bienvenido de vuelta!",
                    style: TextStyle(
                      fontSize: 24, // 360 / 18
                      fontWeight: FontWeight.w400, // Regular
                      color: Color(0xff041E42),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  width: width * 0.9,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Usuario',
                    ),
                    keyboardType: TextInputType.text,
                    controller: username,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  width: width * 0.9,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                    ),
                    controller: password,
                    keyboardType: TextInputType.text,
                    obscureText: _isHidden,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 180, top: 10, bottom: 10),
                child: Text(
                  "¿Olvidaste tu contraseña?",
                  style: TextStyle(
                    fontSize: 15, // 360 / 12
                    fontWeight: FontWeight.w400, // Regular
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Center(
                  child: Container(
                    height: 44.0,
                    width: width * 0.55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                            colors: [KColors.red, KColors.orange])),
                    child: ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent),
                        child: Text("Iniciar Sesión")),
                  ),
                ),
              ),
              CustomPaint(
                size: Size(
                    width,
                    (width * 0.5361111111111111)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter1(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3027778, size.height * 0.3572688);
    path_0.cubicTo(size.width * 0.1205858, size.height * 0.2721954,
        size.width * 0.01674278, size.height * 0.1222858, 0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.cubicTo(
        size.width * 0.9111111,
        size.height * 0.9096055,
        size.width * 0.8777778,
        size.height * 0.6973211,
        size.width * 0.7416667,
        size.height * 0.5208394);
    path_0.cubicTo(
        size.width * 0.5811889,
        size.height * 0.3127633,
        size.width * 0.4666667,
        size.height * 0.4337954,
        size.width * 0.3027778,
        size.height * 0.3572688);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5000000, 0),
        Offset(size.width * 0.5000000, size.height),
        [Color(0xffFA4616).withOpacity(1), Color(0xffF98161).withOpacity(0.8)],
        [0, 1]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.3750000, size.height * 0.7461140),
        Offset(size.width * 0.3750000, size.height * 1.709845),
        [Color(0xff00B5E2).withOpacity(1), Color(0xff00B5E2).withOpacity(0)],
        [0, 1]);
    canvas.drawCircle(Offset(size.width * 0.3750000, size.height * 1.227979),
        size.width * 0.2583333, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 1.015278, 0);
    path_1.lineTo(size.width * 1.015278, size.height);
    path_1.lineTo(size.width * 0.6460806, size.height);
    path_1.cubicTo(
        size.width * 0.6205500,
        size.height * 0.8788238,
        size.width * 0.5694639,
        size.height * 0.7816114,
        size.width * 0.5051972,
        size.height * 0.7314508);
    path_1.cubicTo(
        size.width * 0.5108167,
        size.height * 0.7289534,
        size.width * 0.5172167,
        size.height * 0.7262021,
        size.width * 0.5243028,
        size.height * 0.7231606);
    path_1.cubicTo(
        size.width * 0.6543306,
        size.height * 0.6672902,
        size.width * 1.015278,
        size.height * 0.5121974,
        size.width * 1.015278,
        0);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.shader = ui.Gradient.linear(Offset(size.width * 0.7602389, 0),
        Offset(size.width * 0.7602389, size.height), [
      Color(0xff041E42).withOpacity(0.83),
      Color(0xff041E42).withOpacity(0.9)
    ], [
      0.791667,
      1
    ]);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.3181556, size.height * 0.6973161);
    path_2.cubicTo(
        size.width * 0.1891650,
        size.height * 0.7242591,
        size.width * 0.08888889,
        size.height * 0.9283679,
        size.width * 0.08888889,
        size.height * 1.176166);
    path_2.cubicTo(
        size.width * 0.08888889,
        size.height * 1.297715,
        size.width * 0.1130169,
        size.height * 1.408756,
        size.width * 0.1528264,
        size.height * 1.493528);
    path_2.cubicTo(
        size.width * 0.1175425,
        size.height * 1.519446,
        size.width * 0.07910694,
        size.height * 1.533679,
        size.width * 0.03888889,
        size.height * 1.533679);
    path_2.cubicTo(
        size.width * -0.1329331,
        size.height * 1.533679,
        size.width * -0.2722222,
        size.height * 1.273865,
        size.width * -0.2722222,
        size.height * 0.9533679);
    path_2.cubicTo(
        size.width * -0.2722222,
        size.height * 0.6328705,
        size.width * -0.1329331,
        size.height * 0.3730570,
        size.width * 0.03888889,
        size.height * 0.3730570);
    path_2.cubicTo(
        size.width * 0.1614392,
        size.height * 0.3730570,
        size.width * 0.2674397,
        size.height * 0.5052275,
        size.width * 0.3181556,
        size.height * 0.6973161);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.02296669, size.height * 0.3730570),
        Offset(size.width * 0.02296669, size.height * 1.533679),
        [Color(0xffFEDD00).withOpacity(1), Color(0xffFEDD00).withOpacity(0)],
        [0, 1]);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
