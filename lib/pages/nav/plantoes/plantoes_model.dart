import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loading/header_loading/header_loading_widget.dart';
import '/components/loading/lista_plantoes_loading/lista_plantoes_loading_widget.dart';
import '/components/loading/pages/plantoes_loading/plantoes_loading_widget.dart';
import '/components/vagas/card_vagas_slim/card_vagas_slim_widget.dart';
import '/components/vagas/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/other/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'plantoes_widget.dart' show PlantoesWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlantoesModel extends FlutterFlowModel<PlantoesWidget> {
  ///  Local state fields for this page.

  String? vagaStatus = '';

  bool isBottomSheetLoading = false;

  Color? clearDropColor = Color(4293256677);

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  Stream<List<CleanHospitalRow>>? containerSupabaseStream;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Models for cardVagasSlim dynamic component.
  late FlutterFlowDynamicModels<CardVagasSlimModel> cardVagasSlimModels;
  // Model for drawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    cardVagasSlimModels = FlutterFlowDynamicModels(() => CardVagasSlimModel());
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    expandableExpandableController.dispose();
    cardVagasSlimModels.dispose();
    drawerMenuModel.dispose();
  }
}
