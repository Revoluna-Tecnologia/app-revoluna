import '/components/loading/calendar_loading/calendar_loading_widget.dart';
import '/components/loading/card_vagas_loading/card_vagas_loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'initial_loading_widget.dart' show InitialLoadingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InitialLoadingModel extends FlutterFlowModel<InitialLoadingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for calendarLoading component.
  late CalendarLoadingModel calendarLoadingModel;
  // Model for cardVagasLoading component.
  late CardVagasLoadingModel cardVagasLoadingModel1;
  // Model for cardVagasLoading component.
  late CardVagasLoadingModel cardVagasLoadingModel2;
  // Model for cardVagasLoading component.
  late CardVagasLoadingModel cardVagasLoadingModel3;
  // Model for cardVagasLoading component.
  late CardVagasLoadingModel cardVagasLoadingModel4;
  // Model for cardVagasLoading component.
  late CardVagasLoadingModel cardVagasLoadingModel5;

  @override
  void initState(BuildContext context) {
    calendarLoadingModel = createModel(context, () => CalendarLoadingModel());
    cardVagasLoadingModel1 =
        createModel(context, () => CardVagasLoadingModel());
    cardVagasLoadingModel2 =
        createModel(context, () => CardVagasLoadingModel());
    cardVagasLoadingModel3 =
        createModel(context, () => CardVagasLoadingModel());
    cardVagasLoadingModel4 =
        createModel(context, () => CardVagasLoadingModel());
    cardVagasLoadingModel5 =
        createModel(context, () => CardVagasLoadingModel());
  }

  @override
  void dispose() {
    calendarLoadingModel.dispose();
    cardVagasLoadingModel1.dispose();
    cardVagasLoadingModel2.dispose();
    cardVagasLoadingModel3.dispose();
    cardVagasLoadingModel4.dispose();
    cardVagasLoadingModel5.dispose();
  }
}
