import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/back_top_bar/back_top_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'cadastro2_widget.dart' show Cadastro2Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class Cadastro2Model extends FlutterFlowModel<Cadastro2Widget> {
  ///  Local state fields for this page.

  Color? birthdateborder = Color(4293256677);

  Color cpfborder = Color(4293256677);

  Color crmborder = Color(4293256677);

  Color rqeborder = Color(4293256677);

  Color? specialtyborder = Color(4293256677);

  Color ufborder = Color(4293256677);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for BackTopBar component.
  late BackTopBarModel backTopBarModel;
  Stream<List<EstadosBrasilRow>>? cadastroForm2SupabaseStream;
  Stream<List<EspecialidadesRow>>? containerSupabaseStream;
  // State field(s) for BirthDate widget.
  FocusNode? birthDateFocusNode;
  TextEditingController? birthDateTextController;
  String? Function(BuildContext, String?)? birthDateTextControllerValidator;
  String? _birthDateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 10) {
      return 'Campo obrigatório';
    }
    if (val.length > 10) {
      return 'Campo obrigatório';
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

    if (val.length < 14) {
      return 'CPF inserido é inválido';
    }

    if (!RegExp('^\\d{3}\\.\\d{3}\\.\\d{3}-\\d{2}\$').hasMatch(val)) {
      return 'CPF inserido é inválido';
    }
    return null;
  }

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
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Custom Action - isValidCPF] action in Button widget.
  bool? isCpfValid;
  // Stores action output result for [Backend Call - API (getcpf)] action in Button widget.
  ApiCallResponse? getCpf;
  // Stores action output result for [Backend Call - API (getcrm)] action in Button widget.
  ApiCallResponse? getcrm;

  @override
  void initState(BuildContext context) {
    backTopBarModel = createModel(context, () => BackTopBarModel());
    birthDateTextControllerValidator = _birthDateTextControllerValidator;
    cpfTextControllerValidator = _cpfTextControllerValidator;
  }

  @override
  void dispose() {
    backTopBarModel.dispose();
    birthDateFocusNode?.dispose();
    birthDateTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    crmFocusNode?.dispose();
    crmTextController?.dispose();
  }
}
