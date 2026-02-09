import '/components/header/header_widget.dart';
import '/components/loading/calendar_loading/calendar_loading_widget.dart';
import '/components/loading/card_vagas_loading/card_vagas_loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_loading_model.dart';
export 'home_loading_model.dart';

class HomeLoadingWidget extends StatefulWidget {
  const HomeLoadingWidget({super.key});

  @override
  State<HomeLoadingWidget> createState() => _HomeLoadingWidgetState();
}

class _HomeLoadingWidgetState extends State<HomeLoadingWidget>
    with TickerProviderStateMixin {
  late HomeLoadingModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeLoadingModel());

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
    return SafeArea(
      child: Container(
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
              child: wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => safeSetState(() {}),
                child: HeaderWidget(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    wrapWithModel(
                      model: _model.calendarLoadingModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CalendarLoadingWidget(),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: FlutterFlowTheme.of(context).accent2,
                              size: 14.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent2,
                              ),
                              child: Text(
                                'Plantões disponíveis',
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
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
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
                          ]
                              .divide(SizedBox(width: FFAppConstants.Gap))
                              .addToStart(
                                  SizedBox(width: FFAppConstants.doubleGap))
                              .addToEnd(
                                  SizedBox(width: FFAppConstants.doubleGap)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent2,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent2,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(width: FFAppConstants.Gap))
                              .around(SizedBox(width: FFAppConstants.Gap)),
                        ),
                      ]
                          .divide(SizedBox(height: FFAppConstants.Gap))
                          .around(SizedBox(height: FFAppConstants.Gap)),
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.cardVagasLoadingModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: CardVagasLoadingWidget(),
                            ),
                            wrapWithModel(
                              model: _model.cardVagasLoadingModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: CardVagasLoadingWidget(),
                            ),
                            wrapWithModel(
                              model: _model.cardVagasLoadingModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: CardVagasLoadingWidget(),
                            ),
                            wrapWithModel(
                              model: _model.cardVagasLoadingModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: CardVagasLoadingWidget(),
                            ),
                            wrapWithModel(
                              model: _model.cardVagasLoadingModel5,
                              updateCallback: () => safeSetState(() {}),
                              child: CardVagasLoadingWidget(),
                            ),
                          ].divide(SizedBox(height: 2.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
