import 'package:flutter/material.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/models/benefit.dart';
import 'package:kusikay_mobile/services/benefit_service.dart';
import 'package:kusikay_mobile/widgets/base_card.dart';
import 'package:kusikay_mobile/widgets/vertical_separator.dart';
import 'package:ms_undraw/illustrations.g.dart';
import 'package:ms_undraw/ms_undraw.dart';

class BenefitsTab extends StatefulWidget {
  final bool showingBenefits;
  final VoidCallback onDismiss;
  BenefitsTab(
      {Key? key, required this.showingBenefits, required this.onDismiss})
      : super(key: key);

  @override
  State<BenefitsTab> createState() => _BenefitsTabState();
}

class _BenefitsTabState extends State<BenefitsTab> {
  BenefitService benefitService = BenefitService();
  List<Benefit> benefits = [];

  void getData() async {
    benefits = await benefitService.getBenefits();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // benefitsList.removeRange(0, 2);
    double width = MediaQuery.of(context).size.width;
    return IgnorePointer(
      ignoring: !widget.showingBenefits,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          GestureDetector(
            onTap: widget.onDismiss,
            child: AnimatedOpacity(
              opacity: widget.showingBenefits ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: widget.showingBenefits ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: width * 0.06),
              child: BaseCard(
                  child: benefits.isEmpty
                      ? Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.07),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              UnDraw(
                                illustration: UnDrawIllustration.work_chat,
                                color: KColors.purple,
                                width: width * 0.4,
                              ),
                              SizedBox(height: width * 0.05),
                              Text(
                                'No hay promociones disponibles!',
                                style: Theme.of(context).textTheme.headline4,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: width * 0.05),
                              const Text(
                                'Estamos trabajando para que disfruten de nuevos beneficios, regresa pronto!',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: width * 0.02),
                            ],
                          ),
                        )
                      : ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                                padding: EdgeInsets.all(width * 0.02),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(width * 0.03)),
                                        child: Image.network(
                                          benefits[index].imagenUrl!,
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            benefits[index].name!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            benefits[index].description!,
                                            style: const TextStyle(height: 1.7),
                                          )
                                        ],
                                      ),
                                      flex: 12,
                                    ),
                                  ],
                                ),
                              ),
                          separatorBuilder: (BuildContext context, int index) =>
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: width * 0.06),
                                child: const VerticalSeparator(),
                              ),
                          itemCount: benefits.length)),
            ),
          ),
        ],
      ),
    );
  }
}
