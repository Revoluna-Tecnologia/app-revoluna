import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
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
    context.watch<FFAppState>();
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
          .vagasAbertas(
        requestFn: () => VwVagasCandidaturasTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'vaga_status',
                'aberta',
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
            body: Center(
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
        List<VwVagasCandidaturasRow> explorarVwVagasCandidaturasRowList =
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
                  mainAxisSize: MainAxisSize.min,
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
                                                  explorarVwVagasCandidaturasRowList
                                                      .sortedList(
                                                          keyOf: (e) =>
                                                              e.vagaCreatedate!,
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
                                                  explorarVwVagasCandidaturasRowList
                                                      .sortedList(
                                                          keyOf: (e) =>
                                                              e.vagaCreatedate!,
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
                                                    explorarVwVagasCandidaturasRowList
                                                        .sortedList(
                                                            keyOf: (e) =>
                                                                e.vagaData!,
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
                                                    explorarVwVagasCandidaturasRowList
                                                        .sortedList(
                                                            keyOf: (e) =>
                                                                e.vagaData!,
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
                                                  explorarVwVagasCandidaturasRowList
                                                      .sortedList(
                                                          keyOf: (e) =>
                                                              e.vagaValor!,
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
                                                  explorarVwVagasCandidaturasRowList
                                                      .sortedList(
                                                          keyOf: (e) =>
                                                              e.vagaValor!,
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
                                                    explorarVwVagasCandidaturasRowList
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
                                                    explorarVwVagasCandidaturasRowList
                                                        .sortedList(
                                                            keyOf: (e) => e
                                                                .vagaDatapagamento!,
                                                            desc: false)
                                                        .toList(),
                                                    _model.ascendingOrder)
                                                .where((e) =>
                                                    (int job, int payment) {
                                                      return (payment - job) <=
                                                          86400;
                                                    }(
                                                        e.vagaData!
                                                            .secondsSinceEpoch,
                                                        e.vagaDatapagamento!
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
                                      options: List<String>.from(_model
                                              .variableQuery.isNotEmpty
                                          ? _model.variableQuery
                                              .unique((e) => e.hospitalId!)
                                              .sortedList(
                                                  keyOf: (e) => e.hospitalNome!,
                                                  desc: false)
                                              .map((e) => e.hospitalId)
                                              .withoutNulls
                                              .toList()
                                          : explorarVwVagasCandidaturasRowList
                                              .unique((e) => e.hospitalId!)
                                              .sortedList(
                                                  keyOf: (e) => e.hospitalNome!,
                                                  desc: false)
                                              .map((e) => e.hospitalId)
                                              .withoutNulls
                                              .toList()),
                                      optionLabels: _model
                                              .variableQuery.isNotEmpty
                                          ? _model.variableQuery
                                              .unique((e) => e.hospitalId!)
                                              .sortedList(
                                                  keyOf: (e) => e.hospitalNome!,
                                                  desc: false)
                                              .map((e) => e.hospitalNome)
                                              .withoutNulls
                                              .toList()
                                          : explorarVwVagasCandidaturasRowList
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
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            if (!(_model.variableQuery.isNotEmpty) &&
                                (_model.sortBy == 'vagas_createdate')) {
                              return Builder(
                                builder: (context) {
                                  final initialList =
                                      explorarVwVagasCandidaturasRowList
                                          .where((e) =>
                                              (_model
                                                              .dropDownValue !=
                                                          null &&
                                                      (_model
                                                              .dropDownValue)!
                                                          .isNotEmpty
                                                  ? _model
                                                      .dropDownValue!
                                                      .contains(e.hospitalId)
                                                  : true) &&
                                              (e.vagaData! >=
                                                  functions.currentDate()!))
                                          .toList()
                                          .unique((e) => e.vagaId!)
                                          .sortedList(
                                              keyOf: (e) => e.vagaCreatedate!,
                                              desc: true)
                                          .toList();
                                  if (initialList.isEmpty) {
                                    return EmptyListWidget(
                                      text: 'Sem vagas para mostrar',
                                    );
                                  }

                                  return RefreshIndicator(
                                    key: Key('RefreshIndicator_y24cg39n'),
                                    color: FlutterFlowTheme.of(context).primary,
                                    onRefresh: () async {
                                      logFirebaseEvent(
                                          'EXPLORAR_ListView_0kxem4ui_ON_PULL_TO_RE');
                                      logFirebaseEvent(
                                          'ListView_refresh_database_request');
                                      safeSetState(() {
                                        FFAppState().clearVagasAbertasCache();
                                        _model.requestCompleted = false;
                                      });
                                      await _model.waitForRequestCompleted();
                                    },
                                    child: ListView.separated(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: initialList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 2.0),
                                      itemBuilder: (context, initialListIndex) {
                                        final initialListItem =
                                            initialList[initialListIndex];
                                        return Stack(
                                          children: [
                                            wrapWithModel(
                                              model: _model.cardVagasModels1
                                                  .getModel(
                                                initialListItem.vagaId!,
                                                initialListIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CardVagasWidget(
                                                key: Key(
                                                  'Keyzze_${initialListItem.vagaId!}',
                                                ),
                                                specialty: initialListItem
                                                    .especialidadeNome,
                                                value: formatNumber(
                                                  initialListItem.vagaValor,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                  currency: 'R\$ ',
                                                ),
                                                date: dateTimeFormat(
                                                  "dd/MM",
                                                  initialListItem.vagaData,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                datecount: 'há ${dateTimeFormat(
                                                  "relative",
                                                  initialListItem
                                                      .vagaCreatedate,
                                                  locale: FFLocalizations.of(
                                                              context)
                                                          .languageShortCode ??
                                                      FFLocalizations.of(
                                                              context)
                                                          .languageCode,
                                                )}',
                                                shift: '',
                                                type: initialListItem
                                                    .tiposVagaNome,
                                                hospital:
                                                    functions.cleanHospitalName(
                                                        initialListItem
                                                            .hospitalNome!,
                                                        FFAppState()
                                                            .cleanHospital
                                                            .toList()),
                                                vaga: initialListItem.vagaId,
                                                avatarHospital: initialListItem
                                                    .hospitalAvatar,
                                                showPay: false,
                                                sector:
                                                    initialListItem.setorNome,
                                                distance: functions.distanceCalc(
                                                    initialListItem
                                                        .hospitalLat!,
                                                    initialListItem
                                                        .hospitalLog!,
                                                    currentUserLocationValue!),
                                                showSign:
                                                    (int job, int payment) {
                                                  return (payment - job) <=
                                                      86400;
                                                }(
                                                        initialListItem
                                                            .vagaData!
                                                            .secondsSinceEpoch,
                                                        initialListItem
                                                            .vagaDatapagamento!
                                                            .secondsSinceEpoch),
                                              ),
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
                                                    isScrollControlled: true,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
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
                                                            value:
                                                                initialListItem
                                                                    .vagaValor
                                                                    ?.toDouble(),
                                                            hospital:
                                                                initialListItem
                                                                    .hospitalNome,
                                                            date:
                                                                initialListItem
                                                                    .vagaData,
                                                            datecreated:
                                                                initialListItem
                                                                    .vagaCreatedate,
                                                            startTime:
                                                                initialListItem
                                                                    .vagaHorainicio
                                                                    ?.time,
                                                            endTime:
                                                                initialListItem
                                                                    .vagaHorafim
                                                                    ?.time,
                                                            shift:
                                                                initialListItem
                                                                    .periodoNome,
                                                            type: initialListItem
                                                                .tiposVagaNome,
                                                            lat: initialListItem
                                                                .hospitalLat,
                                                            lon: initialListItem
                                                                .hospitalLog,
                                                            address:
                                                                initialListItem
                                                                    .hospitalEnd,
                                                            jobid:
                                                                initialListItem
                                                                    .vagaId,
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
                                                                .vagaDatapagamento,
                                                            payment: initialListItem
                                                                .formaRecebimentoNome,
                                                            avatarHospital:
                                                                initialListItem
                                                                    .hospitalAvatar,
                                                            sector:
                                                                initialListItem
                                                                    .setorNome,
                                                            candidates: explorarVwVagasCandidaturasRowList
                                                                    .where((e) =>
                                                                        (e.vagaId ==
                                                                            initialListItem
                                                                                .vagaId) &&
                                                                        (e.medicoId ==
                                                                            currentUserUid))
                                                                    .toList()
                                                                    .isNotEmpty
                                                                ? explorarVwVagasCandidaturasRowList
                                                                    .where((e) =>
                                                                        (e.vagaId ==
                                                                            initialListItem
                                                                                .vagaId) &&
                                                                        (e.medicoId ==
                                                                            currentUserUid))
                                                                    .toList()
                                                                    .firstOrNull
                                                                : initialListItem,
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
                                                  logFirebaseEvent(
                                                      'Button_google_analytics_event');
                                                  logFirebaseEvent(
                                                    'vagas_exibicao',
                                                    parameters: {
                                                      'user_id': currentUserUid,
                                                      'time':
                                                          getCurrentTimestamp,
                                                      'location':
                                                          currentUserLocationValue,
                                                      'vaga_id': initialListItem
                                                          .vagaId,
                                                    },
                                                  );
                                                  return;
                                                },
                                                text: '',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.13,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x00A369ED),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                  final variableList = _model.variableQuery
                                      .where((e) =>
                                          (_model.dropDownValue != null &&
                                                  (_model.dropDownValue)!
                                                      .isNotEmpty
                                              ? _model.dropDownValue!
                                                  .contains(e.hospitalId)
                                              : true) &&
                                          (e.vagaData! >=
                                              functions.currentDate()!))
                                      .toList()
                                      .unique((e) => e.vagaId!)
                                      .toList();
                                  if (variableList.isEmpty) {
                                    return EmptyListWidget(
                                      text: 'Sem vagas para mostrar',
                                    );
                                  }

                                  return RefreshIndicator(
                                    key: Key('RefreshIndicator_sg1lzcrb'),
                                    color: FlutterFlowTheme.of(context).primary,
                                    onRefresh: () async {
                                      logFirebaseEvent(
                                          'EXPLORAR_ListView_bh771fn0_ON_PULL_TO_RE');
                                      logFirebaseEvent(
                                          'ListView_refresh_database_request');
                                      safeSetState(() {
                                        FFAppState().clearVagasAbertasCache();
                                        _model.requestCompleted = false;
                                      });
                                      await _model.waitForRequestCompleted();
                                    },
                                    child: ListView.separated(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
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
                                              model: _model.cardVagasModels2
                                                  .getModel(
                                                variableListItem.vagaId!,
                                                variableListIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CardVagasWidget(
                                                key: Key(
                                                  'Keyxhf_${variableListItem.vagaId!}',
                                                ),
                                                specialty: variableListItem
                                                    .especialidadeNome,
                                                value: formatNumber(
                                                  variableListItem.vagaValor,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                  currency: 'R\$ ',
                                                ),
                                                date: dateTimeFormat(
                                                  "dd/MM",
                                                  variableListItem.vagaData,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                datecount: 'há ${dateTimeFormat(
                                                  "relative",
                                                  variableListItem
                                                      .vagaCreatedate,
                                                  locale: FFLocalizations.of(
                                                              context)
                                                          .languageShortCode ??
                                                      FFLocalizations.of(
                                                              context)
                                                          .languageCode,
                                                )}',
                                                shift: '',
                                                type: variableListItem
                                                    .tiposVagaNome,
                                                hospital:
                                                    functions.cleanHospitalName(
                                                        variableListItem
                                                            .hospitalNome!,
                                                        FFAppState()
                                                            .cleanHospital
                                                            .toList()),
                                                vaga: variableListItem.vagaId,
                                                avatarHospital: variableListItem
                                                    .hospitalAvatar,
                                                showPay: false,
                                                sector:
                                                    variableListItem.setorNome,
                                                distance: functions.distanceCalc(
                                                    variableListItem
                                                        .hospitalLat!,
                                                    variableListItem
                                                        .hospitalLog!,
                                                    currentUserLocationValue!),
                                                showSign:
                                                    (int job, int payment) {
                                                  return (payment - job) <=
                                                      86400;
                                                }(
                                                        variableListItem
                                                            .vagaData!
                                                            .secondsSinceEpoch,
                                                        variableListItem
                                                            .vagaDatapagamento!
                                                            .secondsSinceEpoch),
                                              ),
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
                                                    isScrollControlled: true,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
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
                                                            value:
                                                                variableListItem
                                                                    .vagaValor
                                                                    ?.toDouble(),
                                                            hospital:
                                                                variableListItem
                                                                    .hospitalNome,
                                                            date:
                                                                variableListItem
                                                                    .vagaData,
                                                            datecreated:
                                                                variableListItem
                                                                    .vagaCreatedate,
                                                            startTime:
                                                                variableListItem
                                                                    .vagaHorainicio
                                                                    ?.time,
                                                            endTime:
                                                                variableListItem
                                                                    .vagaHorafim
                                                                    ?.time,
                                                            shift:
                                                                variableListItem
                                                                    .periodoNome,
                                                            type: variableListItem
                                                                .tiposVagaNome,
                                                            lat: variableListItem
                                                                .hospitalLat,
                                                            lon: variableListItem
                                                                .hospitalLog,
                                                            address:
                                                                variableListItem
                                                                    .hospitalEnd,
                                                            jobid:
                                                                variableListItem
                                                                    .vagaId,
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
                                                                .vagaDatapagamento,
                                                            payment:
                                                                variableListItem
                                                                    .formaRecebimentoNome,
                                                            avatarHospital:
                                                                variableListItem
                                                                    .hospitalAvatar,
                                                            sector:
                                                                variableListItem
                                                                    .setorNome,
                                                            candidates: explorarVwVagasCandidaturasRowList
                                                                    .where((e) =>
                                                                        (e.vagaId ==
                                                                            variableListItem
                                                                                .vagaId) &&
                                                                        (e.medicoId ==
                                                                            currentUserUid))
                                                                    .toList()
                                                                    .isNotEmpty
                                                                ? explorarVwVagasCandidaturasRowList
                                                                    .where((e) =>
                                                                        (e.vagaId ==
                                                                            variableListItem
                                                                                .vagaId) &&
                                                                        (e.medicoId ==
                                                                            currentUserUid))
                                                                    .toList()
                                                                    .firstOrNull
                                                                : variableListItem,
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
                                                  logFirebaseEvent(
                                                      'Button_google_analytics_event');
                                                  logFirebaseEvent(
                                                    'vagas_exibicao',
                                                    parameters: {
                                                      'user_id': currentUserUid,
                                                      'time':
                                                          getCurrentTimestamp,
                                                      'location':
                                                          currentUserLocationValue,
                                                      'vaga_id':
                                                          variableListItem
                                                              .vagaId,
                                                    },
                                                  );
                                                  return;
                                                },
                                                text: '',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.13,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x00A369ED),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
