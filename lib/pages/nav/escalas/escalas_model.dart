import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/card_escala/card_escala_widget.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loading/header_loading/header_loading_widget.dart';
import '/components/loading/lista_escala_loading/lista_escala_loading_widget.dart';
import '/components/loading/pages/escalas_loading/escalas_loading_widget.dart';
import '/components/vagas/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/other/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'escalas_widget.dart' show EscalasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EscalasModel extends FlutterFlowModel<EscalasWidget> {
  ///  Local state fields for this page.

  bool calendarView = true;

  List<VwVagasCandidaturasRow> query = [];
  void addToQuery(VwVagasCandidaturasRow item) => query.add(item);
  void removeFromQuery(VwVagasCandidaturasRow item) => query.remove(item);
  void removeAtIndexFromQuery(int index) => query.removeAt(index);
  void insertAtIndexInQuery(int index, VwVagasCandidaturasRow item) =>
      query.insert(index, item);
  void updateQueryAtIndex(
          int index, Function(VwVagasCandidaturasRow) updateFn) =>
      query[index] = updateFn(query[index]);

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Models for cardEscala dynamic component.
  late FlutterFlowDynamicModels<CardEscalaModel> cardEscalaModels;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<VwVagasCandidaturasRow>? reloadQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<VwVagasCandidaturasRow>? workHopistalsList;
  // Model for drawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    cardEscalaModels = FlutterFlowDynamicModels(() => CardEscalaModel());
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    cardEscalaModels.dispose();
    drawerMenuModel.dispose();
  }

  /// Action blocks.
  Future loadquery(BuildContext context) async {
    List<VwVagasCandidaturasRow>? workingHopistalsList;
    List<VwVagasCandidaturasRow>? loadQuery;

    logFirebaseEvent('loadquery_backend_call');
    workingHopistalsList = await VwVagasCandidaturasTable().queryRows(
      queryFn: (q) => q
          .eqOrNull(
            'medico_id',
            currentUserUid,
          )
          .eqOrNull(
            'candidatura_status',
            'APROVADO',
          ),
    );
    logFirebaseEvent('loadquery_backend_call');
    loadQuery = await VwVagasCandidaturasTable().queryRows(
      queryFn: (q) => q
          .inFilterOrNull(
            'hospital_id',
            workingHopistalsList
                ?.map((e) => valueOrDefault<String>(
                      e.hospitalId,
                      'hospital_id',
                    ))
                .toList()
                ?.unique((e) => e),
          )
          .neqOrNull(
            'vagas_status',
            'cancelada',
          ),
    );
    logFirebaseEvent('loadquery_update_page_state');
    query = loadQuery!.toList().cast<VwVagasCandidaturasRow>();
  }
}
