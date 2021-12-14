import 'package:flutter/material.dart';
import 'package:kusikay_mobile/widgets/base_card.dart';
import 'package:kusikay_mobile/widgets/vertical_separator.dart';

//TODO: Refactor to self-contain the opacity and backdrop

class BenefitsTab extends StatelessWidget {
  BenefitsTab({Key? key}) : super(key: key);
  final List<List<String>> benefitsList = [
    [
      'assets/bembos_logo.png',
      'Consigue una Clásica mediana por S/ 7.90 para celebrar tu primer año en Kusikay!'
    ],
    [
      'assets/crehana_logo.png',
      'Obtén acceso ilimitado a todos los cursos disponibles por 3 meses hasta Setiembre.'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: width * 0.06),
      child: BaseCard(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: Row(
                      children: [
                        Flexible(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(width * 0.03)),
                            child: Image.asset(
                              benefitsList[index][0],
                              height: width * 0.12,
                            ),
                          ),
                          flex: 7,
                        ),
                        Flexible(
                          child: Container(),
                          flex: 2,
                        ),
                        Flexible(
                          child: Text(
                            benefitsList[index][1],
                            style: const TextStyle(height: 1.7),
                          ),
                          flex: 12,
                        )
                      ],
                    ),
                  ),
              separatorBuilder: (BuildContext context, int index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: width * 0.06),
                    child: const VerticalSeparator(),
                  ),
              itemCount: benefitsList.length)),
    );
  }
}
