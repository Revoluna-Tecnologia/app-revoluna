import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loading/pages/historico_loading/historico_loading_widget.dart';
import '/components/vagas/card_vagas/card_vagas_widget.dart';
import '/components/vagas/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/other/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'historico_model.dart';
export 'historico_model.dart';

class HistoricoWidget extends StatefulWidget {
  const HistoricoWidget({
    super.key,
    bool? fromhome,
  }) : this.fromhome = fromhome ?? false;

  final bool fromhome;

  static String routeName = 'Historico';
  static String routePath = '/historico';

  @override
  State<HistoricoWidget> createState() => _HistoricoWidgetState();
}

class _HistoricoWidgetState extends State<HistoricoWidget> {
  late HistoricoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoricoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Historico'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return FutureBuilder<List<VwVagasCandidaturasRow>>(
      future: FFAppState()
          .vagasHistorico(
        requestFn: () => VwVagasCandidaturasTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'medico_id',
                currentUserUid,
              )
              .neqOrNull(
                'vaga_status',
                'cancelada',
              )
              .gteOrNull(
                'vaga_data',
                supaSerialize<DateTime>(functions.currentDate()),
              )
              .order('vaga_horainicio', ascending: true),
        ),
      )
          .then((result) {
        _model.requestCompleted = true;
        return result;
      }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: HistoricoLoadingWidget(),
          );
        }
        List<VwVagasCandidaturasRow> historicoVwVagasCandidaturasRowList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            endDrawer: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: Drawer(
                child: wrapWithModel(
                  model: _model.drawerMenuModel,
                  updateCallback: () => safeSetState(() {}),
                  child: DrawerMenuWidget(),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            FFAppConstants.doubleGap,
                            0.0,
                          ),
                          0.0,
                          valueOrDefault<double>(
                            FFAppConstants.doubleGap,
                            0.0,
                          ),
                          0.0),
                      child: wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  FFAppConstants.doubleGap,
                                  0.0,
                                ),
                                0.0,
                                valueOrDefault<double>(
                                  FFAppConstants.doubleGap,
                                  0.0,
                                ),
                                0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Histórico',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.geologica(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.19,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              FFIcons.kclock,
                                              color: _model
                                                          .candidacyStatus ==
                                                      'PENDENTE'
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent3,
                                              size: 25.0,
                                            ),
                                            Text(
                                              'Histórico',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font: GoogleFonts.geologica(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(
                                              height: FFAppConstants.halfGap)),
                                        ),
                                        if (true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HISTORICO_PAGE__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.candidacyStatus =
                                                  'PENDENTE';
                                              _model.variableQuery = [];
                                              _model.sortedby =
                                                  'data de manifestação do interesse';
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_reset_form_fields');
                                              safeSetState(() {
                                                _model.dropDownValueController
                                                    ?.reset();
                                                _model.dropDownValue = null;
                                              });
                                            },
                                            text: '',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.06,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00A369ED),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.geologica(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      valueOrDefault<double>(
                                                FFAppConstants.borderM,
                                                0.0,
                                              )),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.19,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              FFIcons.kheart,
                                              color: _model.candidacyStatus ==
                                                      ''
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent3,
                                              size: 25.0,
                                            ),
                                            Text(
                                              'Salvos',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font: GoogleFonts.geologica(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(
                                              height: FFAppConstants.halfGap)),
                                        ),
                                        if (true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HISTORICO_PAGE__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.candidacyStatus = null;
                                              _model.variableQuery =
                                                  historicoVwVagasCandidaturasRowList
                                                      .sortedList(
                                                          keyOf: (e) =>
                                                              e.vagaCreatedate!,
                                                          desc: true)
                                                      .toList()
                                                      .cast<
                                                          VwVagasCandidaturasRow>();
                                              _model.sortedby =
                                                  'data de publicação mais recente';
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_reset_form_fields');
                                              safeSetState(() {
                                                _model.dropDownValueController
                                                    ?.reset();
                                                _model.dropDownValue = null;
                                              });
                                            },
                                            text: '',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.06,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00A369ED),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.geologica(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      valueOrDefault<double>(
                                                FFAppConstants.borderM,
                                                0.0,
                                              )),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.19,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              FFIcons.kthumbsUp,
                                              color: _model
                                                          .candidacyStatus ==
                                                      'APROVADO'
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent3,
                                              size: 25.0,
                                            ),
                                            Text(
                                              'Confirmados',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font: GoogleFonts.geologica(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(
                                              height: FFAppConstants.halfGap)),
                                        ),
                                        if (true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HISTORICO_PAGE__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.candidacyStatus =
                                                  'APROVADO';
                                              _model.variableQuery =
                                                  historicoVwVagasCandidaturasRowList
                                                      .sortedList(
                                                          keyOf: (e) =>
                                                              e.vagaData!,
                                                          desc: false)
                                                      .toList()
                                                      .cast<
                                                          VwVagasCandidaturasRow>();
                                              _model.sortedby =
                                                  'data do plantão';
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_reset_form_fields');
                                              safeSetState(() {
                                                _model.dropDownValueController
                                                    ?.reset();
                                                _model.dropDownValue = null;
                                              });
                                            },
                                            text: '',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.06,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00A369ED),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.geologica(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      valueOrDefault<double>(
                                                FFAppConstants.borderM,
                                                0.0,
                                              )),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.19,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              FFIcons.kxCircle,
                                              color: _model.candidacyStatus ==
                                                      'REPROVADO'
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent3,
                                              size: 25.0,
                                            ),
                                            Text(
                                              'Encerrados',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font: GoogleFonts.geologica(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(
                                              height: FFAppConstants.halfGap)),
                                        ),
                                        if (true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HISTORICO_PAGE__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.candidacyStatus =
                                                  'REPROVADO';
                                              _model.variableQuery = _model
                                                  .variableQuery
                                                  .sortedList(
                                                      keyOf: (e) => e.vagaData!,
                                                      desc: false)
                                                  .toList()
                                                  .cast<
                                                      VwVagasCandidaturasRow>();
                                              _model.sortedby =
                                                  'data do plantão';
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_reset_form_fields');
                                              safeSetState(() {
                                                _model.dropDownValueController
                                                    ?.reset();
                                                _model.dropDownValue = null;
                                              });
                                            },
                                            text: '',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.06,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00A369ED),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.geologica(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      valueOrDefault<double>(
                                                FFAppConstants.borderM,
                                                0.0,
                                              )),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Opacity(
                                    opacity:
                                        _model.candidacyStatus == 'PENDENTE'
                                            ? 1.0
                                            : 0.0,
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.easeInOut,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.19,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.003,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: _model.candidacyStatus == null ||
                                            _model.candidacyStatus == ''
                                        ? 1.0
                                        : 0.0,
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.easeInOut,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.19,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.003,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity:
                                        _model.candidacyStatus == 'APROVADO'
                                            ? 1.0
                                            : 0.0,
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.easeInOut,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.19,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.003,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity:
                                        _model.candidacyStatus == 'REPROVADO'
                                            ? 1.0
                                            : 0.0,
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.easeInOut,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.19,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.003,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: FFAppConstants.halfGap)),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  FFAppConstants.doubleGap,
                                  0.0,
                                ),
                                0.0,
                                valueOrDefault<double>(
                                  FFAppConstants.doubleGap,
                                  0.0,
                                ),
                                valueOrDefault<double>(
                                  FFAppConstants.Gap,
                                  0.0,
                                )),
                            child: Stack(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.045,
                                    decoration: BoxDecoration(),
                                    child: FlutterFlowDropDown<String>(
                                      multiSelectController: _model
                                              .dropDownValueController ??=
                                          FormListFieldController<String>(null),
                                      options: List<String>.from(
                                          historicoVwVagasCandidaturasRowList
                                              .where((e) => _model
                                                              .candidacyStatus !=
                                                          null &&
                                                      _model.candidacyStatus !=
                                                          ''
                                                  ? (e.candidaturaStatus ==
                                                      _model.candidacyStatus)
                                                  : (e.vagaSalva == true))
                                              .toList()
                                              .unique((e) => e.hospitalId!)
                                              .sortedList(
                                                  keyOf: (e) => e.hospitalNome!,
                                                  desc: false)
                                              .map((e) => e.hospitalId)
                                              .withoutNulls
                                              .toList()),
                                      optionLabels:
                                          historicoVwVagasCandidaturasRowList
                                              .where((e) =>
                                                  e.candidaturaStatus ==
                                                  _model.candidacyStatus)
                                              .toList()
                                              .unique((e) => e.hospitalId!)
                                              .sortedList(
                                                  keyOf: (e) => e.hospitalNome!,
                                                  desc: false)
                                              .map((e) => e.hospitalNome)
                                              .withoutNulls
                                              .toList(),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      maxHeight:
                                          MediaQuery.sizeOf(context).height *
                                              0.45,
                                      searchHintTextStyle: FlutterFlowTheme.of(
                                              context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.geologica(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                            lineHeight: 1.0,
                                          ),
                                      searchTextStyle: FlutterFlowTheme.of(
                                              context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.geologica(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.geologica(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                            lineHeight: 1.0,
                                          ),
                                      hintText: 'Todos hospitais',
                                      searchHintText: 'Pesquisar...',
                                      searchCursorColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 35.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      borderWidth: 0.0,
                                      borderRadius: FFAppConstants.borderS,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            FFAppConstants.Gap,
                                            0.0,
                                          ),
                                          0.0,
                                          valueOrDefault<double>(
                                            FFAppConstants.Gap,
                                            0.0,
                                          ),
                                          0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: true,
                                      isMultiSelect: true,
                                      onMultiSelectChanged: (val) async {
                                        safeSetState(
                                            () => _model.dropDownValue = val);
                                        logFirebaseEvent(
                                            'HISTORICO_DropDown_dqf42pmm_ON_FORM_WIDG');
                                        logFirebaseEvent(
                                            'DropDown_update_page_state');
                                        _model.clearDropColor =
                                            FlutterFlowTheme.of(context)
                                                .primary;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HISTORICO_PAGE_Icon_rh6z33wp_ON_TAP');
                                    logFirebaseEvent('Icon_reset_form_fields');
                                    safeSetState(() {
                                      _model.dropDownValueController?.reset();
                                      _model.dropDownValue = null;
                                    });
                                    logFirebaseEvent('Icon_update_page_state');
                                    _model.clearDropColor = Color(4293256677);
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    FFIcons.kxSquare,
                                    color: _model.clearDropColor,
                                    size: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(height: FFAppConstants.doubleGap)),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<CleanHospitalRow>>(
                        stream: FFAppState().cleanHospitalTerms(
                          requestFn: () => _model.containerSupabaseStream ??=
                              SupaFlow.client
                                  .from("clean_hospital")
                                  .stream(primaryKey: ['id']).map((list) => list
                                      .map((item) => CleanHospitalRow(item))
                                      .toList()),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<CleanHospitalRow> containerCleanHospitalRowList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: RefreshIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                              onRefresh: () async {
                                logFirebaseEvent(
                                    'HISTORICO_Column_pydhfkju_ON_PULL_TO_REF');
                                logFirebaseEvent(
                                    'Column_refresh_database_request');
                                safeSetState(() {
                                  FFAppState().clearVagasHistoricoCache();
                                  _model.requestCompleted = false;
                                });
                                await _model.waitForRequestCompleted();
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            FFAppConstants.doubleGap,
                                            0.0,
                                          ),
                                          0.0,
                                          0.0,
                                          valueOrDefault<double>(
                                            FFAppConstants.Gap,
                                            0.0,
                                          )),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Ordem por: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.geologica(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              _model.sortedby,
                                              'data de manifestação do interesse',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.geologica(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (false)
                                      FlutterFlowCalendar(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        weekFormat: false,
                                        weekStartsMonday: false,
                                        rowHeight: 48.0,
                                        onChange:
                                            (DateTimeRange? newSelectedDate) {
                                          safeSetState(() =>
                                              _model.calendarSelectedDay =
                                                  newSelectedDate);
                                        },
                                        titleStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                        dayOfWeekStyle: FlutterFlowTheme.of(
                                                context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                        dateStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        selectedDateStyle: FlutterFlowTheme.of(
                                                context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        inactiveDateStyle: FlutterFlowTheme.of(
                                                context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.variableQuery.isNotEmpty) {
                                            return Builder(
                                              builder: (context) {
                                                final list = _model.variableQuery
                                                    .where((e) =>
                                                        (_model.candidacyStatus != null && _model.candidacyStatus != ''
                                                            ? (e.candidaturaStatus ==
                                                                _model
                                                                    .candidacyStatus)
                                                            : e.vagaSalva!) &&
                                                        (_model.dropDownValue != null &&
                                                                (_model.dropDownValue)!
                                                                    .isNotEmpty
                                                            ? _model.dropDownValue!.contains(
                                                                e.hospitalNome)
                                                            : true) &&
                                                        ((e.candidaturaStatus ==
                                                                    'REPROVADO') ||
                                                                (e.candidaturaStatus ==
                                                                    'PENDENTE')
                                                            ? (e.vagaData! >=
                                                                functions.currentDate()!)
                                                            : true))
                                                    .toList();
                                                if (list.isEmpty) {
                                                  return EmptyListWidget(
                                                    text:
                                                        'Sem plantões para mostrar',
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2.0),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: list.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 2.0),
                                                  itemBuilder:
                                                      (context, listIndex) {
                                                    final listItem =
                                                        list[listIndex];
                                                    return Stack(
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .cardVagasModels1
                                                              .getModel(
                                                            listItem.vagaId!,
                                                            listIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              CardVagasWidget(
                                                            key: Key(
                                                              'Key6n4_${listItem.vagaId!}',
                                                            ),
                                                            specialty: listItem
                                                                .especialidadeNome,
                                                            value: formatNumber(
                                                              listItem
                                                                  .vagaValor,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .commaDecimal,
                                                              currency: 'R\$ ',
                                                            ),
                                                            date:
                                                                dateTimeFormat(
                                                              "dd/MM",
                                                              listItem.vagaData,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            datecount:
                                                                'há ${dateTimeFormat(
                                                              "relative",
                                                              listItem
                                                                  .vagaCreatedate,
                                                              locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageShortCode ??
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                            )}',
                                                            shift: listItem
                                                                .periodoNome,
                                                            type: listItem
                                                                .tiposVagaNome,
                                                            hospital: functions.cleanHospitalName(
                                                                listItem
                                                                    .hospitalNome!,
                                                                containerCleanHospitalRowList
                                                                    .map((e) =>
                                                                        e.terms)
                                                                    .withoutNulls
                                                                    .toList()),
                                                            vaga:
                                                                listItem.vagaId,
                                                            colorPay: listItem
                                                                        .pagamentoValor !=
                                                                    null
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                            avatarHospital: listItem
                                                                .hospitalAvatar,
                                                            showPay: _model
                                                                    .candidacyStatus ==
                                                                'APROVADO',
                                                            sector: listItem
                                                                .setorNome,
                                                            distance: functions
                                                                .distanceCalc(
                                                                    listItem
                                                                        .hospitalLat!,
                                                                    listItem
                                                                        .hospitalLog!,
                                                                    currentUserLocationValue!),
                                                            showSign: (int job,
                                                                    int payment) {
                                                              return (payment -
                                                                      job) <=
                                                                  86400;
                                                            }(
                                                                listItem
                                                                    .vagaData!
                                                                    .secondsSinceEpoch,
                                                                listItem
                                                                    .vagaDatapagamento!
                                                                    .secondsSinceEpoch),
                                                            checkColor: () {
                                                              if ((listItem
                                                                          .checkin !=
                                                                      null) &&
                                                                  (listItem
                                                                          .checkout ==
                                                                      null)) {
                                                                return Color(
                                                                    0xFFEBC30F);
                                                              } else if ((listItem
                                                                          .checkin !=
                                                                      null) &&
                                                                  (listItem
                                                                          .checkout !=
                                                                      null)) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2;
                                                              }
                                                            }(),
                                                          ),
                                                        ),
                                                        if (true)
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'HISTORICO_PAGE__BTN_ON_TAP');
                                                              if (_model
                                                                  .isBottomSheetLoading) {
                                                                return;
                                                              }

                                                              logFirebaseEvent(
                                                                  'Button_update_page_state');
                                                              _model.isBottomSheetLoading =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'Button_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                useSafeArea:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          VagaBottomSheetWidget(
                                                                        speciality:
                                                                            listItem.especialidadeNome,
                                                                        value: listItem
                                                                            .vagaValor
                                                                            ?.toDouble(),
                                                                        hospital:
                                                                            listItem.hospitalNome,
                                                                        date: listItem
                                                                            .vagaData,
                                                                        datecreated:
                                                                            listItem.vagaCreatedate,
                                                                        startTime: listItem
                                                                            .vagaHorainicio
                                                                            ?.time,
                                                                        endTime: listItem
                                                                            .vagaHorafim
                                                                            ?.time,
                                                                        shift: listItem
                                                                            .periodoNome,
                                                                        type: listItem
                                                                            .tiposVagaNome,
                                                                        lat: listItem
                                                                            .hospitalLat,
                                                                        lon: listItem
                                                                            .hospitalLog,
                                                                        address:
                                                                            listItem.hospitalEnd,
                                                                        jobid: listItem
                                                                            .vagaId,
                                                                        contractor:
                                                                            listItem.grupoNome,
                                                                        contractorName:
                                                                            listItem.escalistaNome,
                                                                        contractorPhone:
                                                                            listItem.escalistaTelefone,
                                                                        contractorEmail:
                                                                            listItem.escalistaEmail,
                                                                        payday:
                                                                            listItem.vagaDatapagamento,
                                                                        payment:
                                                                            listItem.formaRecebimentoNome,
                                                                        avatarHospital:
                                                                            listItem.hospitalAvatar,
                                                                        sector:
                                                                            listItem.setorNome,
                                                                        candidates: historicoVwVagasCandidaturasRowList.where((e) => (e.vagaId == listItem.vagaId) && (e.medicoId == currentUserUid)).toList().isNotEmpty
                                                                            ? historicoVwVagasCandidaturasRowList.where((e) => (e.vagaId == listItem.vagaId) && (e.medicoId == currentUserUid)).toList().firstOrNull
                                                                            : listItem,
                                                                        callback:
                                                                            () async {},
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));

                                                              logFirebaseEvent(
                                                                  'Button_update_page_state');
                                                              _model.isBottomSheetLoading =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              return;
                                                            },
                                                            text: '',
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.13,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0x00A369ED),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          } else {
                                            return Builder(
                                              builder: (context) {
                                                final list = historicoVwVagasCandidaturasRowList
                                                    .where((e) =>
                                                        (_model.candidacyStatus != null && _model.candidacyStatus != ''
                                                            ? (e.candidaturaStatus ==
                                                                _model
                                                                    .candidacyStatus)
                                                            : e.vagaSalva!) &&
                                                        (_model.dropDownValue != null &&
                                                                (_model.dropDownValue)!
                                                                    .isNotEmpty
                                                            ? _model.dropDownValue!.contains(
                                                                e.hospitalNome)
                                                            : true) &&
                                                        ((e.candidaturaStatus ==
                                                                    'REPROVADO') ||
                                                                (e.candidaturaStatus ==
                                                                    'PENDENTE')
                                                            ? (e.vagaData! >=
                                                                functions.currentDate()!)
                                                            : true))
                                                    .toList()
                                                    .sortedList(keyOf: (e) => e.candidaturaCreatedate!, desc: true)
                                                    .toList();
                                                if (list.isEmpty) {
                                                  return EmptyListWidget(
                                                    text:
                                                        'Sem plantões para mostrar',
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2.0),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: list.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 2.0),
                                                  itemBuilder:
                                                      (context, listIndex) {
                                                    final listItem =
                                                        list[listIndex];
                                                    return Stack(
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .cardVagasModels2
                                                              .getModel(
                                                            listItem.vagaId!,
                                                            listIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              CardVagasWidget(
                                                            key: Key(
                                                              'Keyjb5_${listItem.vagaId!}',
                                                            ),
                                                            specialty: listItem
                                                                .especialidadeNome,
                                                            value: formatNumber(
                                                              listItem
                                                                  .vagaValor,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .commaDecimal,
                                                              currency: 'R\$ ',
                                                            ),
                                                            date:
                                                                dateTimeFormat(
                                                              "dd/MM",
                                                              listItem.vagaData,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            datecount:
                                                                'há ${dateTimeFormat(
                                                              "relative",
                                                              listItem
                                                                  .vagaCreatedate,
                                                              locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageShortCode ??
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                            )}',
                                                            shift: listItem
                                                                .periodoNome,
                                                            type: listItem
                                                                .tiposVagaNome,
                                                            hospital: functions.cleanHospitalName(
                                                                listItem
                                                                    .hospitalNome!,
                                                                containerCleanHospitalRowList
                                                                    .map((e) =>
                                                                        e.terms)
                                                                    .withoutNulls
                                                                    .toList()),
                                                            vaga:
                                                                listItem.vagaId,
                                                            colorPay: listItem
                                                                        .pagamentoValor !=
                                                                    null
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                            avatarHospital: listItem
                                                                .hospitalAvatar,
                                                            showPay: _model
                                                                    .candidacyStatus ==
                                                                'APROVADO',
                                                            sector: listItem
                                                                .setorNome,
                                                            distance: functions
                                                                .distanceCalc(
                                                                    listItem
                                                                        .hospitalLat!,
                                                                    listItem
                                                                        .hospitalLog!,
                                                                    currentUserLocationValue!),
                                                            showSign: (int job,
                                                                    int payment) {
                                                              return (payment -
                                                                      job) <=
                                                                  86400;
                                                            }(
                                                                listItem
                                                                    .vagaData!
                                                                    .secondsSinceEpoch,
                                                                listItem
                                                                    .vagaDatapagamento!
                                                                    .secondsSinceEpoch),
                                                            checkColor: () {
                                                              if ((listItem
                                                                          .checkin !=
                                                                      null) &&
                                                                  (listItem
                                                                          .checkout ==
                                                                      null)) {
                                                                return Color(
                                                                    0xFFEBC30F);
                                                              } else if ((listItem
                                                                          .checkin !=
                                                                      null) &&
                                                                  (listItem
                                                                          .checkout !=
                                                                      null)) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2;
                                                              }
                                                            }(),
                                                          ),
                                                        ),
                                                        if (true)
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'HISTORICO_PAGE__BTN_ON_TAP');
                                                              if (_model
                                                                  .isBottomSheetLoading) {
                                                                return;
                                                              }

                                                              logFirebaseEvent(
                                                                  'Button_update_page_state');
                                                              _model.isBottomSheetLoading =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'Button_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                useSafeArea:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          VagaBottomSheetWidget(
                                                                        speciality:
                                                                            listItem.especialidadeNome,
                                                                        value: listItem
                                                                            .vagaValor
                                                                            ?.toDouble(),
                                                                        hospital:
                                                                            listItem.hospitalNome,
                                                                        date: listItem
                                                                            .vagaData,
                                                                        datecreated:
                                                                            listItem.vagaCreatedate,
                                                                        startTime: listItem
                                                                            .vagaHorainicio
                                                                            ?.time,
                                                                        endTime: listItem
                                                                            .vagaHorafim
                                                                            ?.time,
                                                                        shift: listItem
                                                                            .periodoNome,
                                                                        type: listItem
                                                                            .tiposVagaNome,
                                                                        lat: listItem
                                                                            .hospitalLat,
                                                                        lon: listItem
                                                                            .hospitalLog,
                                                                        address:
                                                                            listItem.hospitalEnd,
                                                                        jobid: listItem
                                                                            .vagaId,
                                                                        contractor:
                                                                            listItem.grupoNome,
                                                                        contractorName:
                                                                            listItem.escalistaNome,
                                                                        contractorPhone:
                                                                            listItem.escalistaTelefone,
                                                                        contractorEmail:
                                                                            listItem.escalistaEmail,
                                                                        payday:
                                                                            listItem.vagaDatapagamento,
                                                                        payment:
                                                                            listItem.formaRecebimentoNome,
                                                                        avatarHospital:
                                                                            listItem.hospitalAvatar,
                                                                        sector:
                                                                            listItem.setorNome,
                                                                        candidates: historicoVwVagasCandidaturasRowList.where((e) => (e.vagaId == listItem.vagaId) && (e.medicoId == currentUserUid)).toList().isNotEmpty
                                                                            ? historicoVwVagasCandidaturasRowList.where((e) => (e.vagaId == listItem.vagaId) && (e.medicoId == currentUserUid)).toList().firstOrNull
                                                                            : listItem,
                                                                        callback:
                                                                            () async {},
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));

                                                              logFirebaseEvent(
                                                                  'Button_update_page_state');
                                                              _model.isBottomSheetLoading =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              return;
                                                            },
                                                            text: '',
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.13,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0x00A369ED),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: FFAppConstants.Gap)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
