import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'positive_informative_box_model.dart';
export 'positive_informative_box_model.dart';

class PositiveInformativeBoxWidget extends StatefulWidget {
  const PositiveInformativeBoxWidget({
    super.key,
    required this.title,
    required this.body,
  });

  final String? title;
  final String? body;

  @override
  State<PositiveInformativeBoxWidget> createState() =>
      _PositiveInformativeBoxWidgetState();
}

class _PositiveInformativeBoxWidgetState
    extends State<PositiveInformativeBoxWidget> {
  late PositiveInformativeBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PositiveInformativeBoxModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POSITIVE_INFORMATIVE_BOX_PositiveInforma');
      logFirebaseEvent('PositiveInformativeBox_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 5000,
        ),
      );
      logFirebaseEvent('PositiveInformativeBox_dismiss_dialog');
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
          logFirebaseEvent('POSITIVE_INFORMATIVE_BOX_Container_q78sd');
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
          child: Stack(
            children: [
              Padding(
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
                              'POSITIVE_INFORMATIVE_BOX_Icon_bst2p20a_O');
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
                          borderRadius: BorderRadius.circular(60.0),
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
                  ].divide(SizedBox(height: FFAppConstants.doubleGap)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.8),
                child: Lottie.asset(
                  'assets/jsons/hqgEwGyZ5r.json',
                  width: 365.5,
                  height: MediaQuery.sizeOf(context).height * 0.177,
                  fit: BoxFit.fitHeight,
                  animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
