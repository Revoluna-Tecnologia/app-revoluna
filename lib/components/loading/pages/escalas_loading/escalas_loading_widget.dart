import '/components/loading/calendar_loading/calendar_loading_widget.dart';
import '/components/loading/escala_list_loading/escala_list_loading_widget.dart';
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
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Minha escala',
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
              child: wrapWithModel(
                model: _model.escalaListLoadingModel,
                updateCallback: () => safeSetState(() {}),
                child: EscalaListLoadingWidget(),
              ),
            ),
          ].divide(SizedBox(height: FFAppConstants.Gap)),
        ),
      ),
    );
  }
}
