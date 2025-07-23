import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'positive_dialog_box_model.dart';
export 'positive_dialog_box_model.dart';

class PositiveDialogBoxWidget extends StatefulWidget {
  const PositiveDialogBoxWidget({
    super.key,
    required this.dialog,
  });

  final String? dialog;

  @override
  State<PositiveDialogBoxWidget> createState() =>
      _PositiveDialogBoxWidgetState();
}

class _PositiveDialogBoxWidgetState extends State<PositiveDialogBoxWidget> {
  late PositiveDialogBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PositiveDialogBoxModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POSITIVE_DIALOG_BOX_PositiveDialogBox_ON');
      logFirebaseEvent('PositiveDialogBox_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 2080,
        ),
      );
      logFirebaseEvent('PositiveDialogBox_dismiss_dialog');
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
          logFirebaseEvent('POSITIVE_DIALOG_BOX_Container_i6atbjw0_O');
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
                alignment: AlignmentDirectional(0.0, -0.7),
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
                alignment: AlignmentDirectional(0.0, -0.6),
                child: Lottie.asset(
                  'assets/jsons/hqgEwGyZ5r.json',
                  width: MediaQuery.sizeOf(context).width * 0.435,
                  height: MediaQuery.sizeOf(context).height * 0.013,
                  fit: BoxFit.cover,
                  animate: true,
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
                        'POSITIVE_DIALOG_BOX_Icon_p7br781l_ON_TAP');
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
            ],
          ),
        ),
      ),
    );
  }
}
