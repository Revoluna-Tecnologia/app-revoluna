import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'login_phone_widget.dart' show LoginPhoneWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPhoneModel extends FlutterFlowModel<LoginPhoneWidget> {
  ///  Local state fields for this page.

  String? phoneOnlynumbers;

  Color? phoneborder = Color(4293256677);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dropCodigoPais widget.
  int? dropCodigoPaisValue;
  FormFieldController<int>? dropCodigoPaisValueController;
  // State field(s) for campoTelefone widget.
  FocusNode? campoTelefoneFocusNode;
  TextEditingController? campoTelefoneTextController;
  String? Function(BuildContext, String?)? campoTelefoneTextControllerValidator;
  String? _campoTelefoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (getphonenumber)] action in Button widget.
  ApiCallResponse? getphonenumber;
  // Stores action output result for [Custom Action - otpPhone] action in Button widget.
  bool? oTPcheck;
  // Stores action output result for [Backend Call - API (getIdfromphone)] action in Button widget.
  ApiCallResponse? idFromPhone;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserProfileRow>? queryUser;
  // Stores action output result for [Backend Call - API (sendSMSverify)] action in Button widget.
  ApiCallResponse? sendSMS;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserProfileRow>? queryUserGoogle;
  // Stores action output result for [Custom Action - getGoogleNames] action in Button widget.
  List<String>? googleFullName;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserProfileRow>? queryAppleUser;

  @override
  void initState(BuildContext context) {
    campoTelefoneTextControllerValidator =
        _campoTelefoneTextControllerValidator;
  }

  @override
  void dispose() {
    campoTelefoneFocusNode?.dispose();
    campoTelefoneTextController?.dispose();
  }
}
