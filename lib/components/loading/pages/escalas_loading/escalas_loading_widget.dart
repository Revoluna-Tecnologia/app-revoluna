import '/components/loading/calendar_loading/calendar_loading_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'escalas_loading_model.dart';
export 'escalas_loading_model.dart';

class EscalasLoadingWidget extends StatefulWidget {
  const EscalasLoadingWidget({super.key});

  @override
  State<EscalasLoadingWidget> createState() => _EscalasLoadingWidgetState();
}

class _EscalasLoadingWidgetState extends State<EscalasLoadingWidget> {
  late EscalasLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscalasLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SafeArea(
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
                  valueOrDefault<double>(
                    FFAppConstants.doubleGap,
                    0.0,
                  ),
                  valueOrDefault<double>(
                    FFAppConstants.doubleGap,
                    0.0,
                  ),
                  valueOrDefault<double>(
                    FFAppConstants.Gap,
                    0.0,
                  )),
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.07,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Hero(
                      tag: valueOrDefault<String>(
                        FFAppState().profilepicture,
                        'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/profilepictures//Avatar.png',
                      ),
                      transitionOnUserGestures: true,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.145,
                        height: MediaQuery.sizeOf(context).width * 0.145,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          valueOrDefault<String>(
                            FFAppState().profilepicture,
                            'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/profilepictures//Avatar.png',
                          ),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.19,
                            height: MediaQuery.sizeOf(context).height * 0.02,
                            decoration: BoxDecoration(),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: MediaQuery.sizeOf(context).height * 0.025,
                            decoration: BoxDecoration(),
                          ),
                        ].divide(SizedBox(height: 2.0)),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 60.0,
                      buttonSize: 52.0,
                      icon: Icon(
                        Icons.menu_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 40.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ].divide(SizedBox(width: FFAppConstants.doubleGap)),
                ),
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
                          'Minhas escalas',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.geologica(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
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
                  wrapWithModel(
                    model: _model.calendarLoadingModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CalendarLoadingWidget(),
                  ),
                ].addToEnd(SizedBox(height: FFAppConstants.Gap)),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.04,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                FFAppConstants.doubleGap,
                                0.0,
                              ),
                              0.0,
                              0.0,
                              0.0),
                          child: Text(
                            'Carregando...',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.geologica(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.04,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    FFAppConstants.doubleGap,
                                    0.0,
                                  ),
                                  0.0,
                                  0.0,
                                  0.0),
                              child: Text(
                                'Carrengado...',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.geologica(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: FFAppConstants.halfGap)),
                      ),
                    ]
                        .addToStart(SizedBox(height: FFAppConstants.Gap))
                        .addToEnd(SizedBox(height: 2.0)),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: FFAppConstants.Gap)),
        ),
      ),
    );
  }
}
