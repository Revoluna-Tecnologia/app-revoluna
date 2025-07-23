import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/vagas/card_vagas/card_vagas_widget.dart';
import '/components/vagas/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'escala_widget.dart' show EscalaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EscalaModel extends FlutterFlowModel<EscalaWidget> {
  ///  Local state fields for this page.

  String vagaStatus = 'PENDENTE';

  bool isBottomSheetLoading = false;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for cardVagas dynamic component.
  late FlutterFlowDynamicModels<CardVagasModel> cardVagasModels1;
  // Models for cardVagas dynamic component.
  late FlutterFlowDynamicModels<CardVagasModel> cardVagasModels2;
  // Models for cardVagas dynamic component.
  late FlutterFlowDynamicModels<CardVagasModel> cardVagasModels3;
  // Model for drawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    cardVagasModels1 = FlutterFlowDynamicModels(() => CardVagasModel());
    cardVagasModels2 = FlutterFlowDynamicModels(() => CardVagasModel());
    cardVagasModels3 = FlutterFlowDynamicModels(() => CardVagasModel());
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    tabBarController?.dispose();
    cardVagasModels1.dispose();
    cardVagasModels2.dispose();
    cardVagasModels3.dispose();
    drawerMenuModel.dispose();
  }
}
