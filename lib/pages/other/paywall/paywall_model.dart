import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'paywall_widget.dart' show PaywallWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaywallModel extends FlutterFlowModel<PaywallWidget> {
  ///  Local state fields for this component.

  bool isCandidate = false;

  bool isSaved = false;

  bool? isAnnounced = false;

  bool isApproved = false;

  bool isCheckedIn = false;

  bool isCheckedOut = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
