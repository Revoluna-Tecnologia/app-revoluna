import '/backend/supabase/supabase.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loading/header_loading/header_loading_widget.dart';
import '/components/loading/lista_explorar_loading/lista_explorar_loading_widget.dart';
import '/components/loading/pages/explora_loading/explora_loading_widget.dart';
import '/components/vagas/card_vagas_slim/card_vagas_slim_widget.dart';
import '/components/vagas/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/other/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
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

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  Stream<List<CleanHospitalRow>>? containerSupabaseStream;
  // Models for cardVagasSlim dynamic component.
  late FlutterFlowDynamicModels<CardVagasSlimModel> cardVagasSlimModels1;
  // Models for cardVagasSlim dynamic component.
  late FlutterFlowDynamicModels<CardVagasSlimModel> cardVagasSlimModels2;
  // Model for drawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    cardVagasSlimModels1 = FlutterFlowDynamicModels(() => CardVagasSlimModel());
    cardVagasSlimModels2 = FlutterFlowDynamicModels(() => CardVagasSlimModel());
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    cardVagasSlimModels1.dispose();
    cardVagasSlimModels2.dispose();
    drawerMenuModel.dispose();
  }
}
