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
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'plantoes_model.dart';
export 'plantoes_model.dart';

class PlantoesWidget extends StatefulWidget {
  const PlantoesWidget({
    super.key,
    bool? fromhome,
  }) : this.fromhome = fromhome ?? false;

  final bool fromhome;

  static String routeName = 'Plantoes';
  static String routePath = '/plantoes';

  @override
  State<PlantoesWidget> createState() => _PlantoesWidgetState();
}

class _PlantoesWidgetState extends State<PlantoesWidget> {
  late PlantoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlantoesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Plantoes'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
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
          child: FutureBuilder<List<VwVagasCandidaturasRow>>(
            future: FFAppState().vagasCandidaturas(
              requestFn: () => VwVagasCandidaturasTable().queryRows(
                queryFn: (q) => q,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return PlantoesLoadingWidget();
              }
              List<VwVagasCandidaturasRow> containerVwVagasCandidaturasRowList =
                  snapshot.data!;

              return Container(
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
                          valueOrDefault<double>(
                            FFAppConstants.doubleGap,
                            0.0,
                          ),
                          valueOrDefault<double>(
                            FFAppConstants.doubleGap,
                            0.0,
                          ),
                          0.0),
                      child: FutureBuilder<List<EstadosBrasilRow>>(
                        future: FFAppState().estados(
                          requestFn: () => EstadosBrasilTable().queryRows(
                            queryFn: (q) => q,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return HeaderLoadingWidget();
                          }
                          List<EstadosBrasilRow> headerEstadosBrasilRowList =
                              snapshot.data!;

                          return wrapWithModel(
                            model: _model.headerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: HeaderWidget(
                              estados: headerEstadosBrasilRowList,
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x26A369ED),
                            offset: Offset(
                              0.0,
                              6.0,
                            ),
                            spreadRadius: 2.0,
                          )
                        ],
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
                                  'Meus plantões',
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
                                              FFIcons.kheart,
                                              color: _model.vagaStatus == ''
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
                                                  'PLANTOES_PAGE__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.vagaStatus = '';
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_reset_form_fields');
                                              safeSetState(() {
                                                _model.dropDownValueController
                                                    ?.reset();
                                              });
                                              logFirebaseEvent(
                                                  'Button_clear_query_cache');
                                              FFAppState()
                                                  .clearVagasCandidaturasCache();
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
                                              FFIcons.kclock,
                                              color: _model.vagaStatus ==
                                                      'PENDENTE'
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent3,
                                              size: 25.0,
                                            ),
                                            Text(
                                              'Em análise',
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
                                                  'PLANTOES_PAGE__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.vagaStatus = 'PENDENTE';
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_reset_form_fields');
                                              safeSetState(() {
                                                _model.dropDownValueController
                                                    ?.reset();
                                              });
                                              logFirebaseEvent(
                                                  'Button_clear_query_cache');
                                              FFAppState()
                                                  .clearVagasCandidaturasCache();
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
                                              color: _model.vagaStatus ==
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
                                                  'PLANTOES_PAGE__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.vagaStatus = 'APROVADO';
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_reset_form_fields');
                                              safeSetState(() {
                                                _model.dropDownValueController
                                                    ?.reset();
                                              });
                                              logFirebaseEvent(
                                                  'Button_clear_query_cache');
                                              FFAppState()
                                                  .clearVagasCandidaturasCache();
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
                                              color: _model.vagaStatus ==
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
                                                  'PLANTOES_PAGE__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.vagaStatus = 'REPROVADO';
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_reset_form_fields');
                                              safeSetState(() {
                                                _model.dropDownValueController
                                                    ?.reset();
                                              });
                                              logFirebaseEvent(
                                                  'Button_clear_query_cache');
                                              FFAppState()
                                                  .clearVagasCandidaturasCache();
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
                                        _model.vagaStatus == '' ? 1.0 : 0.0,
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
                                    opacity: _model.vagaStatus == 'PENDENTE'
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
                                    opacity: _model.vagaStatus == 'APROVADO'
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
                                    opacity: _model.vagaStatus == 'REPROVADO'
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
                          if (_model.vagaStatus != null &&
                              _model.vagaStatus != '')
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
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.045,
                                      decoration: BoxDecoration(),
                                      child: FlutterFlowDropDown<String>(
                                        multiSelectController:
                                            _model.dropDownValueController ??=
                                                FormListFieldController<String>(
                                                    null),
                                        options: containerVwVagasCandidaturasRowList
                                            .where((e) =>
                                                (e.medicoId ==
                                                    currentUserUid) &&
                                                (e.candidaturaStatus ==
                                                    _model.vagaStatus))
                                            .toList()
                                            .map((e) => e.hospitalNome)
                                            .withoutNulls
                                            .toList()
                                            .unique((e) => e)
                                            .sortedList(
                                                keyOf: (e) => e, desc: false),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        maxHeight:
                                            MediaQuery.sizeOf(context).height *
                                                0.45,
                                        searchHintTextStyle: FlutterFlowTheme
                                                .of(context)
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
                                        borderColor:
                                            FlutterFlowTheme.of(context)
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
                                              'PLANTOES_DropDown_dqf42pmm_ON_FORM_WIDGE');
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
                                          'PLANTOES_PAGE_Icon_rh6z33wp_ON_TAP');
                                      logFirebaseEvent(
                                          'Icon_reset_form_fields');
                                      safeSetState(() {
                                        _model.dropDownValueController?.reset();
                                      });
                                      logFirebaseEvent(
                                          'Icon_update_page_state');
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
                        ]
                            .divide(SizedBox(height: FFAppConstants.doubleGap))
                            .addToEnd(SizedBox(height: FFAppConstants.Gap)),
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
                            return ListaPlantoesLoadingWidget();
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
                                    'PLANTOES_Column_pydhfkju_ON_PULL_TO_REFR');
                                logFirebaseEvent('Column_action_block');
                                await action_blocks.clearCache(context);
                                safeSetState(() {});
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                      child: Container(
                                        width: double.infinity,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        child: ExpandableNotifier(
                                          controller: _model
                                              .expandableExpandableController,
                                          child: ExpandablePanel(
                                            header: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      valueOrDefault<double>(
                                                        FFAppConstants
                                                            .doubleGap,
                                                        0.0,
                                                      ),
                                                      0.0,
                                                      0.0,
                                                      0.0),
                                              child: Text(
                                                'Filtrar por data',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.geologica(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
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
                                            ),
                                            collapsed: Container(
                                              width: double.infinity,
                                              height: 0.0,
                                              decoration: BoxDecoration(),
                                            ),
                                            expanded: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                              child: FlutterFlowCalendar(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                iconColor: Colors.transparent,
                                                weekFormat: true,
                                                weekStartsMonday: true,
                                                onChange: (DateTimeRange?
                                                    newSelectedDate) {
                                                  safeSetState(() => _model
                                                          .calendarSelectedDay =
                                                      newSelectedDate);
                                                },
                                                titleStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.geologica(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                dayOfWeekStyle: FlutterFlowTheme
                                                        .of(context)
                                                    .bodyLarge
                                                    .override(
                                                      font:
                                                          GoogleFonts.geologica(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                      lineHeight: 1.0,
                                                    ),
                                                dateStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.geologica(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
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
                                                selectedDateStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .geologica(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
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
                                                inactiveDateStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .geologica(
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
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          final list = containerVwVagasCandidaturasRowList
                                              .where((e) =>
                                                  (e.medicoId == currentUserUid) &&
                                                  (_model.vagaStatus != null && _model.vagaStatus != ''
                                                      ? (e.candidaturaStatus ==
                                                          _model.vagaStatus)
                                                      : e.vagaSalva!) &&
                                                  (_model.dropDownValue != null &&
                                                          (_model.dropDownValue)!
                                                              .isNotEmpty
                                                      ? _model.dropDownValue!
                                                          .contains(
                                                              e.hospitalNome)
                                                      : true) &&
                                                  (_model.expandableExpandableController.expanded!
                                                      ? (e.vagasData ==
                                                          _model
                                                              .calendarSelectedDay
                                                              ?.start)
                                                      : true) &&
                                                  ((e.candidaturaStatus == 'REPROVADO') ||
                                                          (e.candidaturaStatus == 'PENDENTE')
                                                      ? (e.vagasData! >= functions.currentDate()!)
                                                      : true))
                                              .toList()
                                              .sortedList(keyOf: (e) => e.vagasData!, desc: false)
                                              .toList();
                                          if (list.isEmpty) {
                                            return EmptyListWidget(
                                              text: 'Sem plantões para mostrar',
                                            );
                                          }

                                          return ListView.separated(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: list.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 2.0),
                                            itemBuilder: (context, listIndex) {
                                              final listItem = list[listIndex];
                                              return Stack(
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .cardVagasSlimModels
                                                        .getModel(
                                                      listItem.vagasId!,
                                                      listIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: CardVagasSlimWidget(
                                                      key: Key(
                                                        'Key6n4_${listItem.vagasId!}',
                                                      ),
                                                      specialty: listItem
                                                          .especialidadeNome,
                                                      value: formatNumber(
                                                        listItem.vagasValor,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .commaDecimal,
                                                        currency: 'R\$ ',
                                                      ),
                                                      date: dateTimeFormat(
                                                        "dd/MM",
                                                        listItem.vagasData,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      datecount:
                                                          'há ${dateTimeFormat(
                                                        "relative",
                                                        listItem
                                                            .vagasCreatedate,
                                                        locale: FFLocalizations
                                                                    .of(context)
                                                                .languageShortCode ??
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}',
                                                      shift: listItem
                                                          .vagasPeriodoNome,
                                                      type: listItem
                                                          .vagasTipoNome,
                                                      hospital: functions
                                                          .cleanHospitalName(
                                                              listItem
                                                                  .hospitalNome!,
                                                              containerCleanHospitalRowList
                                                                  .map((e) =>
                                                                      e.terms)
                                                                  .withoutNulls
                                                                  .toList()),
                                                      vaga: listItem.vagasId,
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
                                                      showPay:
                                                          _model.vagaStatus ==
                                                              'APROVADO',
                                                      sector:
                                                          listItem.setorNome,
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
                                                          listItem.vagasData!
                                                              .secondsSinceEpoch,
                                                          listItem
                                                              .vagasDatapagamento!
                                                              .secondsSinceEpoch),
                                                      checkColor: () {
                                                        if ((listItem.checkin !=
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
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary;
                                                        } else {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2;
                                                        }
                                                      }(),
                                                    ),
                                                  ),
                                                  if (true)
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'PLANTOES_PAGE__BTN_ON_TAP');
                                                        if (_model
                                                            .isBottomSheetLoading) {
                                                          return;
                                                        }

                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model.isBottomSheetLoading =
                                                            true;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          useSafeArea: true,
                                                          context: context,
                                                          builder: (context) {
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
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    VagaBottomSheetWidget(
                                                                  speciality:
                                                                      listItem
                                                                          .especialidadeNome,
                                                                  value: listItem
                                                                      .vagasValor
                                                                      ?.toDouble(),
                                                                  hospital: listItem
                                                                      .hospitalNome,
                                                                  date: listItem
                                                                      .vagasData,
                                                                  datecreated:
                                                                      listItem
                                                                          .vagasCreatedate,
                                                                  startTime: listItem
                                                                      .vagasHorainicio
                                                                      ?.time,
                                                                  endTime: listItem
                                                                      .vagasHorafim
                                                                      ?.time,
                                                                  shift: listItem
                                                                      .vagasPeriodoNome,
                                                                  type: listItem
                                                                      .vagasTipoNome,
                                                                  lat: listItem
                                                                      .hospitalLat,
                                                                  lon: listItem
                                                                      .hospitalLog,
                                                                  address: listItem
                                                                      .hospitalEnd,
                                                                  jobid: listItem
                                                                      .vagasId,
                                                                  contractor:
                                                                      listItem
                                                                          .grupoNome,
                                                                  contractorName:
                                                                      listItem
                                                                          .escalistaNome,
                                                                  contractorPhone:
                                                                      listItem
                                                                          .escalistaTelefone,
                                                                  contractorEmail:
                                                                      listItem
                                                                          .escalistaEmail,
                                                                  payday: listItem
                                                                      .vagasDatapagamento,
                                                                  payment: listItem
                                                                      .vagasFormarecebimentoNome,
                                                                  avatarHospital:
                                                                      listItem
                                                                          .hospitalAvatar,
                                                                  sector: listItem
                                                                      .setorNome,
                                                                  showFavorite: _model.vagaStatus !=
                                                                              null &&
                                                                          _model.vagaStatus !=
                                                                              ''
                                                                      ? false
                                                                      : listItem
                                                                          .medicoFavorito,
                                                                  candidates: containerVwVagasCandidaturasRowList
                                                                      .where((e) =>
                                                                          e.vagasId ==
                                                                          listItem
                                                                              .vagasId)
                                                                      .toList(),
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
                                                        safeSetState(() {});
                                                        return;
                                                      },
                                                      text: '',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
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
                                                        color:
                                                            Color(0x00A369ED),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ].divide(
                                      SizedBox(height: FFAppConstants.Gap)),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: FFAppConstants.Gap)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
