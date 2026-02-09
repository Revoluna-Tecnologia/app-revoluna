import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/dialogs/negative_informative_box/negative_informative_box_widget.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loading/dropdown_loading/dropdown_loading_widget.dart';
import '/components/loading/pages/home_loading/home_loading_widget.dart';
import '/components/vagas/card_vagas/card_vagas_widget.dart';
import '/components/vagas/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/other/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool visibleValues = false;

  bool isBottomSheetLoading = false;

  bool calendarView = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - appTracking] action in HomePage widget.
  bool? appTracking;
  // Stores action output result for [Backend Call - Update Row(s)] action in HomePage widget.
  List<MedicosRow>? medicoTrackingUpdateTrueCopy;
  // Stores action output result for [Backend Call - Update Row(s)] action in HomePage widget.
  List<MedicosRow>? medicoTrackingUpdateFalseCopy;
  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<MedicosRow>? queryMedico;
  bool requestCompleted3 = false;
  String? requestLastUniqueKey3;
  // Stores action output result for [Custom Action - launchWhatsAppChat] action in FloatingActionButton widget.
  bool? whatsappHome;
  // Model for drawerMenu component.
  late DrawerMenuModel drawerMenuModel;
  // Model for Header component.
  late HeaderModel headerModel;
  bool requestCompleted1 = false;
  String? requestLastUniqueKey1;
  bool requestCompleted2 = false;
  String? requestLastUniqueKey2;
  // Model for emptyList component.
  late EmptyListModel emptyListModel1;
  // Models for cardVagas dynamic component.
  late FlutterFlowDynamicModels<CardVagasModel> cardVagasModels1;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Models for cardVagas dynamic component.
  late FlutterFlowDynamicModels<CardVagasModel> cardVagasModels2;
  // Models for cardVagas dynamic component.
  late FlutterFlowDynamicModels<CardVagasModel> cardVagasModels3;
  // Model for emptyList component.
  late EmptyListModel emptyListModel2;

  @override
  void initState(BuildContext context) {
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
    headerModel = createModel(context, () => HeaderModel());
    emptyListModel1 = createModel(context, () => EmptyListModel());
    cardVagasModels1 = FlutterFlowDynamicModels(() => CardVagasModel());
    cardVagasModels2 = FlutterFlowDynamicModels(() => CardVagasModel());
    cardVagasModels3 = FlutterFlowDynamicModels(() => CardVagasModel());
    emptyListModel2 = createModel(context, () => EmptyListModel());
  }

  @override
  void dispose() {
    drawerMenuModel.dispose();
    headerModel.dispose();
    emptyListModel1.dispose();
    cardVagasModels1.dispose();
    cardVagasModels2.dispose();
    cardVagasModels3.dispose();
    emptyListModel2.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted3;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted1;
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
      final requestComplete = requestCompleted2;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
