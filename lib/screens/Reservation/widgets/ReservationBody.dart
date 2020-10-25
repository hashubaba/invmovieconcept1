import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:supercharged/supercharged.dart';
import 'package:intl/intl.dart';

import 'package:invmovieconcept1/models/MovieObject.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../messages/keys.dart';
import '../Dimensions.dart';

class ReservationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MovieObject movie = ModalRoute.of(context).settings.arguments;

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: PlayAnimation<double>(
        curve: Curves.easeOut,
        tween: 1.0.tweenTo(0.0),
        delay: 120.milliseconds,
        duration: 750.milliseconds,
        builder: (context, child, animation) {
          return Opacity(
            opacity: (1 - animation * 1.77).clamp(
              0.0,
              1.0,
            ),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).padding.top +
                    MediaQuery.of(context).padding.bottom +
                    Dimensions.cardHeight * 2 +
                    AppDimensions.padding * 20,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: Dimensions.cardHeight,
                      child: Transform(
                        alignment: FractionalOffset.topCenter,
                        transform: Matrix4.identity()
                          ..scale(
                            1 + (0.15 * animation),
                            1 + (0.15 * animation),
                          )
                          ..translate(
                            0.0,
                            AppDimensions.padding * 15 * animation,
                          ),
                        child: Align(
                          child: Container(
                            width: Dimensions.cardWidth * 1.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppTheme.accent,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  padding: EdgeInsets.all(
                                    AppDimensions.padding * 3,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: AppDimensions.padding * 13),
                                      Text(
                                        App.translate(
                                          ReservationScreenMessages.film,
                                        ),
                                        style: TextStyles.body17.copyWith(
                                          color: Colors.white.withOpacity(0.84),
                                        ),
                                      ),
                                      Text(
                                        movie.name,
                                        style: TextStyles.heading56.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                          height: AppDimensions.padding * 2.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            App.translate(
                                              ReservationScreenMessages.date,
                                            ),
                                            style: TextStyles.body17.copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.84),
                                            ),
                                          ),
                                          Text(
                                            App.translate(
                                                ReservationScreenMessages
                                                    .seats),
                                            style: TextStyles.body17.copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.84),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            DateFormat("d/m/y")
                                                .format(DateTime.now()),
                                            style:
                                                TextStyles.heading56.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "G1, G2",
                                            style:
                                                TextStyles.heading56.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0.4),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppTheme.accent,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppDimensions.padding * 3,
                                    vertical: AppDimensions.padding * 4,
                                  ),
                                  child: BarcodeWidget(
                                    drawText: false,
                                    barcode: Barcode.gs128(),
                                    data: "Mv-${movie.name}",
                                    height: AppDimensions.padding * 9,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top +
                          AppDimensions.padding * 10,
                      left: 0,
                      right: 0,
                      child: Transform(
                        alignment: FractionalOffset.topCenter,
                        transform: Matrix4.identity()
                          ..scale(
                            1 + (0.77 * animation),
                            1 + (0.77 * animation),
                          )
                          ..translate(
                            0.0,
                            AppDimensions.padding * -10 * animation,
                          ),
                        child: Align(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: Dimensions.cardHeight,
                            width: Dimensions.cardWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8,
                                  offset: Offset(0, 4.0),
                                  color: AppTheme.text.withOpacity(0.45),
                                )
                              ],
                            ),
                            child: Transform.scale(
                              scale: 1 + (animation * 0.8),
                              child: Image.asset(
                                movie.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
