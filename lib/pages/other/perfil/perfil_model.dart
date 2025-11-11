import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/back_top_bar/back_top_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'perfil_widget.dart' show PerfilWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PerfilModel extends FlutterFlowModel<PerfilWidget> {
  ///  Local state fields for this page.

  Color phoneborder = Color(4293256677);

  Color? emailborder = Color(4293256677);

  Color crmborder = Color(4293256677);

  Color cpfborder = Color(4294307327);

  Color firstnameborder = Color(4293256677);

  Color lastnameborder = Color(4293256677);

  Color birthborder = Color(4293256677);

  Color rqeborder = Color(4293256677);

  Color specialtyborder = Color(4293256677);

  Color ufborder = Color(4293256677);

  bool hasChanged = false;

  DateTime? formatedDate;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in Perfil widget.
  List<MedicosRow>? queryMedicos;
  // Model for BackTopBar component.
  late BackTopBarModel backTopBarModel;
  bool isDataUploading_uploadedPic = false;
  FFUploadedFile uploadedLocalFile_uploadedPic =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

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
  // State field(s) for BirthDate widget.
  FocusNode? birthDateFocusNode;
  TextEditingController? birthDateTextController;
  late MaskTextInputFormatter birthDateMask;
  String? Function(BuildContext, String?)? birthDateTextControllerValidator;
  String? _birthDateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 10) {
      return 'Data inválida';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for CPF widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  late MaskTextInputFormatter cpfMask;
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  String? _cpfTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^\\d{3}\\.\\d{3}\\.\\d{3}-\\d{2}\$').hasMatch(val)) {
      return 'CPF inserido é inválido';
    }
    return null;
  }

  // Stores action output result for [Custom Action - isValidCPF] action in CPF widget.
  bool? validCPF;
  // State field(s) for dropdownEstados widget.
  int? dropdownEstadosValue;
  FormFieldController<int>? dropdownEstadosValueController;
  // State field(s) for CRM widget.
  FocusNode? crmFocusNode;
  TextEditingController? crmTextController;
  String? Function(BuildContext, String?)? crmTextControllerValidator;
  // State field(s) for dropdownEspecialidades widget.
  int? dropdownEspecialidadesValue;
  FormFieldController<int>? dropdownEspecialidadesValueController;
  // State field(s) for RQE widget.
  FocusNode? rqeFocusNode;
  TextEditingController? rqeTextController;
  String? Function(BuildContext, String?)? rqeTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (deleteUser)] action in Button widget.
  ApiCallResponse? deletedUser;
  bool isDataUploading_uploadedPicSupa = false;
  FFUploadedFile uploadedLocalFile_uploadedPicSupa =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedPicSupa = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserProfileRow>? updateProfile1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<MedicosRow>? updateMedicos;

  @override
  void initState(BuildContext context) {
    backTopBarModel = createModel(context, () => BackTopBarModel());
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    eMailTextControllerValidator = _eMailTextControllerValidator;
    birthDateTextControllerValidator = _birthDateTextControllerValidator;
    cpfTextControllerValidator = _cpfTextControllerValidator;
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

    birthDateFocusNode?.dispose();
    birthDateTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    crmFocusNode?.dispose();
    crmTextController?.dispose();

    rqeFocusNode?.dispose();
    rqeTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
