import '/components/loading/card_escala_loading/card_escala_loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'escala_list_loading_model.dart';
export 'escala_list_loading_model.dart';

class EscalaListLoadingWidget extends StatefulWidget {
  const EscalaListLoadingWidget({super.key});

  @override
  State<EscalaListLoadingWidget> createState() =>
      _EscalaListLoadingWidgetState();
}

class _EscalaListLoadingWidgetState extends State<EscalaListLoadingWidget>
    with TickerProviderStateMixin {
  late EscalaListLoadingModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscalaListLoadingModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        valueOrDefault<double>(
                          FFAppConstants.doubleGap,
                          0.0,
                        ),
                        valueOrDefault<double>(
                          FFAppConstants.Gap,
                          0.0,
                        ),
                        0.0,
                        0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.37,
                      height: MediaQuery.sizeOf(context).height * 0.02,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        valueOrDefault<double>(
                          FFAppConstants.doubleGap,
                          0.0,
                        ),
                        valueOrDefault<double>(
                          FFAppConstants.halfGap,
                          0.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          FFAppConstants.halfGap,
                          0.0,
                        )),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      height: MediaQuery.sizeOf(context).height * 0.01,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              FFAppConstants.doubleGap,
                              0.0,
                            ),
                            valueOrDefault<double>(
                              FFAppConstants.halfGap,
                              0.0,
                            ),
                            0.0,
                            valueOrDefault<double>(
                              FFAppConstants.halfGap,
                              0.0,
                            )),
                        child: Text(
                          'Hello World',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.geologica(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(height: FFAppConstants.Gap)),
        ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.cardEscalaLoadingModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: CardEscalaLoadingWidget(),
                  ),
                  wrapWithModel(
                    model: _model.cardEscalaLoadingModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: CardEscalaLoadingWidget(),
                  ),
                  wrapWithModel(
                    model: _model.cardEscalaLoadingModel3,
                    updateCallback: () => safeSetState(() {}),
                    child: CardEscalaLoadingWidget(),
                  ),
                  wrapWithModel(
                    model: _model.cardEscalaLoadingModel4,
                    updateCallback: () => safeSetState(() {}),
                    child: CardEscalaLoadingWidget(),
                  ),
                  wrapWithModel(
                    model: _model.cardEscalaLoadingModel5,
                    updateCallback: () => safeSetState(() {}),
                    child: CardEscalaLoadingWidget(),
                  ),
                  wrapWithModel(
                    model: _model.cardEscalaLoadingModel6,
                    updateCallback: () => safeSetState(() {}),
                    child: CardEscalaLoadingWidget(),
                  ),
                  wrapWithModel(
                    model: _model.cardEscalaLoadingModel7,
                    updateCallback: () => safeSetState(() {}),
                    child: CardEscalaLoadingWidget(),
                  ),
                  wrapWithModel(
                    model: _model.cardEscalaLoadingModel8,
                    updateCallback: () => safeSetState(() {}),
                    child: CardEscalaLoadingWidget(),
                  ),
                  wrapWithModel(
                    model: _model.cardEscalaLoadingModel9,
                    updateCallback: () => safeSetState(() {}),
                    child: CardEscalaLoadingWidget(),
                  ),
                ].divide(SizedBox(height: 2.0)).around(SizedBox(height: 2.0)),
              ),
            ),
          ),
        ),
      ].divide(SizedBox(height: FFAppConstants.Gap)),
    );
  }
}
