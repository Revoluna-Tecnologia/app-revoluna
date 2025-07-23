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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExplorarModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EspecialidadesRow>>(
      future: (_model.requestCompleter2 ??= Completer<List<EspecialidadesRow>>()
            ..complete(EspecialidadesTable().queryRows(
              queryFn: (q) => q,
            )))
          .future,
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
        List<EspecialidadesRow> explorarEspecialidadesRowList = snapshot.data!;

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                              valueOrDefault<double>(
                                FFAppConstants.doubleGap,
                                0.0,
                              ),
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
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
                                          FFIcons.klayers,
                                          color: _model.shiftFilter.length == 5
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .accent3,
                                          size: 25.0,
                                        ),
                                        Text(
                                          'Todas',
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(
                                          height: FFAppConstants.halfGap)),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.shiftFilter = [
                                          'Diurno',
                                          'Noturno',
                                          'Cinderela',
                                          'Meio período (manhã)',
                                          'Meio período (tarde)'
                                        ].toList().cast<String>();
                                        safeSetState(() {});
                                        safeSetState(() =>
                                            _model.requestCompleter1 = null);
                                        await _model.waitForRequestCompleted1(
                                            maxWait: 2);
                                      },
                                      text: '',
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x00A369ED),
                                        textStyle: FlutterFlowTheme.of(context)
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
                                              color: Colors.white,
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
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          FFIcons.ksun,
                                          color: (_model.shiftFilter.length ==
                                                      1) &&
                                                  (_model.shiftFilter
                                                          .lastOrNull ==
                                                      'Diurno')
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .accent3,
                                          size: 25.0,
                                        ),
                                        Text(
                                          'Diurno',
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(
                                          height: FFAppConstants.halfGap)),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.shiftFilter = ['Diurno']
                                              .toList()
                                              .cast<String>();
                                          safeSetState(() {});
                                          safeSetState(() =>
                                              _model.requestCompleter1 = null);
                                          await _model.waitForRequestCompleted1(
                                              maxWait: 2);
                                        },
                                        text: '',
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
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
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
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
                                          FFIcons.kmoon,
                                          color: (_model.shiftFilter.length ==
                                                      1) &&
                                                  (_model.shiftFilter
                                                          .lastOrNull ==
                                                      'Noturno')
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .accent3,
                                          size: 25.0,
                                        ),
                                        Text(
                                          'Noturno',
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(
                                          height: FFAppConstants.halfGap)),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.shiftFilter =
                                            ['Noturno'].toList().cast<String>();
                                        safeSetState(() {});
                                        safeSetState(() =>
                                            _model.requestCompleter1 = null);
                                        await _model.waitForRequestCompleted1(
                                            maxWait: 2);
                                      },
                                      text: '',
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x00A369ED),
                                        textStyle: FlutterFlowTheme.of(context)
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
                                              color: Colors.white,
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
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          FFIcons.kcinderela,
                                          color: (_model.shiftFilter.length ==
                                                      1) &&
                                                  (_model.shiftFilter
                                                          .lastOrNull ==
                                                      'Cinderela')
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .accent3,
                                          size: 25.0,
                                        ),
                                        Text(
                                          'Cinderela',
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(
                                          height: FFAppConstants.halfGap)),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.shiftFilter = ['Cinderela']
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        safeSetState(() =>
                                            _model.requestCompleter1 = null);
                                        await _model.waitForRequestCompleted1();
                                      },
                                      text: '',
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x00A369ED),
                                        textStyle: FlutterFlowTheme.of(context)
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
                                              color: Colors.white,
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
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          FFIcons.ksunrise,
                                          color: (_model.shiftFilter.length ==
                                                      1) &&
                                                  (_model.shiftFilter
                                                          .lastOrNull ==
                                                      'Meio período (manhã)')
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .accent3,
                                          size: 25.0,
                                        ),
                                        Text(
                                          'Manhã',
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(
                                          height: FFAppConstants.halfGap)),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.shiftFilter = [
                                          'Meio período (manhã)'
                                        ].toList().cast<String>();
                                        safeSetState(() {});
                                        safeSetState(() =>
                                            _model.requestCompleter1 = null);
                                        await _model.waitForRequestCompleted1();
                                      },
                                      text: '',
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x00A369ED),
                                        textStyle: FlutterFlowTheme.of(context)
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
                                              color: Colors.white,
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
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          FFIcons.ksunset,
                                          color: (_model.shiftFilter.length ==
                                                      1) &&
                                                  (_model.shiftFilter
                                                          .lastOrNull ==
                                                      'Meio período (tarde)')
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .accent3,
                                          size: 25.0,
                                        ),
                                        Text(
                                          'Tarde',
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(
                                          height: FFAppConstants.halfGap)),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.shiftFilter = [
                                          'Meio período (tarde)'
                                        ].toList().cast<String>();
                                        safeSetState(() {});
                                        safeSetState(() =>
                                            _model.requestCompleter1 = null);
                                        await _model.waitForRequestCompleted1();
                                      },
                                      text: '',
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x00A369ED),
                                        textStyle: FlutterFlowTheme.of(context)
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
                                              color: Colors.white,
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
                            ]
                                .divide(SizedBox(width: FFAppConstants.Gap))
                                .addToEnd(
                                    SizedBox(width: FFAppConstants.doubleGap)),
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
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.045,
                                  decoration: BoxDecoration(),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from(
                                        explorarEspecialidadesRowList
                                            .map((e) => e.especialidadeIndex)
                                            .withoutNulls
                                            .toList()
                                            .sortedList(
                                                keyOf: (e) => e, desc: false)),
                                    optionLabels: explorarEspecialidadesRowList
                                        .map((e) => e.especialidadeNome)
                                        .withoutNulls
                                        .toList(),
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue = val);
                                      _model.clearDropColor =
                                          FlutterFlowTheme.of(context).primary;
                                      _model.hideTable = false;
                                      safeSetState(() {});
                                    },
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    maxHeight:
                                        MediaQuery.sizeOf(context).height *
                                            0.45,
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context)
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
                                    searchTextStyle:
                                        FlutterFlowTheme.of(context)
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 35.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).secondary,
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
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  safeSetState(() {
                                    _model.dropDownValueController?.reset();
                                  });
                                  _model.clearDropColor =
                                      FlutterFlowTheme.of(context).accent2;
                                  _model.hideTable = true;
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.typeFilter
                                          .where((e) => e == 'Fixo')
                                          .toList()
                                          .isNotEmpty) {
                                        _model.removeFromTypeFilter('Fixo');
                                        safeSetState(() {});
                                      } else {
                                        _model.addToTypeFilter('Fixo');
                                        safeSetState(() {});
                                      }

                                      safeSetState(() =>
                                          _model.requestCompleter1 = null);
                                      await _model.waitForRequestCompleted1(
                                          maxWait: 2);
                                    },
                                    text: 'Fixo',
                                    icon: Icon(
                                      FFIcons.kbriefcase,
                                      color: _model.typeFilter
                                              .where((e) => e == 'Fixo')
                                              .toList()
                                              .isNotEmpty
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .accent2,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.03,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x00A369ED),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            font: GoogleFonts.geologica(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.borderS,
                                        0.0,
                                      )),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.typeFilter
                                          .where((e) => e == 'Cobertura')
                                          .toList()
                                          .isNotEmpty) {
                                        _model
                                            .removeFromTypeFilter('Cobertura');
                                        safeSetState(() {});
                                      } else {
                                        _model.addToTypeFilter('Cobertura');
                                        safeSetState(() {});
                                      }

                                      safeSetState(() =>
                                          _model.requestCompleter1 = null);
                                      await _model.waitForRequestCompleted1(
                                          maxWait: 2);
                                    },
                                    text: 'Cobertura',
                                    icon: Icon(
                                      FFIcons.krefreshCw,
                                      color: _model.typeFilter
                                              .where((e) => e == 'Cobertura')
                                              .toList()
                                              .isNotEmpty
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .accent2,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.03,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x00A369ED),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            font: GoogleFonts.geologica(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.borderS,
                                        0.0,
                                      )),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.typeFilter
                                          .where((e) => e == 'Ambulatorial')
                                          .toList()
                                          .isNotEmpty) {
                                        _model.removeFromTypeFilter(
                                            'Ambulatorial');
                                        safeSetState(() {});
                                      } else {
                                        _model.addToTypeFilter('Ambulatorial');
                                        safeSetState(() {});
                                      }

                                      safeSetState(() =>
                                          _model.requestCompleter1 = null);
                                      await _model.waitForRequestCompleted1(
                                          maxWait: 2);
                                    },
                                    text: 'Ambulatorial',
                                    icon: Icon(
                                      Icons.local_hospital_outlined,
                                      color: _model.typeFilter
                                              .where((e) => e == 'Ambulatorial')
                                              .toList()
                                              .isNotEmpty
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .accent2,
                                      size: 17.0,
                                    ),
                                    options: FFButtonOptions(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.03,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x00A369ED),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            font: GoogleFonts.geologica(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.borderS,
                                        0.0,
                                      )),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: FFAppConstants.doubleGap))
                          .addToEnd(SizedBox(height: FFAppConstants.doubleGap)),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<VagasCompletoRow>>(
                      future: (_model.requestCompleter1 ??=
                              Completer<List<VagasCompletoRow>>()
                                ..complete(VagasCompletoTable().queryRows(
                                  queryFn: (q) => q
                                      .inFilterOrNull(
                                        'periodo_nome',
                                        _model.shiftFilter,
                                      )
                                      .eqOrNull(
                                        'vagas_status',
                                        'aberta',
                                      )
                                      .inFilterOrNull(
                                        'tipo_nome',
                                        _model.typeFilter,
                                      )
                                      .order('vagas_createdate'),
                                )))
                          .future,
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
                        List<VagasCompletoRow> containerVagasCompletoRowList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Visibility(
                            visible: true,
                            child: Builder(
                              builder: (context) {
                                if (_model.hideTable) {
                                  return Builder(
                                    builder: (context) {
                                      final containerVar =
                                          containerVagasCompletoRowList
                                              .toList();

                                      return RefreshIndicator(
                                        key: Key('RefreshIndicator_zvrn5kqs'),
                                        onRefresh: () async {
                                          safeSetState(() =>
                                              _model.requestCompleter2 = null);
                                          await _model.waitForRequestCompleted2(
                                              maxWait: 2);
                                          safeSetState(() =>
                                              _model.requestCompleter1 = null);
                                          await _model.waitForRequestCompleted1(
                                              maxWait: 2);
                                        },
                                        child: ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: containerVar.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 2.0),
                                          itemBuilder:
                                              (context, containerVarIndex) {
                                            final containerVarItem =
                                                containerVar[containerVarIndex];
                                            return Stack(
                                              children: [
                                                wrapWithModel(
                                                  model: _model.cardVagasModels1
                                                      .getModel(
                                                    containerVarItem.vagasId!,
                                                    containerVarIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: CardVagasWidget(
                                                    key: Key(
                                                      'Keyk5u_${containerVarItem.vagasId!}',
                                                    ),
                                                    specialty: containerVarItem
                                                        .especialidadeNome,
                                                    value: formatNumber(
                                                      containerVarItem
                                                          .vagasValor,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .commaDecimal,
                                                      currency: 'R\$',
                                                    ),
                                                    date: dateTimeFormat(
                                                      "dd/MM",
                                                      containerVarItem
                                                          .vagasData,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    datecount: dateTimeFormat(
                                                      "relative",
                                                      containerVarItem
                                                          .vagasCreatedate,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    shift: containerVarItem
                                                        .periodoNome,
                                                    type: containerVarItem
                                                        .tipoNome,
                                                    hospital: containerVarItem
                                                        .hospitalNome,
                                                    vaga: containerVarItem
                                                        .vagasId,
                                                    showPay: false,
                                                    avatarHospital:
                                                        containerVarItem
                                                            .hospitalAvatar,
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    if (_model
                                                        .isBottomSheetLoading) {
                                                      return;
                                                    }

                                                    _model.isBottomSheetLoading =
                                                        true;
                                                    safeSetState(() {});
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
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
                                                                  containerVarItem
                                                                      .especialidadeNome,
                                                              value: containerVarItem
                                                                  .vagasValor
                                                                  ?.toDouble(),
                                                              hospital:
                                                                  containerVarItem
                                                                      .hospitalNome,
                                                              date:
                                                                  containerVarItem
                                                                      .vagasData,
                                                              datecreated:
                                                                  containerVarItem
                                                                      .vagasCreatedate,
                                                              startTime:
                                                                  containerVarItem
                                                                      .vagasHorainicio
                                                                      ?.time,
                                                              endTime:
                                                                  containerVarItem
                                                                      .vagasHorafim
                                                                      ?.time,
                                                              shift: containerVarItem
                                                                  .periodoNome,
                                                              type:
                                                                  containerVarItem
                                                                      .tipoNome,
                                                              lat: containerVarItem
                                                                  .hospitalLat,
                                                              lon: containerVarItem
                                                                  .hospitalLog,
                                                              address:
                                                                  containerVarItem
                                                                      .hospitalEnd,
                                                              vagaID:
                                                                  containerVarItem
                                                                      .vagasId,
                                                              contractor:
                                                                  containerVarItem
                                                                      .grupoNome,
                                                              contractorName:
                                                                  containerVarItem
                                                                      .escalistaNome,
                                                              contractorPhone:
                                                                  containerVarItem
                                                                      .escalistaTelefone,
                                                              contractorEmail:
                                                                  containerVarItem
                                                                      .escalistaEmail,
                                                              buttonVis: true,
                                                              payday: containerVarItem
                                                                  .vagasDatapagamento,
                                                              payment:
                                                                  containerVarItem
                                                                      .vagasFormarecebimento,
                                                              avatarHospital:
                                                                  containerVarItem
                                                                      .hospitalAvatar,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    _model.isBottomSheetLoading =
                                                        false;
                                                    safeSetState(() {});
                                                    return;
                                                  },
                                                  text: '',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 110.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0x00A369ED),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
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
                                      final containerVar =
                                          containerVagasCompletoRowList
                                              .where((e) =>
                                                  e.especialidadeNome ==
                                                  explorarEspecialidadesRowList
                                                      .elementAtOrNull(
                                                          _model.dropDownValue!)
                                                      ?.especialidadeNome)
                                              .toList();

                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          safeSetState(() =>
                                              _model.requestCompleter2 = null);
                                          await _model.waitForRequestCompleted2(
                                              maxWait: 2);
                                          safeSetState(() =>
                                              _model.requestCompleter1 = null);
                                          await _model.waitForRequestCompleted1(
                                              maxWait: 2);
                                        },
                                        child: ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: containerVar.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 2.0),
                                          itemBuilder:
                                              (context, containerVarIndex) {
                                            final containerVarItem =
                                                containerVar[containerVarIndex];
                                            return Stack(
                                              children: [
                                                wrapWithModel(
                                                  model: _model.cardVagasModels2
                                                      .getModel(
                                                    containerVarItem.vagasId!,
                                                    containerVarIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: CardVagasWidget(
                                                    key: Key(
                                                      'Keyukk_${containerVarItem.vagasId!}',
                                                    ),
                                                    specialty: containerVarItem
                                                        .especialidadeNome,
                                                    value: formatNumber(
                                                      containerVarItem
                                                          .vagasValor,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .commaDecimal,
                                                      currency: 'R\$',
                                                    ),
                                                    date: dateTimeFormat(
                                                      "dd/MM",
                                                      containerVarItem
                                                          .vagasData,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    datecount: dateTimeFormat(
                                                      "relative",
                                                      containerVarItem
                                                          .vagasCreatedate,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    shift: containerVarItem
                                                        .periodoNome,
                                                    type: containerVarItem
                                                        .tipoNome,
                                                    hospital: containerVarItem
                                                        .hospitalNome,
                                                    vaga: containerVarItem
                                                        .vagasId,
                                                    showPay: false,
                                                    avatarHospital:
                                                        containerVarItem
                                                            .hospitalAvatar,
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    if (_model
                                                        .isBottomSheetLoading) {
                                                      return;
                                                    }

                                                    _model.isBottomSheetLoading =
                                                        true;
                                                    safeSetState(() {});
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
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
                                                                  containerVarItem
                                                                      .especialidadeNome,
                                                              value: containerVarItem
                                                                  .vagasValor
                                                                  ?.toDouble(),
                                                              hospital:
                                                                  containerVarItem
                                                                      .hospitalNome,
                                                              date:
                                                                  containerVarItem
                                                                      .vagasData,
                                                              datecreated:
                                                                  containerVarItem
                                                                      .vagasCreatedate,
                                                              startTime:
                                                                  containerVarItem
                                                                      .vagasHorainicio
                                                                      ?.time,
                                                              endTime:
                                                                  containerVarItem
                                                                      .vagasHorafim
                                                                      ?.time,
                                                              shift: containerVarItem
                                                                  .periodoNome,
                                                              type:
                                                                  containerVarItem
                                                                      .tipoNome,
                                                              lat: containerVarItem
                                                                  .hospitalLat,
                                                              lon: containerVarItem
                                                                  .hospitalLog,
                                                              address:
                                                                  containerVarItem
                                                                      .hospitalEnd,
                                                              vagaID:
                                                                  containerVarItem
                                                                      .vagasId,
                                                              contractor:
                                                                  containerVarItem
                                                                      .grupoNome,
                                                              contractorName:
                                                                  containerVarItem
                                                                      .escalistaNome,
                                                              contractorPhone:
                                                                  containerVarItem
                                                                      .escalistaTelefone,
                                                              contractorEmail:
                                                                  containerVarItem
                                                                      .escalistaEmail,
                                                              buttonVis: true,
                                                              payday: containerVarItem
                                                                  .vagasDatapagamento,
                                                              payment:
                                                                  containerVarItem
                                                                      .vagasFormarecebimento,
                                                              avatarHospital:
                                                                  containerVarItem
                                                                      .hospitalAvatar,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    _model.isBottomSheetLoading =
                                                        false;
                                                    safeSetState(() {});
                                                    return;
                                                  },
                                                  text: '',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 110.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0x00A369ED),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
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
                        );
                      },
                    ),
                  ),
                ].divide(SizedBox(height: FFAppConstants.Gap)),
              ),
            ),
          ),
        );
      },
    );
  }
}
