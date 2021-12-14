import 'package:flutter/material.dart';
import 'package:kusikay_mobile/widgets/base_card.dart';
import 'package:kusikay_mobile/widgets/vertical_separator.dart';

class BenefitsTab extends StatelessWidget {
  final bool showingBenefits;
  final VoidCallback onDismiss;
  BenefitsTab(
      {Key? key, required this.showingBenefits, required this.onDismiss})
      : super(key: key);

  //TODO: BenefitService
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
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        GestureDetector(
          onTap: onDismiss,
          child: AnimatedOpacity(
            opacity: showingBenefits ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: showingBenefits ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: Padding(
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
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(width * 0.03)),
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
                    separatorBuilder: (BuildContext context, int index) =>
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: width * 0.06),
                          child: const VerticalSeparator(),
                        ),
                    itemCount: benefitsList.length)),
          ),
        ),
      ],
    );
  }
}
