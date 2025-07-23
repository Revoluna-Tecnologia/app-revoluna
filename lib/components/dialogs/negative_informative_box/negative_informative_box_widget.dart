import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'negative_informative_box_model.dart';
export 'negative_informative_box_model.dart';

class NegativeInformativeBoxWidget extends StatefulWidget {
  const NegativeInformativeBoxWidget({
    super.key,
    required this.title,
    required this.body,
  });

  final String? title;
  final String? body;

  @override
  State<NegativeInformativeBoxWidget> createState() =>
      _NegativeInformativeBoxWidgetState();
}

class _NegativeInformativeBoxWidgetState
    extends State<NegativeInformativeBoxWidget> {
  late NegativeInformativeBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NegativeInformativeBoxModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NEGATIVE_INFORMATIVE_BOX_NegativeInforma');
      logFirebaseEvent('NegativeInformativeBox_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 5000,
        ),
      );
      logFirebaseEvent('NegativeInformativeBox_dismiss_dialog');
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('NEGATIVE_INFORMATIVE_BOX_Container_3jqsh');
          logFirebaseEvent('Container_dismiss_dialog');
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.863,
          height: MediaQuery.sizeOf(context).height * 0.275,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              FFAppConstants.borderM,
              0.0,
            )),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.0,
                valueOrDefault<double>(
                  FFAppConstants.Gap,
                  0.0,
                ),
                0.0,
                valueOrDefault<double>(
                  FFAppConstants.doubleGap,
                  0.0,
                )),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.9, -0.9),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'NEGATIVE_INFORMATIVE_BOX_Icon_0fns7j8r_O');
                      logFirebaseEvent('Icon_dismiss_dialog');
                      Navigator.pop(context);
                    },
                    child: Icon(
                      FFIcons.kx,
                      color: FlutterFlowTheme.of(context).tertiary,
                      size: 20.0,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.2),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.19,
                    height: MediaQuery.sizeOf(context).height * 0.085,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: Icon(
                      FFIcons.kx,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 36.0,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -0.6),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.title,
                          '[title]',
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
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
                    Align(
                      alignment: AlignmentDirectional(0.0, -0.6),
                      child: Padding(
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
                        child: Text(
                          valueOrDefault<String>(
                            widget!.body,
                            '[body]',
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
              ].divide(SizedBox(height: FFAppConstants.doubleGap)),
            ),
          ),
        ),
      ),
    );
  }
}
