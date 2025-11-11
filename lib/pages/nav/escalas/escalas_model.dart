import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/vagas/card_escala/card_escala_widget.dart';
import '/components/vagas/empty_list/empty_list_widget.dart';
import '/components/vagas/empty_list_houston/empty_list_houston_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/other/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'escalas_widget.dart' show EscalasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EscalasModel extends FlutterFlowModel<EscalasWidget> {
  ///  Local state fields for this page.

  bool calendarView = true;

  ///  State fields for stateful widgets in this page.

  // Model for drawerMenu component.
  late DrawerMenuModel drawerMenuModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Models for cardEscala dynamic component.
  late FlutterFlowDynamicModels<CardEscalaModel> cardEscalaModels;
  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // Model for emptyListHouston component.
  late EmptyListHoustonModel emptyListHoustonModel;

  @override
  void initState(BuildContext context) {
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
    headerModel = createModel(context, () => HeaderModel());
    cardEscalaModels = FlutterFlowDynamicModels(() => CardEscalaModel());
    emptyListHoustonModel = createModel(context, () => EmptyListHoustonModel());
  }

  @override
  void dispose() {
    drawerMenuModel.dispose();
    headerModel.dispose();
    cardEscalaModels.dispose();
    emptyListHoustonModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
