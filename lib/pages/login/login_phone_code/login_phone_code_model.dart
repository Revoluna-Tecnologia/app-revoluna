import '/backend/api_requests/api_calls.dart';
import '/components/cadastro/back_top_bar/back_top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'login_phone_code_widget.dart' show LoginPhoneCodeWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPhoneCodeModel extends FlutterFlowModel<LoginPhoneCodeWidget> {
  ///  Local state fields for this page.

  Color? pincodeborder = Color(4280097820);

  ///  State fields for stateful widgets in this page.

  // Model for BackTopBar component.
  late BackTopBarModel backTopBarModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - otpPhoneConfirm] action in Button widget.
  bool? otpPhoneConfirm;
  // Stores action output result for [Backend Call - API (confirmSMSverify)] action in Button widget.
  ApiCallResponse? verifySMS;
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

  // Stores action output result for [Backend Call - API (sendSMSverify)] action in Button widget.
  ApiCallResponse? apiResultst3;

  @override
  void initState(BuildContext context) {
    backTopBarModel = createModel(context, () => BackTopBarModel());
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    backTopBarModel.dispose();
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    timerController.dispose();
  }
}
