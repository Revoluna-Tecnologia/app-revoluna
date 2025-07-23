import '/backend/supabase/supabase.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/vagas/card_vagas/card_vagas_widget.dart';
import '/components/vagas/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'dart:async';
import 'explorar_widget.dart' show ExplorarWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExplorarModel extends FlutterFlowModel<ExplorarWidget> {
  ///  Local state fields for this page.

  Color clearDropColor = Color(4293256677);

  bool isBottomSheetLoading = false;

  List<String> shiftFilter = [
    'Diurno',
    'Noturno',
    'Cinderela',
    'Meio período (manhã)',
    'Meio período (tarde)'
  ];
  void addToShiftFilter(String item) => shiftFilter.add(item);
  void removeFromShiftFilter(String item) => shiftFilter.remove(item);
  void removeAtIndexFromShiftFilter(int index) => shiftFilter.removeAt(index);
  void insertAtIndexInShiftFilter(int index, String item) =>
      shiftFilter.insert(index, item);
  void updateShiftFilterAtIndex(int index, Function(String) updateFn) =>
      shiftFilter[index] = updateFn(shiftFilter[index]);

  bool hideTable = true;

  List<String> typeFilter = ['Fixo', 'Cobertura', 'Ambulatorial'];
  void addToTypeFilter(String item) => typeFilter.add(item);
  void removeFromTypeFilter(String item) => typeFilter.remove(item);
  void removeAtIndexFromTypeFilter(int index) => typeFilter.removeAt(index);
  void insertAtIndexInTypeFilter(int index, String item) =>
      typeFilter.insert(index, item);
  void updateTypeFilterAtIndex(int index, Function(String) updateFn) =>
      typeFilter[index] = updateFn(typeFilter[index]);

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  Completer<List<VagasCompletoRow>>? requestCompleter1;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  Completer<List<EspecialidadesRow>>? requestCompleter2;
  // Models for cardVagas dynamic component.
  late FlutterFlowDynamicModels<CardVagasModel> cardVagasModels1;
  // Models for cardVagas dynamic component.
  late FlutterFlowDynamicModels<CardVagasModel> cardVagasModels2;
  // Model for drawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    cardVagasModels1 = FlutterFlowDynamicModels(() => CardVagasModel());
    cardVagasModels2 = FlutterFlowDynamicModels(() => CardVagasModel());
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    cardVagasModels1.dispose();
    cardVagasModels2.dispose();
    drawerMenuModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
