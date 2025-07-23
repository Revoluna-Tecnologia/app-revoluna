import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/cadastro/back_top_bar/back_top_bar_widget.dart';
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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cadastro1_model.dart';
export 'cadastro1_model.dart';

class Cadastro1Widget extends StatefulWidget {
  const Cadastro1Widget({
    super.key,
    required this.camefrom,
    this.googleFullName,
    this.appleFullName,
  });

  final String? camefrom;
  final List<String>? googleFullName;
  final List<String>? appleFullName;

  static String routeName = 'Cadastro1';
  static String routePath = '/cadastro1';

  @override
  State<Cadastro1Widget> createState() => _Cadastro1WidgetState();
}

class _Cadastro1WidgetState extends State<Cadastro1Widget> {
  late Cadastro1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Cadastro1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().inputPhone != null && FFAppState().inputPhone != '') {
        _model.phoneborder = FlutterFlowTheme.of(context).primaryText;
        safeSetState(() {});
      }
      if (FFAppState().inputEmail != null && FFAppState().inputEmail != '') {
        _model.emailborder = FlutterFlowTheme.of(context).primaryText;
        safeSetState(() {});
      }
      if (_model.firstNameTextController.text != null &&
          _model.firstNameTextController.text != '') {
        _model.firstnameborder = FlutterFlowTheme.of(context).primaryText;
        safeSetState(() {});
      }
      if (_model.lastNameTextController.text != null &&
          _model.lastNameTextController.text != '') {
        _model.lastnameborder = FlutterFlowTheme.of(context).primaryText;
        safeSetState(() {});
      }
    });

    _model.firstNameTextController ??= TextEditingController(text: () {
      if (widget!.googleFullName != null &&
          (widget!.googleFullName)!.isNotEmpty) {
        return (widget!.googleFullName?.elementAtOrNull(0));
      } else if (widget!.appleFullName != null &&
          (widget!.appleFullName)!.isNotEmpty) {
        return (widget!.appleFullName?.elementAtOrNull(0));
      } else {
        return '';
      }
    }());
    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameTextController ??= TextEditingController(text: () {
      if (widget!.googleFullName != null &&
          (widget!.googleFullName)!.isNotEmpty) {
        return (widget!.googleFullName?.elementAtOrNull(1));
      } else if (widget!.appleFullName != null &&
          (widget!.appleFullName)!.isNotEmpty) {
        return (widget!.appleFullName?.elementAtOrNull(1));
      } else {
        return '';
      }
    }());
    _model.lastNameFocusNode ??= FocusNode();

    _model.eMailTextController ??= TextEditingController(
        text: FFAppState().inputEmail != null && FFAppState().inputEmail != ''
            ? FFAppState().inputEmail
            : '');
    _model.eMailFocusNode ??= FocusNode();

    _model.campoTelefoneTextController ??= TextEditingController(
        text: FFAppState().inputPhone != null && FFAppState().inputPhone != ''
            ? FFAppState().inputPhone
            : '');
    _model.campoTelefoneFocusNode ??= FocusNode();
    _model.campoTelefoneFocusNode!.addListener(() => safeSetState(() {}));
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
      child: WillPopScope(
        onWillPop: () async => false,
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
                    logo: false,
                    backButton: () async {
                      safeSetState(() {
                        _model.dropCodigoPaisValueController?.reset();
                      });
                      safeSetState(() {
                        _model.radioButtonValueController?.reset();
                      });
                      safeSetState(() {
                        _model.firstNameTextController?.text = () {
                          if (widget!.googleFullName != null &&
                              (widget!.googleFullName)!.isNotEmpty) {
                            return (widget!.googleFullName!
                                .elementAtOrNull(0))!;
                          } else if (widget!.appleFullName != null &&
                              (widget!.appleFullName)!.isNotEmpty) {
                            return (widget!.appleFullName!.elementAtOrNull(0))!;
                          } else {
                            return '';
                          }
                        }();

                        _model.lastNameTextController?.text = () {
                          if (widget!.googleFullName != null &&
                              (widget!.googleFullName)!.isNotEmpty) {
                            return (widget!.googleFullName!
                                .elementAtOrNull(1))!;
                          } else if (widget!.appleFullName != null &&
                              (widget!.appleFullName)!.isNotEmpty) {
                            return (widget!.appleFullName!.elementAtOrNull(1))!;
                          } else {
                            return '';
                          }
                        }();

                        _model.eMailTextController?.text =
                            FFAppState().inputEmail != null &&
                                    FFAppState().inputEmail != ''
                                ? FFAppState().inputEmail
                                : '';

                        _model.campoTelefoneTextController?.text =
                            FFAppState().inputPhone != null &&
                                    FFAppState().inputPhone != ''
                                ? FFAppState().inputPhone
                                : '';
                      });

                      context.goNamedAuth(
                        LoginPhoneWidget.routeName,
                        context.mounted,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                          ),
                        },
                      );

                      if (loggedIn) {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();
                      }
                      FFAppState().inputAreacode = '';
                      FFAppState().inputPhone = '';
                      FFAppState().inputEmail = '';
                      FFAppState().inputAreacodeIndex = 0;
                      FFAppState().wasUser = false;
                      FFAppState().userID = '';
                      FFAppState().userRole = '';
                      FFAppState().profilepicture =
                          'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/profilepictures//Avatar.png';
                      FFAppState().displayName = '';
                      FFAppState().gender = '';
                      FFAppState().valuesPrivacy = false;
                      safeSetState(() {});
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
                              progressValue: 0.33,
                              size: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.07,
                                60.0,
                              ),
                              progressColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent2,
                              strokeWidth: 6.0,
                              displayText: '1/3',
                              animationDuration: 1000.0,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dados de contato',
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
                                'Próxmo: dados de contato',
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
                  child: FutureBuilder<List<CodigosdeareaRow>>(
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
                      List<CodigosdeareaRow> containerCodigosdeareaRowList =
                          snapshot.data!;

                      return Container(
                        decoration: BoxDecoration(),
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
                              children: [
                                Form(
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
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'O primeiro passo é agora!',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .geologica(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        'Qual o seu nome completo?',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .geologica(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                                  ),
                                                  TextSpan(
                                                    text: ' *',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .geologica(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
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
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
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
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                FlutterFlowRadioButton(
                                                  options: [
                                                    'Dr.',
                                                    'Dra.',
                                                    'Prefiro não informar'
                                                  ].toList(),
                                                  onChanged: (val) =>
                                                      safeSetState(() {}),
                                                  controller: _model
                                                          .radioButtonValueController ??=
                                                      FormFieldController<
                                                          String>(null),
                                                  optionHeight: 20.0,
                                                  textStyle:
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
                                                          ),
                                                  selectedTextStyle:
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
                                                          ),
                                                  buttonPosition:
                                                      RadioButtonPosition.left,
                                                  direction: Axis.horizontal,
                                                  radioButtonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  inactiveRadioButtonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                                  toggleable: false,
                                                  horizontalAlignment:
                                                      WrapAlignment.start,
                                                  verticalAlignment:
                                                      WrapCrossAlignment.start,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .firstNameTextController,
                                                    focusNode: _model
                                                        .firstNameFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.firstNameTextController',
                                                      Duration(
                                                          milliseconds: 100),
                                                      () async {
                                                        if (_model
                                                                .firstNameTextController
                                                                .text !=
                                                            '') {
                                                          _model.firstnameborder =
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText;
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.firstnameborder =
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent2;
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                    ),
                                                    autofocus: false,
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .words,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      alignLabelWithHint: false,
                                                      hintText: 'Primeiro nome',
                                                      errorStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                lineHeight: 1.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: _model
                                                              .firstnameborder,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      suffixIcon: _model
                                                              .firstNameTextController!
                                                              .text
                                                              .isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .firstNameTextController
                                                                    ?.clear();
                                                                if (_model
                                                                        .firstNameTextController
                                                                        .text !=
                                                                    '') {
                                                                  _model.firstnameborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model.firstnameborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                  safeSetState(
                                                                      () {});
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3,
                                                                size: 14.0,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
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
                                                        ),
                                                    maxLines: null,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .firstNameTextControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      if (!isAndroid && !isiOS)
                                                        TextInputFormatter
                                                            .withFunction(
                                                                (oldValue,
                                                                    newValue) {
                                                          return TextEditingValue(
                                                            selection: newValue
                                                                .selection,
                                                            text: newValue.text
                                                                .toCapitalization(
                                                                    TextCapitalization
                                                                        .words),
                                                          );
                                                        }),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .lastNameTextController,
                                                    focusNode: _model
                                                        .lastNameFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.lastNameTextController',
                                                      Duration(
                                                          milliseconds: 100),
                                                      () async {
                                                        if (_model
                                                                .lastNameTextController
                                                                .text !=
                                                            '') {
                                                          _model.lastnameborder =
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText;
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.lastnameborder =
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent2;
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                    ),
                                                    autofocus: false,
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .words,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      alignLabelWithHint: false,
                                                      hintText:
                                                          'Último sobrenome',
                                                      errorStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                lineHeight: 1.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: _model
                                                              .lastnameborder,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      suffixIcon: _model
                                                              .lastNameTextController!
                                                              .text
                                                              .isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .lastNameTextController
                                                                    ?.clear();
                                                                if (_model
                                                                        .lastNameTextController
                                                                        .text !=
                                                                    '') {
                                                                  _model.lastnameborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model.lastnameborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                  safeSetState(
                                                                      () {});
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3,
                                                                size: 14.0,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
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
                                                        ),
                                                    maxLines: null,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .lastNameTextControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      if (!isAndroid && !isiOS)
                                                        TextInputFormatter
                                                            .withFunction(
                                                                (oldValue,
                                                                    newValue) {
                                                          return TextEditingValue(
                                                            selection: newValue
                                                                .selection,
                                                            text: newValue.text
                                                                .toCapitalization(
                                                                    TextCapitalization
                                                                        .words),
                                                          );
                                                        }),
                                                    ],
                                                  ),
                                                ),
                                              ].divide(SizedBox(
                                                  height:
                                                      FFAppConstants.halfGap)),
                                            ),
                                          ].divide(SizedBox(
                                              height: FFAppConstants.Gap)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        'Agora, seu e-mail principal?',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .geologica(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                                  ),
                                                  TextSpan(
                                                    text: ' *',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .geologica(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
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
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
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
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .eMailTextController,
                                                    focusNode:
                                                        _model.eMailFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.eMailTextController',
                                                      Duration(
                                                          milliseconds: 100),
                                                      () async {
                                                        if (_model
                                                                .eMailTextController
                                                                .text !=
                                                            '') {
                                                          _model.emailborder =
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText;
                                                          safeSetState(() {});
                                                          return;
                                                        } else {
                                                          _model.emailborder =
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent2;
                                                          safeSetState(() {});
                                                          return;
                                                        }
                                                      },
                                                    ),
                                                    autofocus: false,
                                                    autofillHints: [
                                                      AutofillHints.email
                                                    ],
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      alignLabelWithHint: false,
                                                      hintText:
                                                          'e-mail@dominio.com',
                                                      errorStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                lineHeight: 1.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: _model
                                                              .emailborder,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      prefixIcon: Icon(
                                                        FFIcons.kmail,
                                                        size: 14.0,
                                                      ),
                                                      suffixIcon: _model
                                                              .eMailTextController!
                                                              .text
                                                              .isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .eMailTextController
                                                                    ?.clear();
                                                                if (_model
                                                                        .eMailTextController
                                                                        .text !=
                                                                    '') {
                                                                  _model.emailborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                } else {
                                                                  _model.emailborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3,
                                                                size: 14.0,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
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
                                                        ),
                                                    maxLines: null,
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .eMailTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                if (valueOrDefault<bool>(
                                                  (_model.emailborder ==
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error) &&
                                                      (_model.eMailTextController
                                                              .text !=
                                                          ''),
                                                  false,
                                                ))
                                                  Text(
                                                    'Endereço de e-mail inválido',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .geologica(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
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
                                                  ),
                                              ].divide(SizedBox(
                                                  height:
                                                      FFAppConstants.halfGap)),
                                            ),
                                          ].divide(SizedBox(
                                              height: FFAppConstants.Gap)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        'E seu telefone móvel?',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .geologica(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                                  ),
                                                  TextSpan(
                                                    text: ' *',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
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
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            FlutterFlowDropDown<int>(
                                              controller: _model
                                                      .dropCodigoPaisValueController ??=
                                                  FormFieldController<int>(
                                                _model.dropCodigoPaisValue ??=
                                                    FFAppState().inputAreacodeIndex ==
                                                            null
                                                        ? 0
                                                        : FFAppState()
                                                            .inputAreacodeIndex,
                                              ),
                                              options: List<int>.from(
                                                  containerCodigosdeareaRowList
                                                      .map((e) =>
                                                          valueOrDefault<int>(
                                                            e.index,
                                                            0,
                                                          ))
                                                      .toList()),
                                              optionLabels:
                                                  containerCodigosdeareaRowList
                                                      .map((e) => e.lista)
                                                      .withoutNulls
                                                      .toList(),
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .dropCodigoPaisValue = val);
                                                safeSetState(() {
                                                  _model
                                                      .campoTelefoneTextController
                                                      ?.text = '';
                                                });
                                              },
                                              width: double.infinity,
                                              maxHeight:
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.25,
                                              searchHintTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                font: GoogleFonts.geologica(
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
                                              searchTextStyle: FlutterFlowTheme
                                                      .of(context)
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
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                                shadows: [
                                                  Shadow(
                                                    color: Color(0x26A369ED),
                                                    offset: Offset(0.0, 0.0),
                                                    blurRadius: 5.0,
                                                  )
                                                ],
                                              ),
                                              searchHintText: 'Pesquisar...',
                                              searchCursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              icon: Icon(
                                                FFIcons.kchevronDown,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              borderWidth: 1.0,
                                              borderRadius:
                                                  FFAppConstants.borderS,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .campoTelefoneTextController,
                                                    focusNode: _model
                                                        .campoTelefoneFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.campoTelefoneTextController',
                                                      Duration(
                                                          milliseconds: 100),
                                                      () async {
                                                        if (_model.campoTelefoneTextController
                                                                    .text !=
                                                                null &&
                                                            _model.campoTelefoneTextController
                                                                    .text !=
                                                                '') {
                                                          safeSetState(() {
                                                            _model.campoTelefoneTextController?.text = functions.aplicarmascara(
                                                                _model
                                                                    .campoTelefoneTextController
                                                                    .text,
                                                                containerCodigosdeareaRowList
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .dropCodigoPaisValue!)!
                                                                    .formato!)!;
                                                          });
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
                                                      },
                                                    ),
                                                    onFieldSubmitted:
                                                        (_) async {
                                                      if ((String var1,
                                                              String var2) {
                                                        return var1.length !=
                                                            int.parse(var2);
                                                      }(
                                                          _model
                                                              .campoTelefoneTextController
                                                              .text,
                                                          containerCodigosdeareaRowList
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .dropCodigoPaisValue!)!
                                                              .caracteresMax!
                                                              .toString())) {
                                                        _model.phoneborder =
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error;
                                                        safeSetState(() {});
                                                        return;
                                                      } else {
                                                        return;
                                                      }
                                                    },
                                                    autofocus: false,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      alignLabelWithHint: false,
                                                      hintText: _model
                                                                  .dropCodigoPaisValue ==
                                                              0
                                                          ? 'Somente números com DDD'
                                                          : 'Somente números',
                                                      errorStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                lineHeight: 1.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.phoneborder,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                          ),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                              .borderS,
                                                          0.0,
                                                        )),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                if (_model.campoTelefoneTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.campoTelefoneTextController
                                                                            .text !=
                                                                        '') {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.campoTelefoneTextController?.text = functions.aplicarmascara(
                                                                        _model
                                                                            .campoTelefoneTextController
                                                                            .text,
                                                                        containerCodigosdeareaRowList
                                                                            .elementAtOrNull(_model.dropCodigoPaisValue!)!
                                                                            .formato!)!;
                                                                  });
                                                                  _model.phoneborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                } else {
                                                                  _model.phoneborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3,
                                                                size: 14.0,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
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
                                                        ),
                                                    maxLines: null,
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .campoTelefoneTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                if (valueOrDefault<bool>(
                                                  (_model.phoneborder ==
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error) &&
                                                      (_model.campoTelefoneTextController
                                                              .text !=
                                                          ''),
                                                  false,
                                                ))
                                                  Text(
                                                    'Número de telefone inválido',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .geologica(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
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
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppConstants.Gap,
                                                            0.0,
                                                          ),
                                                          0.0,
                                                          0.0,
                                                          0.0),
                                                  child: Text(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                ),
                                              ].divide(SizedBox(
                                                  height:
                                                      FFAppConstants.halfGap)),
                                            ),
                                          ].divide(SizedBox(
                                              height: FFAppConstants.halfGap)),
                                        ),
                                      ].divide(SizedBox(
                                          height: FFAppConstants.doubleGap)),
                                    ),
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
                                      valueOrDefault<double>(
                                        FFAppConstants.doubleGap,
                                        0.0,
                                      )),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: ((_model.radioButtonValue == null ||
                                                    _model.radioButtonValue ==
                                                        '') ||
                                                (_model.firstNameTextController.text == null ||
                                                    _model.firstNameTextController.text ==
                                                        '') ||
                                                (_model.lastNameTextController.text == null ||
                                                    _model.lastNameTextController.text ==
                                                        '') ||
                                                (_model.eMailTextController.text == null ||
                                                    _model.eMailTextController.text ==
                                                        '') ||
                                                (_model.campoTelefoneTextController.text ==
                                                        null ||
                                                    _model.campoTelefoneTextController
                                                            .text ==
                                                        '') ||
                                                ((_model.firstnameborder ==
                                                        FlutterFlowTheme.of(context)
                                                            .error) ||
                                                    (_model.lastnameborder ==
                                                        FlutterFlowTheme.of(context)
                                                            .error) ||
                                                    (_model.emailborder ==
                                                        FlutterFlowTheme.of(context)
                                                            .error) ||
                                                    (_model.phoneborder ==
                                                        FlutterFlowTheme.of(context)
                                                            .error)))
                                            ? null
                                            : () async {
                                                var _shouldSetState = false;
                                                _model.validation = true;
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  safeSetState(() => _model
                                                      .validation = false);
                                                  return;
                                                }
                                                if (_model.radioButtonValue ==
                                                    null) {
                                                  _model.validation = false;
                                                  safeSetState(() {});
                                                  return;
                                                }
                                                _shouldSetState = true;
                                                if (widget!.camefrom ==
                                                    'phone') {
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(_model
                                                                    .eMailTextController
                                                                    .text),
                                                                content: Text(
                                                                    'Precisamos confirmar seu e-mail. Tem certeza de que é o endereço correto?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Confirmar'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Voltar'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  _model.emailInUse =
                                                      await GetemailaddressCall
                                                          .call(
                                                    emaildigitado: _model
                                                        .eMailTextController
                                                        .text
                                                        .toLowerCase(),
                                                  );

                                                  _shouldSetState = true;
                                                  if ((_model.emailInUse
                                                          ?.jsonBody ??
                                                      '')) {
                                                    safeSetState(() {
                                                      _model.eMailTextController
                                                              ?.text =
                                                          (_model
                                                              .eMailTextController
                                                              .text
                                                              .toLowerCase());
                                                      _model.eMailFocusNode
                                                          ?.requestFocus();
                                                      WidgetsBinding.instance
                                                          .addPostFrameCallback(
                                                              (_) {
                                                        _model.eMailTextController
                                                                ?.selection =
                                                            TextSelection(
                                                          baseOffset: 0,
                                                          extentOffset: _model
                                                              .eMailTextController!
                                                              .text
                                                              .length,
                                                        );
                                                      });
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'E-mail já cadastrado. Utilize outro ou toque em \"Já tenho uma conta\".',
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
                                                                color: FlutterFlowTheme.of(
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
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                      ),
                                                    );
                                                    _model.emailborder =
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error;
                                                    safeSetState(() {});
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  } else {
                                                    _model.sendVerifyEmail =
                                                        await SendVerifyEmailCall
                                                            .call(
                                                      email: _model
                                                          .eMailTextController
                                                          .text
                                                          .toLowerCase(),
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.sendVerifyEmail
                                                            ?.succeeded ??
                                                        true)) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        isDismissible: false,
                                                        enableDrag: false,
                                                        useSafeArea: true,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  CheckemailbottomWidget(
                                                                email: _model
                                                                    .eMailTextController
                                                                    .text,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() =>
                                                              _model.emailchanged =
                                                                  value));

                                                      _shouldSetState = true;
                                                      if (_model
                                                          .emailchanged!) {
                                                        FFAppState()
                                                                .inputEmail =
                                                            _model
                                                                .eMailTextController
                                                                .text
                                                                .toLowerCase();
                                                        safeSetState(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.eMailTextController
                                                                  ?.text =
                                                              (_model
                                                                  .eMailTextController
                                                                  .text
                                                                  .toLowerCase());
                                                          _model.eMailFocusNode
                                                              ?.requestFocus();
                                                          WidgetsBinding
                                                              .instance
                                                              .addPostFrameCallback(
                                                                  (_) {
                                                            _model.eMailTextController
                                                                    ?.selection =
                                                                TextSelection(
                                                              baseOffset: 0,
                                                              extentOffset: _model
                                                                  .eMailTextController!
                                                                  .text
                                                                  .length,
                                                            );
                                                          });
                                                        });
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }
                                                    } else {
                                                      safeSetState(() {
                                                        _model.eMailTextController
                                                                ?.text =
                                                            (_model
                                                                .eMailTextController
                                                                .text
                                                                .toLowerCase());
                                                        _model.eMailFocusNode
                                                            ?.requestFocus();
                                                        WidgetsBinding.instance
                                                            .addPostFrameCallback(
                                                                (_) {
                                                          _model.eMailTextController
                                                                  ?.selection =
                                                              TextSelection(
                                                            baseOffset: 0,
                                                            extentOffset: _model
                                                                .eMailTextController!
                                                                .text
                                                                .length,
                                                          );
                                                        });
                                                      });
                                                      _model.emailborder =
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error;
                                                      safeSetState(() {});
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'E-mail inválido, por favor verifique e tente novamente.',
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
                                                                  color: FlutterFlowTheme.of(
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
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .warning,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                } else if ((widget!.camefrom ==
                                                        'email') ||
                                                    (widget!.camefrom ==
                                                        'google') ||
                                                    (widget!.camefrom ==
                                                        'apple')) {
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '${containerCodigosdeareaRowList.elementAtOrNull(_model.dropCodigoPaisValue!)?.codigo} ${_model.campoTelefoneTextController.text}'),
                                                                content: Text(
                                                                    'Precisamos confirmar seu número de telefone. Tem certeza de que é o número correto?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Confimar'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Voltar'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  _model.phoneInUse =
                                                      await GetphonenumberCall
                                                          .call(
                                                    numeroDigitado:
                                                        (String var1) {
                                                      return var1.replaceAll(
                                                          RegExp(r'[^0-9]'),
                                                          '');
                                                    }('${containerCodigosdeareaRowList.elementAtOrNull(_model.dropCodigoPaisValue!)?.codigo}${_model.campoTelefoneTextController.text}'),
                                                  );

                                                  _shouldSetState = true;
                                                  if ((_model.phoneInUse
                                                          ?.jsonBody ??
                                                      '')) {
                                                    safeSetState(() {
                                                      _model.campoTelefoneTextController
                                                              ?.text =
                                                          _model
                                                              .campoTelefoneTextController
                                                              .text;
                                                      _model
                                                          .campoTelefoneFocusNode
                                                          ?.requestFocus();
                                                      WidgetsBinding.instance
                                                          .addPostFrameCallback(
                                                              (_) {
                                                        _model.campoTelefoneTextController
                                                                ?.selection =
                                                            TextSelection(
                                                          baseOffset: 0,
                                                          extentOffset: _model
                                                              .campoTelefoneTextController!
                                                              .text
                                                              .length,
                                                        );
                                                      });
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Número de telefone já cadastrado. Utilize outro ou toque em \"Já tenho uma conta\".',
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
                                                                color: FlutterFlowTheme.of(
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
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                      ),
                                                    );
                                                    _model.phoneborder =
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error;
                                                    safeSetState(() {});
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  } else {
                                                    _model.sendSMSverify =
                                                        await SendSMSverifyCall
                                                            .call(
                                                      phone: (String var1) {
                                                        return var1.replaceAll(
                                                            RegExp(r'[^0-9]'),
                                                            '');
                                                      }('${containerCodigosdeareaRowList.elementAtOrNull(_model.dropCodigoPaisValue!)?.codigo}${_model.campoTelefoneTextController.text}'),
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.sendSMSverify
                                                            ?.succeeded ??
                                                        true)) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        isDismissible: false,
                                                        enableDrag: false,
                                                        useSafeArea: true,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  CheckphonebottomWidget(
                                                                phoneOnlynumbers:
                                                                    (String
                                                                        var1) {
                                                                  return var1
                                                                      .replaceAll(
                                                                          RegExp(
                                                                              r'[^0-9]'),
                                                                          '');
                                                                }('${containerCodigosdeareaRowList.elementAtOrNull(_model.dropCodigoPaisValue!)?.codigo}${_model.campoTelefoneTextController.text}'),
                                                                phoneFormated:
                                                                    '${containerCodigosdeareaRowList.elementAtOrNull(_model.dropCodigoPaisValue!)?.codigo} ${_model.campoTelefoneTextController.text}',
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() =>
                                                              _model.checkphone =
                                                                  value));

                                                      _shouldSetState = true;
                                                      if (_model.checkphone!) {
                                                        FFAppState()
                                                                .inputAreacode =
                                                            containerCodigosdeareaRowList
                                                                .elementAtOrNull(
                                                                    _model
                                                                        .dropCodigoPaisValue!)!
                                                                .codigo!;
                                                        FFAppState()
                                                                .inputAreacodeIndex =
                                                            _model
                                                                .dropCodigoPaisValue!;
                                                        FFAppState()
                                                                .inputPhone =
                                                            _model
                                                                .campoTelefoneTextController
                                                                .text;
                                                        safeSetState(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.campoTelefoneTextController
                                                                  ?.text =
                                                              _model
                                                                  .campoTelefoneTextController
                                                                  .text;
                                                          _model
                                                              .campoTelefoneFocusNode
                                                              ?.requestFocus();
                                                          WidgetsBinding
                                                              .instance
                                                              .addPostFrameCallback(
                                                                  (_) {
                                                            _model.campoTelefoneTextController
                                                                    ?.selection =
                                                                TextSelection(
                                                              baseOffset: 0,
                                                              extentOffset: _model
                                                                  .campoTelefoneTextController!
                                                                  .text
                                                                  .length,
                                                            );
                                                          });
                                                        });
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }
                                                    } else {
                                                      safeSetState(() {
                                                        _model.campoTelefoneTextController
                                                                ?.text =
                                                            _model
                                                                .campoTelefoneTextController
                                                                .text;
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
                                                      _model.phoneborder =
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error;
                                                      safeSetState(() {});
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Telefone inválido, por favor verifique e tente novamente.',
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
                                                                  color: FlutterFlowTheme.of(
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
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .warning,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                } else if ((widget!.camefrom ==
                                                        'phone') &&
                                                    (FFAppState().inputPhone !=
                                                        _model
                                                            .campoTelefoneTextController
                                                            .text)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Não é mais possível alterar o número de telefone. Se quiser, inicie novamente tocando em voltar.',
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
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
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                    ),
                                                  );
                                                  _model.phoneborder =
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error;
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model.eMailTextController
                                                            ?.text =
                                                        _model
                                                            .eMailTextController
                                                            .text;
                                                    _model.eMailFocusNode
                                                        ?.requestFocus();
                                                    WidgetsBinding.instance
                                                        .addPostFrameCallback(
                                                            (_) {
                                                      _model.eMailTextController
                                                              ?.selection =
                                                          TextSelection(
                                                        baseOffset: 0,
                                                        extentOffset: _model
                                                            .eMailTextController!
                                                            .text
                                                            .length,
                                                      );
                                                    });
                                                  });
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                } else if ((widget!.camefrom ==
                                                        'email') &&
                                                    (FFAppState().inputEmail !=
                                                        _model
                                                            .eMailTextController
                                                            .text)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Não é mais possível alterar o e-mail. Se quiser, inicie novamente tocando em voltar.',
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
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
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                    ),
                                                  );
                                                  _model.emailborder =
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error;
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model.campoTelefoneTextController
                                                            ?.text =
                                                        _model
                                                            .campoTelefoneTextController
                                                            .text;
                                                    _model
                                                        .campoTelefoneFocusNode
                                                        ?.requestFocus();
                                                    WidgetsBinding.instance
                                                        .addPostFrameCallback(
                                                            (_) {
                                                      _model.campoTelefoneTextController
                                                              ?.selection =
                                                          TextSelection(
                                                        baseOffset: 0,
                                                        extentOffset: _model
                                                            .campoTelefoneTextController!
                                                            .text
                                                            .length,
                                                      );
                                                    });
                                                  });
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Ocorreu um erro. Por favor tente novamente. Se persistir toque em voltar.',
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
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
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                    ),
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                context.pushNamed(
                                                  Cadastro2Widget.routeName,
                                                  queryParameters: {
                                                    'firstname': serializeParam(
                                                      _model
                                                          .firstNameTextController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'lastname': serializeParam(
                                                      _model
                                                          .lastNameTextController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'email': serializeParam(
                                                      _model.eMailTextController
                                                          .text
                                                          .toLowerCase(),
                                                      ParamType.String,
                                                    ),
                                                    'phone': serializeParam(
                                                      (String var1) {
                                                        return var1.replaceAll(
                                                            RegExp(r'[^0-9]'),
                                                            '');
                                                      }(_model
                                                          .campoTelefoneTextController
                                                          .text),
                                                      ParamType.String,
                                                    ),
                                                    'areacodeIndex':
                                                        serializeParam(
                                                      _model
                                                          .dropCodigoPaisValue,
                                                      ParamType.int,
                                                    ),
                                                    'termsAccept':
                                                        serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'gender': serializeParam(
                                                      _model.radioButtonValue,
                                                      ParamType.String,
                                                    ),
                                                    'camefrom': serializeParam(
                                                      widget!.camefrom,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                        text: 'Continuar',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.06,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.geologica(
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
                                    ].divide(SizedBox(
                                        height: FFAppConstants.doubleGap)),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(
                                      height: FFAppConstants.doubleGap))
                                  .addToStart(
                                      SizedBox(height: FFAppConstants.Gap)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]
                  .divide(SizedBox(height: FFAppConstants.Gap))
                  .addToStart(SizedBox(height: FFAppConstants.Gap)),
            ),
          ),
        ),
      ),
    );
  }
}
