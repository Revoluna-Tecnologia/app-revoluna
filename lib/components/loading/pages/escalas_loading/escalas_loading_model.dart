import '/components/loading/calendar_loading/calendar_loading_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'escalas_loading_widget.dart' show EscalasLoadingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EscalasLoadingModel extends FlutterFlowModel<EscalasLoadingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for calendarLoading component.
  late CalendarLoadingModel calendarLoadingModel;

  @override
  void initState(BuildContext context) {
    calendarLoadingModel = createModel(context, () => CalendarLoadingModel());
  }

  @override
  void dispose() {
    calendarLoadingModel.dispose();
  }
}
