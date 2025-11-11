import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/back_top_bar/back_top_bar_widget.dart';
import '/components/cadastro/checkemailbottom/checkemailbottom_widget.dart';
import '/components/cadastro/checkphonebottom/checkphonebottom_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'cadastro1_widget.dart' show Cadastro1Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cadastro1Model extends FlutterFlowModel<Cadastro1Widget> {
  ///  Local state fields for this page.

  Color firstnameborder = Color(4293256677);

  Color lastnameborder = Color(4293256677);

  Color emailborder = Color(4293256677);

  Color phoneborder = Color(4293256677);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for BackTopBar component.
  late BackTopBarModel backTopBarModel;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 2) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 2) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for E-mail widget.
  FocusNode? eMailFocusNode;
  TextEditingController? eMailTextController;
  String? Function(BuildContext, String?)? eMailTextControllerValidator;
  String? _eMailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Endereço de e-mail inválido';
    }
    return null;
  }

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
      return 'Número de telefone inválido';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validation;
  // Stores action output result for [Backend Call - API (getemailaddress)] action in Button widget.
  ApiCallResponse? emailInUse;
  // Stores action output result for [Backend Call - API (sendVerifyEmail)] action in Button widget.
  ApiCallResponse? sendVerifyEmail;
  // Stores action output result for [Bottom Sheet - checkemailbottom] action in Button widget.
  bool? emailchanged;
  // Stores action output result for [Backend Call - API (getphonenumber)] action in Button widget.
  ApiCallResponse? phoneInUse;
  // Stores action output result for [Backend Call - API (sendSMSverify)] action in Button widget.
  ApiCallResponse? sendSMSverify;
  // Stores action output result for [Bottom Sheet - checkphonebottom] action in Button widget.
  bool? checkphone;

  @override
  void initState(BuildContext context) {
    backTopBarModel = createModel(context, () => BackTopBarModel());
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    eMailTextControllerValidator = _eMailTextControllerValidator;
    campoTelefoneTextControllerValidator =
        _campoTelefoneTextControllerValidator;
  }

  @override
  void dispose() {
    backTopBarModel.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    eMailFocusNode?.dispose();
    eMailTextController?.dispose();

    campoTelefoneFocusNode?.dispose();
    campoTelefoneTextController?.dispose();
  }

  /// Action blocks.
  Future signupgiveup(BuildContext context) async {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
