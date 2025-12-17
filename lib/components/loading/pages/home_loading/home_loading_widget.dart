import '/components/loading/calendar_loading/calendar_loading_widget.dart';
import '/components/loading/lista_home_loading/lista_home_loading_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_loading_model.dart';
export 'home_loading_model.dart';

class HomeLoadingWidget extends StatefulWidget {
  const HomeLoadingWidget({super.key});

  @override
  State<HomeLoadingWidget> createState() => _HomeLoadingWidgetState();
}

class _HomeLoadingWidgetState extends State<HomeLoadingWidget> {
  late HomeLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeLoadingModel());
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
                    Builder(
                      builder: (context) {
                        if (FFAppState().profilepicture != null &&
                            FFAppState().profilepicture != '') {
                          return Hero(
                            tag: FFAppState().profilepicture,
                            transitionOnUserGestures: true,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.14,
                              height: MediaQuery.sizeOf(context).width * 0.14,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                FFAppState().profilepicture,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/images/error_image.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Hero(
                            tag: 'perfilHero',
                            transitionOnUserGestures: true,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.14,
                              height: MediaQuery.sizeOf(context).width * 0.14,
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
