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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'cadastro2_model.dart';
export 'cadastro2_model.dart';

class Cadastro2Widget extends StatefulWidget {
  const Cadastro2Widget({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.areacodeIndex,
    required this.termsAccept,
    this.gender,
    required this.camefrom,
  });

  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final int? areacodeIndex;
  final bool? termsAccept;
  final String? gender;
  final String? camefrom;

  static String routeName = 'Cadastro2';
  static String routePath = '/cadastro2';

  @override
  State<Cadastro2Widget> createState() => _Cadastro2WidgetState();
}

class _Cadastro2WidgetState extends State<Cadastro2Widget> {
  late Cadastro2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Cadastro2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Cadastro2'});
    _model.birthDateTextController ??= TextEditingController(text: '');
    _model.birthDateFocusNode ??= FocusNode();
    _model.birthDateFocusNode!.addListener(
      () async {
        logFirebaseEvent('CADASTRO2_PAGE_BirthDate_ON_FOCUS_CHANGE');
        if (_model.birthDateTextController.text != '') {
          logFirebaseEvent('BirthDate_update_page_state');
          _model.birthdateborder = FlutterFlowTheme.of(context).primaryText;
          safeSetState(() {});
          return;
        } else {
          logFirebaseEvent('BirthDate_update_page_state');
          _model.birthdateborder = FlutterFlowTheme.of(context).accent2;
          safeSetState(() {});
          return;
        }
      },
    );
    _model.cpfTextController ??= TextEditingController(text: '');
    _model.cpfFocusNode ??= FocusNode();
    _model.cpfFocusNode!.addListener(() => safeSetState(() {}));
    _model.cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
    _model.crmTextController ??= TextEditingController(text: '');
    _model.crmFocusNode ??= FocusNode();
    _model.crmFocusNode!.addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.backTopBarModel,
                updateCallback: () => safeSetState(() {}),
                child: BackTopBarWidget(
                  backButton: () async {
                    logFirebaseEvent('CADASTRO2_Container_v2h7p89w_CALLBACK');
                    logFirebaseEvent('BackTopBar_navigate_back');
                    context.safePop();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      FFAppConstants.doubleGap,
                      0.0,
                    ),
                    0.0,
                    valueOrDefault<double>(
                      FFAppConstants.doubleGap,
                      0.0,
                    ),
                    0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        valueOrDefault<double>(
                          FFAppConstants.halfGap,
                          0.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          FFAppConstants.halfGap,
                          0.0,
                        ),
                        0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.07,
                            60.0,
                          ),
                          height: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.07,
                            60.0,
                          ),
                          child: custom_widgets.CircularProgressText(
                            width: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.07,
                              60.0,
                            ),
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.07,
                              60.0,
                            ),
                            progressValue: 0.67,
                            size: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.07,
                              60.0,
                            ),
                            progressColor:
                                FlutterFlowTheme.of(context).tertiary,
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent2,
                            strokeWidth: 6.0,
                            displayText: '2/3',
                            animationDuration: 1000.0,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dados pessoais',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.geologica(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              'Próxima: foto de perfil',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.geologica(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(width: FFAppConstants.doubleGap)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        FFAppConstants.doubleGap,
                        0.0,
                      ),
                      0.0,
                      valueOrDefault<double>(
                        FFAppConstants.doubleGap,
                        0.0,
                      ),
                      0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder<List<EstadosBrasilRow>>(
                          stream: FFAppState().estadosCadastro(
                            requestFn: () =>
                                _model.cadastroForm2SupabaseStream ??= SupaFlow
                                    .client
                                    .from("estadosBrasil")
                                    .stream(primaryKey: [
                              'id'
                            ]).map((list) => list
                                        .map((item) => EstadosBrasilRow(item))
                                        .toList()),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<EstadosBrasilRow>
                                cadastroForm2EstadosBrasilRowList =
                                snapshot.data!;

                            return Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: StreamBuilder<List<EspecialidadesRow>>(
                                stream: FFAppState().especialidades(
                                  requestFn: () =>
                                      _model.containerSupabaseStream ??=
                                          SupaFlow.client
                                              .from("especialidades")
                                              .stream(primaryKey: [
                                    'especialidade_id'
                                  ]).map((list) => list
                                                  .map((item) =>
                                                      EspecialidadesRow(item))
                                                  .toList()),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<EspecialidadesRow>
                                      containerEspecialidadesRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      FFAppConstants.Gap,
                                                      0.0,
                                                    ),
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      FFAppConstants.Gap,
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Nascimento: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: '*',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                    Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .birthDateTextController,
                                                            focusNode: _model
                                                                .birthDateFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.birthDateTextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      0),
                                                              () async {
                                                                logFirebaseEvent(
                                                                    'CADASTRO2_BirthDate_ON_TEXTFIELD_CHANGE');
                                                                if (_model
                                                                        .birthDateTextController
                                                                        .text !=
                                                                    '') {
                                                                  logFirebaseEvent(
                                                                      'BirthDate_update_page_state');
                                                                  _model.birthdateborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'BirthDate_update_page_state');
                                                                  _model.birthdateborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              },
                                                            ),
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              logFirebaseEvent(
                                                                  'CADASTRO2_BirthDate_ON_TEXTFIELD_SUBMIT');
                                                              if (_model
                                                                      .birthDateTextController
                                                                      .text !=
                                                                  '') {
                                                                logFirebaseEvent(
                                                                    'BirthDate_update_page_state');
                                                                _model.birthdateborder =
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText;
                                                                safeSetState(
                                                                    () {});
                                                                return;
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'BirthDate_update_page_state');
                                                                _model.birthdateborder =
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2;
                                                                safeSetState(
                                                                    () {});
                                                                return;
                                                              }
                                                            },
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            readOnly: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              alignLabelWithHint:
                                                                  false,
                                                              hintText:
                                                                  'Selecione uma data',
                                                              errorStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: _model
                                                                      .birthdateborder!,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              prefixIcon: Icon(
                                                                Icons
                                                                    .calendar_month_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                size: 20.0,
                                                              ),
                                                              suffixIcon: _model
                                                                      .birthDateTextController!
                                                                      .text
                                                                      .isNotEmpty
                                                                  ? InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        _model
                                                                            .birthDateTextController
                                                                            ?.clear();
                                                                        logFirebaseEvent(
                                                                            'CADASTRO2_BirthDate_ON_TEXTFIELD_CHANGE');
                                                                        if (_model.birthDateTextController.text !=
                                                                            '') {
                                                                          logFirebaseEvent(
                                                                              'BirthDate_update_page_state');
                                                                          _model.birthdateborder =
                                                                              FlutterFlowTheme.of(context).primaryText;
                                                                          safeSetState(
                                                                              () {});
                                                                          return;
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'BirthDate_update_page_state');
                                                                          _model.birthdateborder =
                                                                              FlutterFlowTheme.of(context).accent2;
                                                                          safeSetState(
                                                                              () {});
                                                                          return;
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .clear,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        size:
                                                                            14.0,
                                                                      ),
                                                                    )
                                                                  : null,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .datetime,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .birthDateTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'CADASTRO2_PAGE_Container_47412fr2_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Container_date_time_picker');
                                                            await showModalBottomSheet<
                                                                    bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  final _datePickedCupertinoTheme =
                                                                      CupertinoTheme.of(
                                                                          context);
                                                                  return Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        3,
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                    child:
                                                                        CupertinoTheme(
                                                                      data: _datePickedCupertinoTheme
                                                                          .copyWith(
                                                                        textTheme: _datePickedCupertinoTheme
                                                                            .textTheme
                                                                            .copyWith(
                                                                          dateTimePickerTextStyle: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .override(
                                                                                font: GoogleFonts.geologica(
                                                                                  fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          CupertinoDatePicker(
                                                                        mode: CupertinoDatePickerMode
                                                                            .date,
                                                                        minimumDate:
                                                                            (DateTime.fromMicrosecondsSinceEpoch(-2208978000000000) ??
                                                                                DateTime(1900)),
                                                                        initialDateTime:
                                                                            functions.eighteenYearsAgo(),
                                                                        maximumDate:
                                                                            (functions.eighteenYearsAgo() ??
                                                                                DateTime(2050)),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).accent2,
                                                                        use24hFormat:
                                                                            false,
                                                                        onDateTimeChanged:
                                                                            (newDateTime) =>
                                                                                safeSetState(() {
                                                                          _model.datePicked =
                                                                              newDateTime;
                                                                        }),
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                            logFirebaseEvent(
                                                                'Container_set_form_field');
                                                            safeSetState(() {
                                                              _model.birthDateTextController
                                                                      ?.text =
                                                                  dateTimeFormat(
                                                                "dd/MM/yyyy",
                                                                _model
                                                                    .datePicked,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              );
                                                              _model
                                                                  .birthDateFocusNode
                                                                  ?.requestFocus();
                                                              WidgetsBinding
                                                                  .instance
                                                                  .addPostFrameCallback(
                                                                      (_) {
                                                                _model.birthDateTextController
                                                                        ?.selection =
                                                                    TextSelection
                                                                        .collapsed(
                                                                  offset: _model
                                                                      .birthDateTextController!
                                                                      .text
                                                                      .length,
                                                                );
                                                              });
                                                            });
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            _model.birthdateborder =
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText;
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.751,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.05,
                                                            decoration:
                                                                BoxDecoration(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(SizedBox(
                                                      height:
                                                          FFAppConstants.Gap)),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'CPF: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: '*',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .cpfTextController,
                                                            focusNode: _model
                                                                .cpfFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.cpfTextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      0),
                                                              () async {
                                                                logFirebaseEvent(
                                                                    'CADASTRO2_PAGE_CPF_ON_TEXTFIELD_CHANGE');
                                                                if (_model
                                                                        .cpfTextController
                                                                        .text !=
                                                                    '') {
                                                                  logFirebaseEvent(
                                                                      'CPF_update_page_state');
                                                                  _model.cpfborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'CPF_update_page_state');
                                                                  _model.cpfborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              alignLabelWithHint:
                                                                  false,
                                                              hintText:
                                                                  'Somente números',
                                                              errorStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: _model
                                                                      .cpfborder,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              suffixIcon: _model
                                                                      .cpfTextController!
                                                                      .text
                                                                      .isNotEmpty
                                                                  ? InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        _model
                                                                            .cpfTextController
                                                                            ?.clear();
                                                                        logFirebaseEvent(
                                                                            'CADASTRO2_PAGE_CPF_ON_TEXTFIELD_CHANGE');
                                                                        if (_model.cpfTextController.text !=
                                                                            '') {
                                                                          logFirebaseEvent(
                                                                              'CPF_update_page_state');
                                                                          _model.cpfborder =
                                                                              FlutterFlowTheme.of(context).primaryText;
                                                                          safeSetState(
                                                                              () {});
                                                                          return;
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'CPF_update_page_state');
                                                                          _model.cpfborder =
                                                                              FlutterFlowTheme.of(context).accent2;
                                                                          safeSetState(
                                                                              () {});
                                                                          return;
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .clear,
                                                                        color: (_model.cpfFocusNode?.hasFocus ??
                                                                                false)
                                                                            ? FlutterFlowTheme.of(context).accent3
                                                                            : FlutterFlowTheme.of(context).primaryBackground,
                                                                        size:
                                                                            14.0,
                                                                      ),
                                                                    )
                                                                  : null,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .cpfTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              _model.cpfMask
                                                            ],
                                                          ),
                                                        ),
                                                        if (_model.cpfborder ==
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              'CPF inserido é inválido',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .geologica(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                      ].divide(SizedBox(
                                                          height: FFAppConstants
                                                              .halfGap)),
                                                    ),
                                                  ].divide(SizedBox(
                                                      height:
                                                          FFAppConstants.Gap)),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'CRM: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: '*',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                    FlutterFlowDropDown<int>(
                                                      controller: _model
                                                              .dropdownEstadosValueController ??=
                                                          FormFieldController<
                                                              int>(null),
                                                      options: List<int>.from(
                                                          cadastroForm2EstadosBrasilRowList
                                                              .map((e) => e.id)
                                                              .toList()),
                                                      optionLabels:
                                                          cadastroForm2EstadosBrasilRowList
                                                              .map((e) =>
                                                                  e.lista)
                                                              .withoutNulls
                                                              .toList(),
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .dropdownEstadosValue =
                                                            val);
                                                        logFirebaseEvent(
                                                            'CADASTRO2_dropdownEstados_ON_FORM_WIDGET');
                                                        logFirebaseEvent(
                                                            'dropdownEstados_update_page_state');
                                                        _model.ufborder =
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText;
                                                        safeSetState(() {});
                                                      },
                                                      width: double.infinity,
                                                      maxHeight:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.3,
                                                      searchHintTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                        font: GoogleFonts
                                                            .geologica(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                        shadows: [
                                                          Shadow(
                                                            color: Color(
                                                                0x26A369ED),
                                                            offset: Offset(
                                                                0.0, 0.0),
                                                            blurRadius: 5.0,
                                                          )
                                                        ],
                                                      ),
                                                      searchTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .geologica(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                        font: GoogleFonts
                                                            .geologica(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        shadows: [
                                                          Shadow(
                                                            color: Color(
                                                                0x26A369ED),
                                                            offset: Offset(
                                                                0.0, 0.0),
                                                            blurRadius: 5.0,
                                                          )
                                                        ],
                                                      ),
                                                      hintText: _model
                                                                  .checkboxValue ==
                                                              true
                                                          ? 'Não se aplica'
                                                          : 'Selecione seu estado',
                                                      searchHintText:
                                                          'Pesquisar...',
                                                      searchCursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      icon: Icon(
                                                        FFIcons.kchevronDown,
                                                        color: _model
                                                                    .checkboxValue ==
                                                                true
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: _model
                                                                  .checkboxValue ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      elevation: 2.0,
                                                      borderColor: _model
                                                                  .checkboxValue ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2
                                                          : _model.ufborder,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          FFAppConstants
                                                              .borderS,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .Gap,
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .Gap,
                                                                    0.0,
                                                                  ),
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      disabled: _model
                                                              .checkboxValue ==
                                                          true,
                                                      isOverButton: true,
                                                      isSearchable: true,
                                                      isMultiSelect: false,
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .crmTextController,
                                                            focusNode: _model
                                                                .crmFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.crmTextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      0),
                                                              () async {
                                                                logFirebaseEvent(
                                                                    'CADASTRO2_PAGE_CRM_ON_TEXTFIELD_CHANGE');
                                                                if (_model
                                                                        .crmTextController
                                                                        .text !=
                                                                    '') {
                                                                  logFirebaseEvent(
                                                                      'CRM_update_page_state');
                                                                  _model.crmborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'CRM_update_page_state');
                                                                  _model.crmborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            readOnly: _model
                                                                    .checkboxValue ==
                                                                true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              alignLabelWithHint:
                                                                  false,
                                                              hintText: _model
                                                                          .checkboxValue ==
                                                                      true
                                                                  ? 'Não se aplica'
                                                                  : 'Somente números',
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: _model
                                                                      .crmborder,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: _model
                                                                              .checkboxValue ==
                                                                          true
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              filled: true,
                                                              fillColor: _model
                                                                          .checkboxValue ==
                                                                      true
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              suffixIcon: _model
                                                                      .crmTextController!
                                                                      .text
                                                                      .isNotEmpty
                                                                  ? InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        _model
                                                                            .crmTextController
                                                                            ?.clear();
                                                                        logFirebaseEvent(
                                                                            'CADASTRO2_PAGE_CRM_ON_TEXTFIELD_CHANGE');
                                                                        if (_model.crmTextController.text !=
                                                                            '') {
                                                                          logFirebaseEvent(
                                                                              'CRM_update_page_state');
                                                                          _model.crmborder =
                                                                              FlutterFlowTheme.of(context).primaryText;
                                                                          safeSetState(
                                                                              () {});
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'CRM_update_page_state');
                                                                          _model.crmborder =
                                                                              FlutterFlowTheme.of(context).accent2;
                                                                          safeSetState(
                                                                              () {});
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .clear,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        size:
                                                                            14.0,
                                                                      ),
                                                                    )
                                                                  : null,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: _model
                                                                              .checkboxValue ==
                                                                          true
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                            maxLines: null,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .crmTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '[0-9]'))
                                                            ],
                                                          ),
                                                        ),
                                                        if (_model.crmborder ==
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              'CRM inserido é inválido',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .geologica(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                      ].divide(SizedBox(
                                                          height: FFAppConstants
                                                              .halfGap)),
                                                    ),
                                                  ].divide(SizedBox(
                                                      height:
                                                          FFAppConstants.Gap)),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Especialidade: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                    FlutterFlowDropDown<int>(
                                                      controller: _model
                                                              .dropdownEspecialidadesValueController ??=
                                                          FormFieldController<
                                                              int>(null),
                                                      options: List<int>.from(
                                                          containerEspecialidadesRowList
                                                              .map((e) => e
                                                                  .especialidadeIndex)
                                                              .withoutNulls
                                                              .toList()),
                                                      optionLabels:
                                                          containerEspecialidadesRowList
                                                              .map((e) => e
                                                                  .especialidadeNome)
                                                              .withoutNulls
                                                              .toList(),
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .dropdownEspecialidadesValue =
                                                            val);
                                                        logFirebaseEvent(
                                                            'CADASTRO2_dropdownEspecialidades_ON_FORM');
                                                        logFirebaseEvent(
                                                            'dropdownEspecialidades_update_page_state');
                                                        _model.specialtyborder =
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText;
                                                        safeSetState(() {});
                                                      },
                                                      width: double.infinity,
                                                      maxHeight:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.25,
                                                      searchHintTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                        font: GoogleFonts
                                                            .geologica(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                        shadows: [
                                                          Shadow(
                                                            color: Color(
                                                                0x26A369ED),
                                                            offset: Offset(
                                                                0.0, 0.0),
                                                            blurRadius: 5.0,
                                                          )
                                                        ],
                                                      ),
                                                      searchTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .geologica(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                        font: GoogleFonts
                                                            .geologica(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        shadows: [
                                                          Shadow(
                                                            color: Color(
                                                                0x26A369ED),
                                                            offset: Offset(
                                                                0.0, 0.0),
                                                            blurRadius: 5.0,
                                                          )
                                                        ],
                                                      ),
                                                      hintText:
                                                          'Selecione sua especialidade',
                                                      searchHintText:
                                                          'Pesquisar...',
                                                      searchCursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      icon: Icon(
                                                        FFIcons.kchevronDown,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      elevation: 2.0,
                                                      borderColor: _model
                                                          .specialtyborder!,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          FFAppConstants
                                                              .borderS,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .Gap,
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .Gap,
                                                                    0.0,
                                                                  ),
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: true,
                                                      isSearchable: true,
                                                      isMultiSelect: false,
                                                    ),
                                                  ].divide(SizedBox(
                                                      height:
                                                          FFAppConstants.Gap)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Sou estudante de medicina',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .geologica(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .checkboxValue ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.checkboxValue =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'CADASTRO2_Checkbox_22du1d07_ON_TOGGLE_ON');
                                                            logFirebaseEvent(
                                                                'Checkbox_reset_form_fields');
                                                            safeSetState(() {
                                                              _model
                                                                  .dropdownEstadosValueController
                                                                  ?.reset();
                                                            });
                                                            logFirebaseEvent(
                                                                'Checkbox_reset_form_fields');
                                                            safeSetState(() {
                                                              _model
                                                                  .crmTextController
                                                                  ?.text = '';
                                                            });
                                                          }
                                                        },
                                                        side: (FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate !=
                                                                null)
                                                            ? BorderSide(
                                                                width: 2,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate!,
                                                              )
                                                            : null,
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        checkColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    ),
                                                  ].divide(SizedBox(
                                                      width:
                                                          FFAppConstants.Gap)),
                                                ),
                                                Text(
                                                  '* Campos obrigatórios',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .geologica(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ]
                                                  .divide(SizedBox(
                                                      height: FFAppConstants
                                                          .doubleGap))
                                                  .around(SizedBox(
                                                      height: FFAppConstants
                                                          .doubleGap)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    0.0,
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      FFAppConstants.doubleGap,
                                                      0.0,
                                                    )),
                                            child: FFButtonWidget(
                                              onPressed:
                                                  (((_model.birthDateTextController.text == null || _model.birthDateTextController.text == '') ||
                                                              (_model.cpfTextController.text ==
                                                                      null ||
                                                                  _model.cpfTextController.text ==
                                                                      '')) ||
                                                          ((_model.birthdateborder ==
                                                                  FlutterFlowTheme.of(context)
                                                                      .error) ||
                                                              (_model.cpfborder ==
                                                                  FlutterFlowTheme.of(context)
                                                                      .error) ||
                                                              (_model.crmborder ==
                                                                  FlutterFlowTheme.of(context)
                                                                      .error) ||
                                                              (_model.rqeborder ==
                                                                  FlutterFlowTheme.of(context)
                                                                      .error)) ||
                                                          (_model.checkboxValue == true
                                                              ? false
                                                              : ((_model.crmTextController.text == null ||
                                                                      _model.crmTextController.text ==
                                                                          '') ||
                                                                  (_model.dropdownEstadosValue ==
                                                                      null))))
                                                      ? null
                                                      : () async {
                                                          logFirebaseEvent(
                                                              'CADASTRO2_PAGE_CONTINUAR_BTN_ON_TAP');
                                                          var _shouldSetState =
                                                              false;
                                                          logFirebaseEvent(
                                                              'Button_validate_form');
                                                          if (_model.formKey
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          logFirebaseEvent(
                                                              'Button_custom_action');
                                                          _model.isCpfValid =
                                                              await actions
                                                                  .isValidCPF(
                                                            _model
                                                                .cpfTextController
                                                                .text,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (_model
                                                              .isCpfValid!) {
                                                            logFirebaseEvent(
                                                                'Button_backend_call');
                                                            _model.getCpf =
                                                                await GetcpfCall
                                                                    .call(
                                                              cpf: _model
                                                                  .cpfTextController
                                                                  .text,
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.getCpf
                                                                    ?.succeeded ??
                                                                true)) {
                                                              if ((_model.getCpf
                                                                      ?.jsonBody ??
                                                                  '')) {
                                                                logFirebaseEvent(
                                                                    'Button_update_page_state');
                                                                _model.cpfborder =
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .error;
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'Button_show_snack_bar');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Este CPF já está cadastrado por outro usuário.',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              } else {
                                                                if (_model.crmTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.crmTextController
                                                                            .text !=
                                                                        '') {
                                                                  logFirebaseEvent(
                                                                      'Button_backend_call');
                                                                  _model.getcrm =
                                                                      await GetcrmCall
                                                                          .call(
                                                                    crm: _model
                                                                        .crmTextController
                                                                        .text,
                                                                  );

                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model
                                                                          .getcrm
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    if ((_model
                                                                            .getcrm
                                                                            ?.jsonBody ??
                                                                        '')) {
                                                                      logFirebaseEvent(
                                                                          'Button_update_page_state');
                                                                      _model
                                                                          .crmborder = FlutterFlowTheme.of(
                                                                              context)
                                                                          .error;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Button_show_snack_bar');
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Este CRM já está cadastrado por outro usuário.',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_update_page_state');
                                                                    _model.crmborder =
                                                                        FlutterFlowTheme.of(context)
                                                                            .error;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Button_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Ocorreu um erro em nossos servidores. Por favor, tente novamente.',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                } else {
                                                                  if (_model
                                                                          .checkboxValue ==
                                                                      true) {
                                                                    logFirebaseEvent(
                                                                        'Button_alert_dialog');
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Atenção'),
                                                                                  content: Text('Como estudante você não poderá se candidatar a vagas de plantão. Assim que obtiver o seu CRM, atualize o seu cadastro!'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Confirmar'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Voltar'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    }

                                                                    logFirebaseEvent(
                                                                        'Button_set_form_field');
                                                                    safeSetState(
                                                                        () {
                                                                      _model.crmTextController
                                                                              ?.text =
                                                                          'estudante-${dateTimeFormat(
                                                                        "yyyy-MM-dd H:mm:ss",
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )}';
                                                                    });
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_update_page_state');
                                                                    _model.crmborder =
                                                                        FlutterFlowTheme.of(context)
                                                                            .error;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Button_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Por favor, insira um CRM válido.',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model
                                                                        .dropdownEspecialidadesValue ==
                                                                    null) {
                                                                  logFirebaseEvent(
                                                                      'Button_alert_dialog');
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Especialidade'),
                                                                                content: Text('Sua especialidade será automáticamente configurada para Generalista.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Confirmar'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Voltar'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  logFirebaseEvent(
                                                                      'Button_set_form_field');
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .dropdownEspecialidadesValueController
                                                                        ?.value = 21;
                                                                  });
                                                                }
                                                                logFirebaseEvent(
                                                                    'Button_update_app_state');
                                                                FFAppState()
                                                                        .estadoUFIndex =
                                                                    _model
                                                                        .dropdownEstadosValue!;
                                                                FFAppState()
                                                                        .estadoUF =
                                                                    cadastroForm2EstadosBrasilRowList
                                                                        .elementAtOrNull(
                                                                            FFAppState().estadoUFIndex)!
                                                                        .sigla!;
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'Button_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  Cadastro3Widget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'firstname':
                                                                        serializeParam(
                                                                      widget!
                                                                          .firstname,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'lastname':
                                                                        serializeParam(
                                                                      widget!
                                                                          .lastname,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'email':
                                                                        serializeParam(
                                                                      widget!
                                                                          .email,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'phone':
                                                                        serializeParam(
                                                                      widget!
                                                                          .phone,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'termsAccept':
                                                                        serializeParam(
                                                                      widget!
                                                                          .termsAccept,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'gender':
                                                                        serializeParam(
                                                                      widget!
                                                                          .gender,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'estadoUF':
                                                                        serializeParam(
                                                                      _model.checkboxValue ==
                                                                              true
                                                                          ? ''
                                                                          : cadastroForm2EstadosBrasilRowList
                                                                              .elementAtOrNull(_model.dropdownEstadosValue!)
                                                                              ?.sigla,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'crm':
                                                                        serializeParam(
                                                                      _model
                                                                          .crmTextController
                                                                          .text,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'cpf':
                                                                        serializeParam(
                                                                      _model
                                                                          .cpfTextController
                                                                          .text,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'rqe':
                                                                        serializeParam(
                                                                      'Não informado',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'birthdate':
                                                                        serializeParam(
                                                                      _model
                                                                          .datePicked,
                                                                      ParamType
                                                                          .DateTime,
                                                                    ),
                                                                    'arecodeindex':
                                                                        serializeParam(
                                                                      widget!
                                                                          .areacodeIndex,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'estadoUFindex':
                                                                        serializeParam(
                                                                      valueOrDefault<
                                                                          int>(
                                                                        _model
                                                                            .dropdownEstadosValue,
                                                                        23,
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'specialty':
                                                                        serializeParam(
                                                                      containerEspecialidadesRowList
                                                                          .elementAtOrNull(
                                                                              _model.dropdownEspecialidadesValue!)
                                                                          ?.especialidadeId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'camefrom':
                                                                        serializeParam(
                                                                      widget!
                                                                          .camefrom,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'specialtyindex':
                                                                        serializeParam(
                                                                      _model
                                                                          .dropdownEspecialidadesValue,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              }
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Button_update_page_state');
                                                              _model.cpfborder =
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error;
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'Button_show_snack_bar');
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Ocorreu um erro em nossos servidores. Por favor, tente novamente.',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Button_update_page_state');
                                                            _model.cpfborder =
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error;
                                                            safeSetState(() {});
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                              text: 'Continuar',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.06,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      font:
                                                          GoogleFonts.geologica(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        valueOrDefault<double>(
                                                  FFAppConstants.borderS,
                                                  0.0,
                                                )),
                                                disabledColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                disabledTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                hoverColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]
                .divide(SizedBox(height: FFAppConstants.Gap))
                .around(SizedBox(height: FFAppConstants.Gap)),
          ),
        ),
      ),
    );
  }
}
