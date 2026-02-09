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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'initial_loading_model.dart';
export 'initial_loading_model.dart';

class InitialLoadingWidget extends StatefulWidget {
  const InitialLoadingWidget({super.key});

  @override
  State<InitialLoadingWidget> createState() => _InitialLoadingWidgetState();
}

class _InitialLoadingWidgetState extends State<InitialLoadingWidget>
    with TickerProviderStateMixin {
  late InitialLoadingModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitialLoadingModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    context.watch<FFAppState>();

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  FFAppConstants.halfGap,
                                  0.0,
                                ),
                                0.0,
                                0.0,
                                0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: SvgPicture.asset(
                                'assets/images/logo.svg',
                                width: 100.0,
                                height: 30.0,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                0.0,
                                valueOrDefault<double>(
                                  FFAppConstants.halfGap,
                                  0.0,
                                ),
                                0.0),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.05,
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Entrar',
                                        style: FlutterFlowTheme.of(context)
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
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (FFAppState().profilepicture !=
                                                  null &&
                                              FFAppState().profilepicture !=
                                                  '') {
                                            return Hero(
                                              tag: FFAppState().profilepicture,
                                              transitionOnUserGestures: true,
                                              child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  FFAppState().profilepicture,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Hero(
                                              tag: 'perfilHero',
                                              transitionOnUserGestures: true,
                                              child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Avatar.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ].divide(
                                        SizedBox(width: FFAppConstants.Gap)),
                                  ),
                                ],
                              ),
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
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(valueOrDefault<double>(
                          FFAppConstants.borderM,
                          0.0,
                        )),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent2,
                            borderRadius:
                                BorderRadius.circular(valueOrDefault<double>(
                              FFAppConstants.borderM,
                              0.0,
                            )),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!),
                    ),
                    wrapWithModel(
                      model: _model.calendarLoadingModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CalendarLoadingWidget(),
                    ),
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
                  ].divide(SizedBox(height: FFAppConstants.doubleGap)),
                ),
              ),
            ),
          ].divide(SizedBox(height: FFAppConstants.doubleGap)),
        ),
      ),
    );
  }
}
