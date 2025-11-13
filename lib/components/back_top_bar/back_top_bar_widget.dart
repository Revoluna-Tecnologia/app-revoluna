import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'back_top_bar_model.dart';
export 'back_top_bar_model.dart';

class BackTopBarWidget extends StatefulWidget {
  const BackTopBarWidget({
    super.key,
    this.backButton,
  });

  final Future Function()? backButton;

  @override
  State<BackTopBarWidget> createState() => _BackTopBarWidgetState();
}

class _BackTopBarWidgetState extends State<BackTopBarWidget> {
  late BackTopBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackTopBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.05,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            valueOrDefault<double>(
              FFAppConstants.Gap,
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
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 43.39,
              icon: Icon(
                FFIcons.kchevronLeft,
                color: FlutterFlowTheme.of(context).primary,
                size: 30.0,
              ),
              onPressed: () async {
                logFirebaseEvent('BACK_TOP_BAR_COMP_chevronLeft_ICN_ON_TAP');
                logFirebaseEvent('IconButton_execute_callback');
                await widget.backButton?.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
