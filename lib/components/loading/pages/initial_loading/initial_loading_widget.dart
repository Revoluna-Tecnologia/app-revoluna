import '/components/loading/banner_loading/banner_loading_widget.dart';
import '/components/loading/calendar_loading/calendar_loading_widget.dart';
import '/components/loading/lista_home_loading/lista_home_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
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

class _InitialLoadingWidgetState extends State<InitialLoadingWidget> {
  late InitialLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitialLoadingModel());
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
                      child: wrapWithModel(
                        model: _model.bannerLoadingModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BannerLoadingWidget(),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.calendarLoadingModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CalendarLoadingWidget(),
                    ),
                    wrapWithModel(
                      model: _model.listaHomeLoadingModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ListaHomeLoadingWidget(),
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
