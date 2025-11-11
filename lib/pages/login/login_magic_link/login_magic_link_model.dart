import '/auth/supabase_auth/auth_util.dart';
import '/components/back_top_bar/back_top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'login_magic_link_widget.dart' show LoginMagicLinkWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginMagicLinkModel extends FlutterFlowModel<LoginMagicLinkWidget> {
  ///  Local state fields for this page.

  bool emailVerified = false;

  ///  State fields for stateful widgets in this page.

  // Model for BackTopBar component.
  late BackTopBarModel backTopBarModel;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60000;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {
    backTopBarModel = createModel(context, () => BackTopBarModel());
  }

  @override
  void dispose() {
    backTopBarModel.dispose();
    timerController.dispose();
  }
}
