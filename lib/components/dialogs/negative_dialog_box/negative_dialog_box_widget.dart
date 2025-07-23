import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'negative_dialog_box_model.dart';
export 'negative_dialog_box_model.dart';

class NegativeDialogBoxWidget extends StatefulWidget {
  const NegativeDialogBoxWidget({
    super.key,
    required this.dialog,
  });

  final String? dialog;

  @override
  State<NegativeDialogBoxWidget> createState() =>
      _NegativeDialogBoxWidgetState();
}

class _NegativeDialogBoxWidgetState extends State<NegativeDialogBoxWidget> {
  late NegativeDialogBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NegativeDialogBoxModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NEGATIVE_DIALOG_BOX_NegativeDialogBox_ON');
      logFirebaseEvent('NegativeDialogBox_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 2080,
        ),
      );
      logFirebaseEvent('NegativeDialogBox_dismiss_dialog');
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
          logFirebaseEvent('NEGATIVE_DIALOG_BOX_Container_10uzy9lf_O');
          logFirebaseEvent('Container_dismiss_dialog');
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.863,
          height: MediaQuery.sizeOf(context).height * 0.257,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              FFAppConstants.borderM,
              0.0,
            )),
          ),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -0.6),
                child: Text(
                  valueOrDefault<String>(
                    widget!.dialog,
                    '[dialog]',
                  ),
                  style: FlutterFlowTheme.of(context).displayMedium.override(
                        font: GoogleFonts.geologica(
                          fontWeight: FlutterFlowTheme.of(context)
                              .displayMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .displayMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .displayMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .displayMedium
                            .fontStyle,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.9, -0.9),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'NEGATIVE_DIALOG_BOX_Icon_3bviu8h5_ON_TAP');
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
            ],
          ),
        ),
      ),
    );
  }
}
