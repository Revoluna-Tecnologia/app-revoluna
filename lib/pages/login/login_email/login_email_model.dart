import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/back_top_bar/back_top_bar_widget.dart';
import '/components/dialogs/negative_informative_box/negative_informative_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'login_email_widget.dart' show LoginEmailWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginEmailModel extends FlutterFlowModel<LoginEmailWidget> {
  ///  Local state fields for this page.

  Color? emailborder = Color(4293256677);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for BackTopBar component.
  late BackTopBarModel backTopBarModel;
  // State field(s) for E-mail widget.
  FocusNode? eMailFocusNode;
  TextEditingController? eMailTextController;
  String? Function(BuildContext, String?)? eMailTextControllerValidator;
  String? _eMailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Endereço de email inválido';
    }

    if (val.length < 6) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Endereço de email inválido';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (getIdfromEmail)] action in Button widget.
  ApiCallResponse? getemail;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserProfileRow>? queryUser;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EstadosBrasilRow>? queryEstado;
  // Stores action output result for [Backend Call - API (aretheytester)] action in Button widget.
  ApiCallResponse? isTester;
  // Stores action output result for [Custom Action - otpEmailMagic] action in Button widget.
  bool? magiclinksent;
  // Stores action output result for [Backend Call - API (sendVerifyEmail)] action in Button widget.
  ApiCallResponse? sendVerifyEmail;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserProfileRow>? queryUserGoogle;
  // Stores action output result for [Custom Action - getGoogleNames] action in Button widget.
  List<String>? googleFullName;
  // Stores action output result for [Custom Action - loginApple] action in Button widget.
  List<String>? appleData;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserProfileRow>? queryAppleUser;
  // Stores action output result for [Custom Action - launchWhatsAppChat] action in Button widget.
  bool? whatsappLoginEmail;

  @override
  void initState(BuildContext context) {
    backTopBarModel = createModel(context, () => BackTopBarModel());
    eMailTextControllerValidator = _eMailTextControllerValidator;
  }

  @override
  void dispose() {
    backTopBarModel.dispose();
    eMailFocusNode?.dispose();
    eMailTextController?.dispose();
  }
}
