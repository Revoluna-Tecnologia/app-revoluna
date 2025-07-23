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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'explorar_model.dart';
export 'explorar_model.dart';

class ExplorarWidget extends StatefulWidget {
  const ExplorarWidget({super.key});

  static String routeName = 'Explorar';
  static String routePath = '/explorar';

  @override
  State<ExplorarWidget> createState() => _ExplorarWidgetState();
}

class _ExplorarWidgetState extends State<ExplorarWidget> {
  late ExplorarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExplorarModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Explorar'});
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
                return ExploraLoadingWidget();
              }
              List<VwVagasCandidaturasRow> containerVwVagasCandidaturasRowList =
                  snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                  'Explorar',
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
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.16,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FFIcons.kclock,
                                                color: _model.sortBy ==
                                                        'vagas_createdate'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                size: 25.0,
                                              ),
                                              if (_model.sortBy ==
                                                  'vagas_createdate')
                                                Builder(
                                                  builder: (context) {
                                                    if (_model.ascendingOrder) {
                                                      return Icon(
                                                        Icons.north,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        size: 16.0,
                                                      );
                                                    } else {
                                                      return Icon(
                                                        Icons.south,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        size: 16.0,
                                                      );
                                                    }
                                                  },
                                                ),
                                            ],
                                          ),
                                          Text(
                                            'Publicação',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
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
                                                'EXPLORAR_PAGE__BTN_ON_TAP');
                                            if (_model.sortBy ==
                                                'vagas_createdate') {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.ascendingOrder =
                                                  !_model.ascendingOrder;
                                              safeSetState(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.ascendingOrder = false;
                                              safeSetState(() {});
                                            }

                                            if (_model.ascendingOrder) {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.variableQuery =
                                                  containerVwVagasCandidaturasRowList
                                                      .sortedList(
                                                          keyOf: (e) => e
                                                              .vagasCreatedate!,
                                                          desc: false)
                                                      .toList()
                                                      .cast<
                                                          VwVagasCandidaturasRow>();
                                              _model.sortBy =
                                                  'vagas_createdate';
                                              safeSetState(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.variableQuery =
                                                  containerVwVagasCandidaturasRowList
                                                      .sortedList(
                                                          keyOf: (e) => e
                                                              .vagasCreatedate!,
                                                          desc: true)
                                                      .toList()
                                                      .cast<
                                                          VwVagasCandidaturasRow>();
                                              _model.sortBy =
                                                  'vagas_createdate';
                                              safeSetState(() {});
                                            }
                                          },
                                          text: '',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x00A369ED),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font:
                                                          GoogleFonts.geologica(
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
                                            borderRadius: BorderRadius.circular(
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
                                      MediaQuery.sizeOf(context).width * 0.16,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FFIcons.kcalendar,
                                                color: _model.sortBy ==
                                                        'vagas_data'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                size: 25.0,
                                              ),
                                              if (_model.sortBy == 'vagas_data')
                                                Builder(
                                                  builder: (context) {
                                                    if (_model.ascendingOrder) {
                                                      return Icon(
                                                        Icons.north,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        size: 16.0,
                                                      );
                                                    } else {
                                                      return Icon(
                                                        Icons.south,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        size: 16.0,
                                                      );
                                                    }
                                                  },
                                                ),
                                            ],
                                          ),
                                          Text(
                                            'Data',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
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
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'EXPLORAR_PAGE__BTN_ON_TAP');
                                              if (_model.sortBy ==
                                                  'vagas_data') {
                                                logFirebaseEvent(
                                                    'Button_update_page_state');
                                                _model.ascendingOrder =
                                                    !_model.ascendingOrder;
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_update_page_state');
                                                _model.ascendingOrder = false;
                                                safeSetState(() {});
                                              }

                                              if (_model.ascendingOrder) {
                                                logFirebaseEvent(
                                                    'Button_update_page_state');
                                                _model.variableQuery =
                                                    containerVwVagasCandidaturasRowList
                                                        .sortedList(
                                                            keyOf: (e) =>
                                                                e.vagasData!,
                                                            desc: false)
                                                        .toList()
                                                        .cast<
                                                            VwVagasCandidaturasRow>();
                                                _model.sortBy = 'vagas_data';
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_update_page_state');
                                                _model.variableQuery =
                                                    containerVwVagasCandidaturasRowList
                                                        .sortedList(
                                                            keyOf: (e) =>
                                                                e.vagasData!,
                                                            desc: true)
                                                        .toList()
                                                        .cast<
                                                            VwVagasCandidaturasRow>();
                                                _model.sortBy = 'vagas_data';
                                                safeSetState(() {});
                                              }
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
                                        ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.16,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FFIcons.kdollarSign,
                                                color: _model.sortBy ==
                                                        'vagas_valor'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                size: 25.0,
                                              ),
                                              if (_model.sortBy ==
                                                  'vagas_valor')
                                                Builder(
                                                  builder: (context) {
                                                    if (_model.ascendingOrder) {
                                                      return Icon(
                                                        Icons.north,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        size: 16.0,
                                                      );
                                                    } else {
                                                      return Icon(
                                                        Icons.south,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        size: 16.0,
                                                      );
                                                    }
                                                  },
                                                ),
                                            ],
                                          ),
                                          Text(
                                            'Valor',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
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
                                                'EXPLORAR_PAGE__BTN_ON_TAP');
                                            if (_model.sortBy ==
                                                'vagas_valor') {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.ascendingOrder =
                                                  !_model.ascendingOrder;
                                              safeSetState(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.ascendingOrder = false;
                                              safeSetState(() {});
                                            }

                                            if (_model.ascendingOrder) {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.variableQuery =
                                                  containerVwVagasCandidaturasRowList
                                                      .sortedList(
                                                          keyOf: (e) =>
                                                              e.vagasValor!,
                                                          desc: false)
                                                      .toList()
                                                      .cast<
                                                          VwVagasCandidaturasRow>();
                                              _model.sortBy = 'vagas_valor';
                                              safeSetState(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.variableQuery =
                                                  containerVwVagasCandidaturasRowList
                                                      .sortedList(
                                                          keyOf: (e) =>
                                                              e.vagasValor!,
                                                          desc: true)
                                                      .toList()
                                                      .cast<
                                                          VwVagasCandidaturasRow>();
                                              _model.sortBy = 'vagas_valor';
                                              safeSetState(() {});
                                            }
                                          },
                                          text: '',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x00A369ED),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font:
                                                          GoogleFonts.geologica(
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
                                            borderRadius: BorderRadius.circular(
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
                                      MediaQuery.sizeOf(context).width * 0.16,
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
                                            FFIcons.kmapPin,
                                            color: _model.sortBy == 'location'
                                                ? FlutterFlowTheme.of(context)
                                                    .tertiary
                                                : FlutterFlowTheme.of(context)
                                                    .accent3,
                                            size: 25.0,
                                          ),
                                          Text(
                                            'Localidade',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
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
                                                'EXPLORAR_PAGE__BTN_ON_TAP');
                                            currentUserLocationValue =
                                                await getCurrentUserLocation(
                                                    defaultLocation:
                                                        LatLng(0.0, 0.0));
                                            logFirebaseEvent(
                                                'Button_update_page_state');
                                            _model.variableQuery = functions
                                                .sortByLocation(
                                                    currentUserLocationValue!,
                                                    containerVwVagasCandidaturasRowList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<VwVagasCandidaturasRow>();
                                            _model.sortBy = 'location';
                                            safeSetState(() {});
                                          },
                                          text: '',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x00A369ED),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font:
                                                          GoogleFonts.geologica(
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
                                            borderRadius: BorderRadius.circular(
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
                                      MediaQuery.sizeOf(context).width * 0.16,
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
                                            FFIcons.kalertCircle,
                                            color: _model.sortBy == 'avista'
                                                ? FlutterFlowTheme.of(context)
                                                    .tertiary
                                                : FlutterFlowTheme.of(context)
                                                    .accent3,
                                            size: 25.0,
                                          ),
                                          Text(
                                            'À vista',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
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
                                                'EXPLORAR_PAGE__BTN_ON_TAP');
                                            if (_model.sortBy != 'avista') {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.ascendingOrder = true;
                                              safeSetState(() {});
                                            }
                                            logFirebaseEvent(
                                                'Button_update_page_state');
                                            _model.variableQuery = functions
                                                .sortByPayment(
                                                    containerVwVagasCandidaturasRowList
                                                        .sortedList(
                                                            keyOf: (e) =>
                                                                e.vagasData!,
                                                            desc: false)
                                                        .toList(),
                                                    _model.ascendingOrder)
                                                .where((e) =>
                                                    (int job, int payment) {
                                                      return (payment - job) <=
                                                          86400;
                                                    }(
                                                        e.vagasData!
                                                            .secondsSinceEpoch,
                                                        e.vagasDatapagamento!
                                                            .secondsSinceEpoch))
                                                .toList()
                                                .cast<VwVagasCandidaturasRow>();
                                            _model.sortBy = 'avista';
                                            safeSetState(() {});
                                          },
                                          text: '',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x00A369ED),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font:
                                                          GoogleFonts.geologica(
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
                                            borderRadius: BorderRadius.circular(
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
                                0.0),
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
                                      options: _model.variableQuery.isNotEmpty
                                          ? _model.variableQuery
                                              .where((e) =>
                                                  e.vagasStatus == 'aberta')
                                              .toList()
                                              .map((e) => e.especialidadeNome)
                                              .withoutNulls
                                              .toList()
                                              .unique((e) => e)
                                              .sortedList(
                                                  keyOf: (e) => e, desc: false)
                                          : containerVwVagasCandidaturasRowList
                                              .where((e) =>
                                                  e.vagasStatus == 'aberta')
                                              .toList()
                                              .map((e) => e.especialidadeNome)
                                              .withoutNulls
                                              .toList()
                                              .unique((e) => e)
                                              .sortedList(
                                                  keyOf: (e) => e, desc: false),
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
                                      hintText: 'Todas especialidades',
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
                                            'EXPLORAR_DropDown_d31ybg95_ON_FORM_WIDGE');
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
                                        'EXPLORAR_PAGE_Icon_u0mfjaoj_ON_TAP');
                                    logFirebaseEvent('Icon_reset_form_fields');
                                    safeSetState(() {
                                      _model.dropDownValueController?.reset();
                                    });
                                    logFirebaseEvent('Icon_update_page_state');
                                    _model.clearDropColor =
                                        FlutterFlowTheme.of(context).accent2;
                                    _model.hideTable = false;
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
                            .addToEnd(
                                SizedBox(height: FFAppConstants.doubleGap)),
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
                            return Container(
                              height: double.infinity,
                              child: ListaExplorarLoadingWidget(),
                            );
                          }
                          List<CleanHospitalRow> containerCleanHospitalRowList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                if (_model.variableQuery.isNotEmpty) {
                                  return Builder(
                                    builder: (context) {
                                      final variableList = _model.variableQuery
                                          .where((e) =>
                                              (_model.dropDownValue != null &&
                                                      (_model.dropDownValue)!
                                                          .isNotEmpty
                                                  ? _model.dropDownValue!
                                                      .contains(
                                                          e.especialidadeNome)
                                                  : true) &&
                                              (e.vagasStatus == 'aberta') &&
                                              (e.hospitalEstado ==
                                                  _model.headerModel
                                                      .dropDownValue) &&
                                              (e.vagasData! >=
                                                  functions.currentDate()!))
                                          .toList()
                                          .unique((e) => e.vagasId!)
                                          .toList();
                                      if (variableList.isEmpty) {
                                        return EmptyListWidget(
                                          text: 'Sem vagas para mostrar',
                                        );
                                      }

                                      return RefreshIndicator(
                                        key: Key('RefreshIndicator_33py6qco'),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        onRefresh: () async {
                                          logFirebaseEvent(
                                              'EXPLORAR_ListView_2y2hmp1n_ON_PULL_TO_RE');
                                          logFirebaseEvent(
                                              'ListView_action_block');
                                          await action_blocks
                                              .clearCache(context);
                                          safeSetState(() {});
                                        },
                                        child: ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: variableList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 2.0),
                                          itemBuilder:
                                              (context, variableListIndex) {
                                            final variableListItem =
                                                variableList[variableListIndex];
                                            return Stack(
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .cardVagasSlimModels1
                                                      .getModel(
                                                    variableListItem.vagasId!,
                                                    variableListIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: CardVagasSlimWidget(
                                                    key: Key(
                                                      'Keyvfd_${variableListItem.vagasId!}',
                                                    ),
                                                    specialty: variableListItem
                                                        .especialidadeNome,
                                                    value: formatNumber(
                                                      variableListItem
                                                          .vagasValor,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .commaDecimal,
                                                      currency: 'R\$ ',
                                                    ),
                                                    date: dateTimeFormat(
                                                      "dd/MM",
                                                      variableListItem
                                                          .vagasData,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    datecount:
                                                        'há ${dateTimeFormat(
                                                      "relative",
                                                      variableListItem
                                                          .vagasCreatedate,
                                                      locale: FFLocalizations
                                                                  .of(context)
                                                              .languageShortCode ??
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )}',
                                                    shift: variableListItem
                                                        .vagasPeriodoNome,
                                                    type: variableListItem
                                                        .vagasTipoNome,
                                                    hospital: functions
                                                        .cleanHospitalName(
                                                            variableListItem
                                                                .hospitalNome!,
                                                            containerCleanHospitalRowList
                                                                .map((e) =>
                                                                    e.terms)
                                                                .withoutNulls
                                                                .toList()),
                                                    vaga: variableListItem
                                                        .vagasId,
                                                    avatarHospital:
                                                        variableListItem
                                                            .hospitalAvatar,
                                                    showPay: false,
                                                    sector: variableListItem
                                                        .setorNome,
                                                    distance:
                                                        functions.distanceCalc(
                                                            variableListItem
                                                                .hospitalLat!,
                                                            variableListItem
                                                                .hospitalLog!,
                                                            currentUserLocationValue!),
                                                    showSign: (int job,
                                                            int payment) {
                                                      return (payment - job) <=
                                                          86400;
                                                    }(
                                                        variableListItem
                                                            .vagasData!
                                                            .secondsSinceEpoch,
                                                        variableListItem
                                                            .vagasDatapagamento!
                                                            .secondsSinceEpoch),
                                                  ),
                                                ),
                                                if (true)
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'EXPLORAR_PAGE__BTN_ON_TAP');
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
                                                                    variableListItem
                                                                        .especialidadeNome,
                                                                value: variableListItem
                                                                    .vagasValor
                                                                    ?.toDouble(),
                                                                hospital:
                                                                    variableListItem
                                                                        .hospitalNome,
                                                                date: variableListItem
                                                                    .vagasData,
                                                                datecreated:
                                                                    variableListItem
                                                                        .vagasCreatedate,
                                                                startTime:
                                                                    variableListItem
                                                                        .vagasHorainicio
                                                                        ?.time,
                                                                endTime:
                                                                    variableListItem
                                                                        .vagasHorafim
                                                                        ?.time,
                                                                shift: variableListItem
                                                                    .vagasPeriodoNome,
                                                                type: variableListItem
                                                                    .vagasTipoNome,
                                                                lat: variableListItem
                                                                    .hospitalLat,
                                                                lon: variableListItem
                                                                    .hospitalLog,
                                                                address:
                                                                    variableListItem
                                                                        .hospitalEnd,
                                                                jobid:
                                                                    variableListItem
                                                                        .vagasId,
                                                                contractor:
                                                                    variableListItem
                                                                        .grupoNome,
                                                                contractorName:
                                                                    variableListItem
                                                                        .escalistaNome,
                                                                contractorPhone:
                                                                    variableListItem
                                                                        .escalistaTelefone,
                                                                contractorEmail:
                                                                    variableListItem
                                                                        .escalistaEmail,
                                                                payday: variableListItem
                                                                    .vagasDatapagamento,
                                                                payment:
                                                                    variableListItem
                                                                        .vagasFormarecebimentoNome,
                                                                avatarHospital:
                                                                    variableListItem
                                                                        .hospitalAvatar,
                                                                sector:
                                                                    variableListItem
                                                                        .setorNome,
                                                                showFavorite:
                                                                    variableListItem
                                                                        .medicoFavorito,
                                                                candidates: containerVwVagasCandidaturasRowList
                                                                    .where((e) =>
                                                                        e.vagasId ==
                                                                        variableListItem
                                                                            .vagasId)
                                                                    .toList(),
                                                                callback:
                                                                    () async {},
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

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
                                                      height: MediaQuery.sizeOf(
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
                                                      color: Color(0x00A369ED),
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return Builder(
                                    builder: (context) {
                                      final initialList =
                                          containerVwVagasCandidaturasRowList
                                              .where((e) =>
                                                  (_model.dropDownValue !=
                                                              null &&
                                                          (_model.dropDownValue)!
                                                              .isNotEmpty
                                                      ? _model.dropDownValue!
                                                          .contains(e
                                                              .especialidadeNome)
                                                      : true) &&
                                                  (e.vagasStatus == 'aberta') &&
                                                  (e.hospitalEstado ==
                                                      _model.headerModel
                                                          .dropDownValue) &&
                                                  (e.vagasData! >=
                                                      functions.currentDate()!))
                                              .toList()
                                              .unique((e) => e.vagasId!)
                                              .sortedList(
                                                  keyOf: (e) =>
                                                      e.vagasCreatedate!,
                                                  desc: true)
                                              .toList();
                                      if (initialList.isEmpty) {
                                        return EmptyListWidget(
                                          text: 'Sem vagas para mostrar',
                                        );
                                      }

                                      return RefreshIndicator(
                                        key: Key('RefreshIndicator_y24cg39n'),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        onRefresh: () async {
                                          logFirebaseEvent(
                                              'EXPLORAR_ListView_0kxem4ui_ON_PULL_TO_RE');
                                          logFirebaseEvent(
                                              'ListView_action_block');
                                          await action_blocks
                                              .clearCache(context);
                                          safeSetState(() {});
                                        },
                                        child: ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: initialList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 2.0),
                                          itemBuilder:
                                              (context, initialListIndex) {
                                            final initialListItem =
                                                initialList[initialListIndex];
                                            return Stack(
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .cardVagasSlimModels2
                                                      .getModel(
                                                    initialListItem.vagasId!,
                                                    initialListIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: CardVagasSlimWidget(
                                                    key: Key(
                                                      'Keyzze_${initialListItem.vagasId!}',
                                                    ),
                                                    specialty: initialListItem
                                                        .especialidadeNome,
                                                    value: formatNumber(
                                                      initialListItem
                                                          .vagasValor,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .commaDecimal,
                                                      currency: 'R\$ ',
                                                    ),
                                                    date: dateTimeFormat(
                                                      "dd/MM",
                                                      initialListItem.vagasData,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    datecount:
                                                        'há ${dateTimeFormat(
                                                      "relative",
                                                      initialListItem
                                                          .vagasCreatedate,
                                                      locale: FFLocalizations
                                                                  .of(context)
                                                              .languageShortCode ??
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )}',
                                                    shift: initialListItem
                                                        .vagasPeriodoNome,
                                                    type: initialListItem
                                                        .vagasTipoNome,
                                                    hospital: functions
                                                        .cleanHospitalName(
                                                            initialListItem
                                                                .hospitalNome!,
                                                            containerCleanHospitalRowList
                                                                .map((e) =>
                                                                    e.terms)
                                                                .withoutNulls
                                                                .toList()),
                                                    vaga:
                                                        initialListItem.vagasId,
                                                    avatarHospital:
                                                        initialListItem
                                                            .hospitalAvatar,
                                                    showPay: false,
                                                    sector: initialListItem
                                                        .setorNome,
                                                    distance:
                                                        functions.distanceCalc(
                                                            initialListItem
                                                                .hospitalLat!,
                                                            initialListItem
                                                                .hospitalLog!,
                                                            currentUserLocationValue!),
                                                    showSign: (int job,
                                                            int payment) {
                                                      return (payment - job) <=
                                                          86400;
                                                    }(
                                                        initialListItem
                                                            .vagasData!
                                                            .secondsSinceEpoch,
                                                        initialListItem
                                                            .vagasDatapagamento!
                                                            .secondsSinceEpoch),
                                                  ),
                                                ),
                                                if (true)
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'EXPLORAR_PAGE__BTN_ON_TAP');
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
                                                                    initialListItem
                                                                        .especialidadeNome,
                                                                value: initialListItem
                                                                    .vagasValor
                                                                    ?.toDouble(),
                                                                hospital:
                                                                    initialListItem
                                                                        .hospitalNome,
                                                                date: initialListItem
                                                                    .vagasData,
                                                                datecreated:
                                                                    initialListItem
                                                                        .vagasCreatedate,
                                                                startTime:
                                                                    initialListItem
                                                                        .vagasHorainicio
                                                                        ?.time,
                                                                endTime:
                                                                    initialListItem
                                                                        .vagasHorafim
                                                                        ?.time,
                                                                shift: initialListItem
                                                                    .vagasPeriodoNome,
                                                                type: initialListItem
                                                                    .vagasTipoNome,
                                                                lat: initialListItem
                                                                    .hospitalLat,
                                                                lon: initialListItem
                                                                    .hospitalLog,
                                                                address:
                                                                    initialListItem
                                                                        .hospitalEnd,
                                                                jobid:
                                                                    initialListItem
                                                                        .vagasId,
                                                                contractor:
                                                                    initialListItem
                                                                        .grupoNome,
                                                                contractorName:
                                                                    initialListItem
                                                                        .escalistaNome,
                                                                contractorPhone:
                                                                    initialListItem
                                                                        .escalistaTelefone,
                                                                contractorEmail:
                                                                    initialListItem
                                                                        .escalistaEmail,
                                                                payday: initialListItem
                                                                    .vagasDatapagamento,
                                                                payment:
                                                                    initialListItem
                                                                        .vagasFormarecebimentoNome,
                                                                avatarHospital:
                                                                    initialListItem
                                                                        .hospitalAvatar,
                                                                sector:
                                                                    initialListItem
                                                                        .setorNome,
                                                                showFavorite:
                                                                    initialListItem
                                                                        .medicoFavorito,
                                                                candidates: containerVwVagasCandidaturasRowList
                                                                    .where((e) =>
                                                                        e.vagasId ==
                                                                        initialListItem
                                                                            .vagasId)
                                                                    .toList(),
                                                                callback:
                                                                    () async {},
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

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
                                                      height: MediaQuery.sizeOf(
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
                                                      color: Color(0x00A369ED),
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
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
