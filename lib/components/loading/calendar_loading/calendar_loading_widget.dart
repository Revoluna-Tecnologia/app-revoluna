import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_loading_model.dart';
export 'calendar_loading_model.dart';

class CalendarLoadingWidget extends StatefulWidget {
  const CalendarLoadingWidget({super.key});

  @override
  State<CalendarLoadingWidget> createState() => _CalendarLoadingWidgetState();
}

class _CalendarLoadingWidgetState extends State<CalendarLoadingWidget> {
  late CalendarLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.15,
            child: custom_widgets.CustomCalendar(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.15,
              weekViewEnabled: true,
              callback: () async {},
            ),
          ),
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(),
            child: Icon(
              FFIcons.kchevronDown,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
          ),
        ].addToEnd(SizedBox(height: FFAppConstants.Gap)),
      ),
    );
  }
}
