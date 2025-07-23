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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_phone_model.dart';
export 'login_phone_model.dart';

class LoginPhoneWidget extends StatefulWidget {
  const LoginPhoneWidget({super.key});

  static String routeName = 'LoginPhone';
  static String routePath = '/loginPhone';

  @override
  State<LoginPhoneWidget> createState() => _LoginPhoneWidgetState();
}

class _LoginPhoneWidgetState extends State<LoginPhoneWidget> {
  late LoginPhoneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPhoneModel());

    _model.campoTelefoneTextController ??= TextEditingController(text: '');
    _model.campoTelefoneFocusNode ??= FocusNode();
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    FFIcons.klogoIcon,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 50.0,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Entre ou crie sua conta',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  font: GoogleFonts.geologica(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Sua jornada começa agora',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.geologica(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                      ),
                    ),
                  ].divide(SizedBox(height: FFAppConstants.halfGap)),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FutureBuilder<List<CodigosdeareaRow>>(
                        future: CodigosdeareaTable().queryRows(
                          queryFn: (q) => q.order('Index', ascending: true),
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
                          List<CodigosdeareaRow>
                              loginPhoneFormValCodigosdeareaRowList =
                              snapshot.data!;

                          return Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
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
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FlutterFlowDropDown<int>(
                                        controller: _model
                                                .dropCodigoPaisValueController ??=
                                            FormFieldController<int>(
                                          _model.dropCodigoPaisValue ??= 0,
                                        ),
                                        options: List<int>.from(
                                            loginPhoneFormValCodigosdeareaRowList
                                                .map((e) => valueOrDefault<int>(
                                                      e.index,
                                                      0,
                                                    ))
                                                .toList()),
                                        optionLabels:
                                            loginPhoneFormValCodigosdeareaRowList
                                                .map((e) =>
                                                    valueOrDefault<String>(
                                                      e.lista,
                                                      'Brasil (+55)',
                                                    ))
                                                .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.dropCodigoPaisValue = val);
                                          safeSetState(() {
                                            _model.campoTelefoneTextController
                                                ?.text = '';
                                          });
                                        },
                                        width: double.infinity,
                                        maxHeight:
                                            MediaQuery.sizeOf(context).height *
                                                0.5,
                                        searchHintTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                          font: GoogleFonts.geologica(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                          shadows: [
                                            Shadow(
                                              color: Color(0x26A369ED),
                                              offset: Offset(0.0, 0.0),
                                              blurRadius: 5.0,
                                            )
                                          ],
                                        ),
                                        searchTextStyle: FlutterFlowTheme.of(
                                                context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                              shadows: [
                                                Shadow(
                                                  color: Color(0x26A369ED),
                                                  offset: Offset(0.0, 0.0),
                                                  blurRadius: 5.0,
                                                )
                                              ],
                                              lineHeight: 1.0,
                                            ),
                                        searchHintText: 'Pesquisar...',
                                        searchCursorColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        icon: Icon(
                                          FFIcons.kchevronDown,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderWidth: 1.0,
                                        borderRadius: FFAppConstants.borderS,
                                        margin: EdgeInsetsDirectional.fromSTEB(
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
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model
                                              .campoTelefoneTextController,
                                          focusNode:
                                              _model.campoTelefoneFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.campoTelefoneTextController',
                                            Duration(milliseconds: 0),
                                            () async {
                                              safeSetState(() {
                                                _model.campoTelefoneTextController?.text =
                                                    functions.aplicarmascara(
                                                        _model
                                                            .campoTelefoneTextController
                                                            .text,
                                                        loginPhoneFormValCodigosdeareaRowList
                                                            .elementAtOrNull(_model
                                                                .dropCodigoPaisValue!)!
                                                            .formato!)!;
                                                _model.campoTelefoneFocusNode
                                                    ?.requestFocus();
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  _model.campoTelefoneTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                    offset: _model
                                                        .campoTelefoneTextController!
                                                        .text
                                                        .length,
                                                  );
                                                });
                                              });
                                              if (_model
                                                      .campoTelefoneTextController
                                                      .text !=
                                                  '') {
                                                _model.phoneborder =
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText;
                                                safeSetState(() {});
                                                return;
                                              } else {
                                                _model.phoneborder =
                                                    FlutterFlowTheme.of(context)
                                                        .accent2;
                                                safeSetState(() {});
                                                return;
                                              }
                                            },
                                          ),
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            alignLabelWithHint: false,
                                            hintText:
                                                _model.dropCodigoPaisValue == 0
                                                    ? 'Somente números com DDD'
                                                    : 'Somente números',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: valueOrDefault<Color>(
                                                  _model.phoneborder,
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                                ),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      valueOrDefault<double>(
                                                FFAppConstants.borderS,
                                                0.0,
                                              )),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      valueOrDefault<double>(
                                                FFAppConstants.borderS,
                                                0.0,
                                              )),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      valueOrDefault<double>(
                                                FFAppConstants.borderS,
                                                0.0,
                                              )),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      valueOrDefault<double>(
                                                FFAppConstants.borderS,
                                                0.0,
                                              )),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            prefixIcon: Icon(
                                              FFIcons.ksmartphone,
                                            ),
                                            suffixIcon: _model
                                                    .campoTelefoneTextController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model
                                                          .campoTelefoneTextController
                                                          ?.clear();
                                                      safeSetState(() {
                                                        _model.campoTelefoneTextController?.text =
                                                            functions.aplicarmascara(
                                                                _model
                                                                    .campoTelefoneTextController
                                                                    .text,
                                                                loginPhoneFormValCodigosdeareaRowList
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .dropCodigoPaisValue!)!
                                                                    .formato!)!;
                                                        _model
                                                            .campoTelefoneFocusNode
                                                            ?.requestFocus();
                                                        WidgetsBinding.instance
                                                            .addPostFrameCallback(
                                                                (_) {
                                                          _model.campoTelefoneTextController
                                                                  ?.selection =
                                                              TextSelection
                                                                  .collapsed(
                                                            offset: _model
                                                                .campoTelefoneTextController!
                                                                .text
                                                                .length,
                                                          );
                                                        });
                                                      });
                                                      if (_model
                                                              .campoTelefoneTextController
                                                              .text !=
                                                          '') {
                                                        _model.phoneborder =
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText;
                                                        safeSetState(() {});
                                                        return;
                                                      } else {
                                                        _model.phoneborder =
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2;
                                                        safeSetState(() {});
                                                        return;
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                      size: 14.0,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.geologica(
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          maxLines: null,
                                          maxLength:
                                              loginPhoneFormValCodigosdeareaRowList
                                                  .elementAtOrNull(_model
                                                      .dropCodigoPaisValue!)
                                                  ?.caracteresMax,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.enforced,
                                          buildCounter: (context,
                                                  {required currentLength,
                                                  required isFocused,
                                                  maxLength}) =>
                                              null,
                                          keyboardType: TextInputType.phone,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .campoTelefoneTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      if (_model.phoneborder ==
                                          FlutterFlowTheme.of(context).error)
                                        Text(
                                          'Número de telefone inválido',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                font: GoogleFonts.geologica(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                    ].divide(SizedBox(
                                        height: FFAppConstants.halfGap)),
                                  ),
                                  FFButtonWidget(
                                    onPressed: valueOrDefault<bool>(
                                      (_model.campoTelefoneTextController
                                                      .text ==
                                                  null ||
                                              _model.campoTelefoneTextController
                                                      .text ==
                                                  '') ||
                                          (_model.phoneborder ==
                                              FlutterFlowTheme.of(context)
                                                  .error),
                                      false,
                                    )
                                        ? null
                                        : () async {
                                            var _shouldSetState = false;
                                            FFAppState().inputPhone = _model
                                                .campoTelefoneTextController
                                                .text;
                                            FFAppState().inputAreacode =
                                                loginPhoneFormValCodigosdeareaRowList
                                                    .elementAtOrNull(_model
                                                        .dropCodigoPaisValue!)!
                                                    .codigo!;
                                            FFAppState().inputAreacodeIndex =
                                                _model.dropCodigoPaisValue!;
                                            safeSetState(() {});
                                            _model.phoneOnlynumbers =
                                                '${(String var1) {
                                              return var1.replaceFirst('+', '');
                                            }(FFAppState().inputAreacode)}${(String var1) {
                                              return var1.replaceAll(
                                                  RegExp(r'\D'), '');
                                            }(FFAppState().inputPhone)}';
                                            safeSetState(() {});
                                            _model.getphonenumber =
                                                await GetphonenumberCall.call(
                                              numeroDigitado:
                                                  _model.phoneOnlynumbers,
                                            );

                                            _shouldSetState = true;
                                            if ((_model
                                                    .getphonenumber?.jsonBody ??
                                                '')) {
                                              FFAppState().wasUser = (_model
                                                      .getphonenumber
                                                      ?.jsonBody ??
                                                  '');
                                              safeSetState(() {});
                                            }
                                            if (FFAppState().wasUser) {
                                              _model.oTPcheck =
                                                  await actions.otpPhone(
                                                _model.phoneOnlynumbers!,
                                              );
                                              _shouldSetState = true;
                                              if (_model.oTPcheck!) {
                                                _model.idFromPhone =
                                                    await GetIdfromphoneCall
                                                        .call(
                                                  inputPhone:
                                                      _model.phoneOnlynumbers,
                                                );

                                                _shouldSetState = true;
                                                FFAppState().userID = (_model
                                                        .idFromPhone
                                                        ?.bodyText ??
                                                    '');
                                                _model.queryUser =
                                                    await UserProfileTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'id',
                                                    (_model.idFromPhone
                                                                ?.jsonBody ??
                                                            '')
                                                        .toString(),
                                                  ),
                                                );
                                                _shouldSetState = true;
                                                FFAppState().displayName =
                                                    _model
                                                        .queryUser!
                                                        .firstOrNull!
                                                        .displayname!;
                                                FFAppState().gender = _model
                                                    .queryUser!
                                                    .firstOrNull!
                                                    .gender!;
                                                FFAppState().profilepicture =
                                                    _model
                                                        .queryUser!
                                                        .firstOrNull!
                                                        .profilepicture!;

                                                context.pushNamed(
                                                  LoginPhoneCodeWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'phoneOnlynumbers':
                                                        serializeParam(
                                                      _model.phoneOnlynumbers,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                _model.phoneborder =
                                                    FlutterFlowTheme.of(context)
                                                        .error;
                                                safeSetState(() {});
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                            } else {
                                              _model.sendSMS =
                                                  await SendSMSverifyCall.call(
                                                phone: _model.phoneOnlynumbers,
                                              );

                                              _shouldSetState = true;
                                              if ((_model.sendSMS?.succeeded ??
                                                  true)) {
                                                context.pushNamed(
                                                  LoginPhoneCodeWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'phoneOnlynumbers':
                                                        serializeParam(
                                                      _model.phoneOnlynumbers,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                _model.phoneborder =
                                                    FlutterFlowTheme.of(context)
                                                        .error;
                                                safeSetState(() {});
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                            }

                                            safeSetState(() {
                                              _model.campoTelefoneTextController
                                                  ?.clear();
                                            });
                                            safeSetState(() {
                                              _model
                                                  .dropCodigoPaisValueController
                                                  ?.reset();
                                            });
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                    text: 'Continuar',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.06,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.geologica(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.borderS,
                                        0.0,
                                      )),
                                      disabledColor:
                                          FlutterFlowTheme.of(context).accent2,
                                      disabledTextColor:
                                          FlutterFlowTheme.of(context).accent3,
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ].divide(SizedBox(height: FFAppConstants.Gap)),
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        width: double.infinity,
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 70.0,
                                height: 32.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'ou',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.geologica(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(LoginEmailWidget.routeName);
                              },
                              text: 'Continuar com Email',
                              icon: Icon(
                                Icons.mail_outlined,
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
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
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: FFAppConstants.stroke,
                                ),
                                borderRadius: BorderRadius.circular(
                                    valueOrDefault<double>(
                                  FFAppConstants.borderS,
                                  0.0,
                                )),
                              ),
                              showLoadingIndicator: false,
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                GoRouter.of(context).prepareAuthEvent();
                                final user =
                                    await authManager.signInWithGoogle(context);
                                if (user == null) {
                                  return;
                                }
                                _model.queryUserGoogle =
                                    await UserProfileTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'id',
                                    currentUserUid,
                                  ),
                                );
                                _shouldSetState = true;
                                _model.googleFullName =
                                    await actions.getGoogleNames();
                                _shouldSetState = true;
                                FFAppState().wasUser = _model.queryUserGoogle!
                                    .where((e) => e.role == 'free')
                                    .toList()
                                    .isNotEmpty;
                                safeSetState(() {});
                                if (FFAppState().wasUser) {
                                  FFAppState().userID = currentUserUid;
                                  FFAppState().displayName = _model
                                      .queryUserGoogle!
                                      .firstOrNull!
                                      .displayname!;
                                  FFAppState().gender = _model
                                      .queryUserGoogle!.firstOrNull!.gender!;
                                  FFAppState().profilepicture = _model
                                      .queryUserGoogle!
                                      .firstOrNull!
                                      .profilepicture!;
                                  safeSetState(() {});

                                  context.pushNamedAuth(
                                      HomePageWidget.routeName,
                                      context.mounted);
                                } else {
                                  FFAppState().userID = currentUserUid;
                                  FFAppState().inputEmail = currentUserEmail;
                                  safeSetState(() {});
                                  if (_model
                                          .queryUserGoogle?.firstOrNull?.role ==
                                      'astronauta') {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('E-mail já cadastrado!'),
                                          content: Text(
                                              'Por favor, tente com outro método de entrada'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    context.pushNamedAuth(
                                      Cadastro1Widget.routeName,
                                      context.mounted,
                                      queryParameters: {
                                        'camefrom': serializeParam(
                                          'google',
                                          ParamType.String,
                                        ),
                                        'googleFullName': serializeParam(
                                          _model.googleFullName,
                                          ParamType.String,
                                          isList: true,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                }

                                if (_shouldSetState) safeSetState(() {});
                              },
                              text: 'Continuar com Google',
                              icon: FaIcon(
                                FontAwesomeIcons.google,
                                size: 16.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
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
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: FFAppConstants.stroke,
                                ),
                                borderRadius: BorderRadius.circular(
                                    valueOrDefault<double>(
                                  FFAppConstants.borderS,
                                  0.0,
                                )),
                              ),
                              showLoadingIndicator: false,
                            ),
                            isAndroid
                                ? Container()
                                : FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      GoRouter.of(context).prepareAuthEvent();
                                      final user = await authManager
                                          .signInWithApple(context);
                                      if (user == null) {
                                        return;
                                      }
                                      _model.queryAppleUser =
                                          await UserProfileTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'id',
                                          currentUserUid,
                                        ),
                                      );
                                      _shouldSetState = true;
                                      FFAppState().wasUser = _model
                                          .queryAppleUser!
                                          .where((e) => e.role == 'free')
                                          .toList()
                                          .isNotEmpty;
                                      safeSetState(() {});
                                      if (_model.queryAppleUser!
                                          .where((e) => e.role == 'free')
                                          .toList()
                                          .isNotEmpty) {
                                        FFAppState().userID = currentUserUid;
                                        FFAppState().displayName = _model
                                            .queryAppleUser!
                                            .firstOrNull!
                                            .displayname!;
                                        FFAppState().gender = _model
                                            .queryAppleUser!
                                            .firstOrNull!
                                            .gender!;
                                        FFAppState().profilepicture = _model
                                            .queryAppleUser!
                                            .firstOrNull!
                                            .profilepicture!;
                                        safeSetState(() {});

                                        context.pushNamedAuth(
                                            HomePageWidget.routeName,
                                            context.mounted);
                                      } else {
                                        if (_model.queryAppleUser?.firstOrNull
                                                ?.role ==
                                            'astronauta') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'E-mail já cadastrado!'),
                                                content: Text(
                                                    'Por favor, tente com outro método de entrada'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          FFAppState().inputEmail =
                                              currentUserEmail != null &&
                                                      currentUserEmail != ''
                                                  ? currentUserEmail
                                                  : FFAppState()
                                                      .appleData
                                                      .elementAtOrNull(2)!;
                                          safeSetState(() {});

                                          context.pushNamedAuth(
                                            Cadastro1Widget.routeName,
                                            context.mounted,
                                            queryParameters: {
                                              'camefrom': serializeParam(
                                                'apple',
                                                ParamType.String,
                                              ),
                                              'appleFullName': serializeParam(
                                                FFAppState().appleData,
                                                ParamType.String,
                                                isList: true,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: 'Continuar com Apple',
                                    icon: FaIcon(
                                      FontAwesomeIcons.apple,
                                      size: 20.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.05,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.geologica(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: FFAppConstants.stroke,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.borderS,
                                        0.0,
                                      )),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                          ].divide(SizedBox(height: FFAppConstants.Gap)),
                        ),
                      ),
                    ].divide(SizedBox(height: FFAppConstants.doubleGap)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await actions.launchWhatsAppChat(
                          'Olá, estou tendo dificuldades para entrar no app',
                        );
                      },
                      text: 'Precisa de ajuda?',
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 22.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x00A369ED),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              font: GoogleFonts.geologica(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(110.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(TermosWidget.routeName);
                      },
                      text: 'Termos de uso',
                      options: FFButtonOptions(
                        width: 110.0,
                        height: 22.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x00A369ED),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              font: GoogleFonts.geologica(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(110.0),
                      ),
                    ),
                  ].divide(SizedBox(height: FFAppConstants.doubleGap)),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    '© Revoluna 2025',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.geologica(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                  ),
                ),
              ].divide(SizedBox(height: 40.0)).around(SizedBox(height: 40.0)),
            ),
          ),
        ),
      ),
    );
  }
}
