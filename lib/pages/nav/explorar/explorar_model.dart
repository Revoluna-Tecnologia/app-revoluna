import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loading/pages/explora_loading/explora_loading_widget.dart';
import '/components/vagas/card_vagas/card_vagas_widget.dart';
import '/components/vagas/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/other/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'explorar_widget.dart' show ExplorarWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExplorarModel extends FlutterFlowModel<ExplorarWidget> {
  ///  Local state fields for this page.

  Color clearDropColor = Color(4293256677);

  bool isBottomSheetLoading = false;

  bool hideTable = false;

  List<String> typeFilter = ['Fixo', 'Cobertura', 'Ambulatorial'];
  void addToTypeFilter(String item) => typeFilter.add(item);
  void removeFromTypeFilter(String item) => typeFilter.remove(item);
  void removeAtIndexFromTypeFilter(int index) => typeFilter.removeAt(index);
  void insertAtIndexInTypeFilter(int index, String item) =>
      typeFilter.insert(index, item);
  void updateTypeFilterAtIndex(int index, Function(String) updateFn) =>
      typeFilter[index] = updateFn(typeFilter[index]);

  String sortBy = 'vagas_createdate';

  bool ascendingOrder = false;

  List<VwVagasCandidaturasRow> variableQuery = [];
  void addToVariableQuery(VwVagasCandidaturasRow item) =>
      variableQuery.add(item);
  void removeFromVariableQuery(VwVagasCandidaturasRow item) =>
      variableQuery.remove(item);
  void removeAtIndexFromVariableQuery(int index) =>
      variableQuery.removeAt(index);
  void insertAtIndexInVariableQuery(int index, VwVagasCandidaturasRow item) =>
      variableQuery.insert(index, item);
  void updateVariableQueryAtIndex(
          int index, Function(VwVagasCandidaturasRow) updateFn) =>
      variableQuery[index] = updateFn(variableQuery[index]);

  String? vagaId;

  ///  State fields for stateful widgets in this page.

  // Model for drawerMenu component.
  late DrawerMenuModel drawerMenuModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // Models for cardVagas dynamic component.
  late FlutterFlowDynamicModels<CardVagasModel> cardVagasModels1;
  // Models for cardVagas dynamic component.
  late FlutterFlowDynamicModels<CardVagasModel> cardVagasModels2;

  @override
  void initState(BuildContext context) {
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
    headerModel = createModel(context, () => HeaderModel());
    cardVagasModels1 = FlutterFlowDynamicModels(() => CardVagasModel());
    cardVagasModels2 = FlutterFlowDynamicModels(() => CardVagasModel());
  }

  @override
  void dispose() {
    drawerMenuModel.dispose();
    headerModel.dispose();
    cardVagasModels1.dispose();
    cardVagasModels2.dispose();
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
