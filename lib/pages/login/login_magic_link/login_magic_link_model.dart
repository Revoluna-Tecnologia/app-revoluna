import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/back_top_bar/back_top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
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

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (listenVerifyEmail)] action in LoginMagicLink widget.
  ApiCallResponse? listenVerifyEmail;
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

  // Stores action output result for [Custom Action - otpEmailMagic] action in Button widget.
  bool? magiclinksent;
  // Stores action output result for [Backend Call - API (sendVerifyEmail)] action in Button widget.
  ApiCallResponse? sendVerifyEmail;

  @override
  void initState(BuildContext context) {
    backTopBarModel = createModel(context, () => BackTopBarModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    backTopBarModel.dispose();
    timerController.dispose();
  }
}
