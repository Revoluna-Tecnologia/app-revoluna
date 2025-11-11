import '/backend/api_requests/api_calls.dart';
import '/components/back_top_bar/back_top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_phone_code_model.dart';
export 'login_phone_code_model.dart';

class LoginPhoneCodeWidget extends StatefulWidget {
  const LoginPhoneCodeWidget({
    super.key,
    this.phoneOnlynumbers,
  });

  final String? phoneOnlynumbers;

  static String routeName = 'LoginPhoneCode';
  static String routePath = '/loginPhoneCode';

  @override
  State<LoginPhoneCodeWidget> createState() => _LoginPhoneCodeWidgetState();
}

class _LoginPhoneCodeWidgetState extends State<LoginPhoneCodeWidget> {
  late LoginPhoneCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPhoneCodeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LoginPhoneCode'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOGIN_PHONE_CODE_LoginPhoneCode_ON_INIT_');
      logFirebaseEvent('LoginPhoneCode_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 1000,
        ),
      );
      logFirebaseEvent('LoginPhoneCode_timer');
      _model.timerController.onStartTimer();
    });

    _model.pinCodeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.backTopBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BackTopBarWidget(
                    logo: true,
                    backButton: () async {
                      logFirebaseEvent(
                          'LOGIN_PHONE_CODE_Container_idz4yefd_CALL');
                      logFirebaseEvent('BackTopBar_navigate_back');
                      context.safePop();
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Builder(
                          builder: (context) {
                            if (FFAppState().wasUser) {
                              return Builder(
                                builder: (context) {
                                  if (FFAppState().gender ==
                                      'Prefiro não informar') {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            FFAppConstants.doubleGap,
                                            0.0,
                                          ),
                                          0.0,
                                          valueOrDefault<double>(
                                            FFAppConstants.Gap,
                                            0.0,
                                          )),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Olá, ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineLarge
                                                  .override(
                                                    font: GoogleFonts.geologica(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: FFAppState().displayName,
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                font: GoogleFonts.geologica(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            FFAppConstants.doubleGap,
                                            0.0,
                                          ),
                                          0.0,
                                          valueOrDefault<double>(
                                            FFAppConstants.Gap,
                                            0.0,
                                          )),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFAppState().gender == 'Dr.'
                                                  ? 'Bem vindo, '
                                                  : 'Bem vinda, ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineLarge
                                                  .override(
                                                    font: GoogleFonts.geologica(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: FFAppState().gender,
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: ' ',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFAppState().displayName,
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                font: GoogleFonts.geologica(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  }
                                },
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    valueOrDefault<double>(
                                      FFAppConstants.doubleGap,
                                      0.0,
                                    ),
                                    0.0,
                                    valueOrDefault<double>(
                                      FFAppConstants.Gap,
                                      0.0,
                                    )),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Olá, muito prazer!',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontStyle,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          font: GoogleFonts.geologica(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                          },
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Enviamos um código de acesso por SMS.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Verifique e volte aqui para preencher.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                      ],
                    ),
                  ],
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                PinCodeTextField(
                                  autoDisposeControllers: false,
                                  appContext: context,
                                  length: 6,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.geologica(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  enableActiveFill: false,
                                  autoFocus: true,
                                  focusNode: _model.pinCodeFocusNode,
                                  enablePinAutofill: false,
                                  errorTextSpace: 16.0,
                                  showCursor: true,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  obscureText: false,
                                  keyboardType: TextInputType.number,
                                  pinTheme: PinTheme(
                                    fieldHeight: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height * 0.06,
                                      44.0,
                                    ),
                                    fieldWidth: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height * 0.06,
                                      44.0,
                                    ),
                                    borderWidth:
                                        MediaQuery.sizeOf(context).height *
                                            0.02,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          FFAppConstants.borderS),
                                      bottomRight: Radius.circular(
                                          FFAppConstants.borderS),
                                      topLeft: Radius.circular(
                                          FFAppConstants.borderS),
                                      topRight: Radius.circular(
                                          FFAppConstants.borderS),
                                    ),
                                    shape: PinCodeFieldShape.box,
                                    activeColor: _model.pincodeborder,
                                    inactiveColor:
                                        FlutterFlowTheme.of(context).accent2,
                                    selectedColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                  controller: _model.pinCodeController,
                                  onChanged: (_) async {
                                    logFirebaseEvent(
                                        'LOGIN_PHONE_CODE_PinCode_za0pm7ac_ON_TEX');
                                    if (_model.pinCodeController!.text !=
                                            null &&
                                        _model.pinCodeController!.text != '') {
                                      logFirebaseEvent(
                                          'PinCode_update_page_state');
                                      _model.pincodeborder =
                                          FlutterFlowTheme.of(context)
                                              .primaryText;
                                      safeSetState(() {});
                                      return;
                                    } else {
                                      logFirebaseEvent(
                                          'PinCode_update_page_state');
                                      _model.pincodeborder =
                                          FlutterFlowTheme.of(context).accent2;
                                      safeSetState(() {});
                                      return;
                                    }
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: _model.pinCodeControllerValidator
                                      .asValidator(context),
                                ),
                                if (_model.pincodeborder ==
                                    FlutterFlowTheme.of(context).error)
                                  Text(
                                    'Código inválido. Verifique e tente novamente.',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.geologica(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
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
                              ],
                            ),
                            FFButtonWidget(
                              onPressed: ((_model.pinCodeController!.text ==
                                              null ||
                                          _model.pinCodeController!.text ==
                                              '') ||
                                      (_model.timerMilliseconds == 0))
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'LOGIN_PHONE_CODE_CONTINUAR_BTN_ON_TAP');
                                      if (FFAppState().wasUser) {
                                        logFirebaseEvent(
                                            'Button_custom_action');
                                        _model.otpPhoneConfirm =
                                            await actions.otpPhoneConfirm(
                                          _model.pinCodeController!.text,
                                          widget!.phoneOnlynumbers!,
                                        );
                                        if (_model.otpPhoneConfirm!) {
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.goNamed(
                                              HomePageWidget.routeName);
                                        } else {
                                          logFirebaseEvent(
                                              'Button_update_page_state');
                                          _model.pincodeborder =
                                              FlutterFlowTheme.of(context)
                                                  .error;
                                          safeSetState(() {});
                                        }
                                      } else {
                                        logFirebaseEvent('Button_backend_call');
                                        _model.verifySMS =
                                            await ConfirmSMSverifyCall.call(
                                          phone: widget!.phoneOnlynumbers,
                                          code: _model.pinCodeController!.text,
                                        );

                                        if ((_model.verifySMS?.succeeded ??
                                            true)) {
                                          logFirebaseEvent(
                                              'Button_navigate_to');
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            Cadastro1Widget.routeName,
                                            queryParameters: {
                                              'camefrom': serializeParam(
                                                'phone',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'Button_update_page_state');
                                          _model.pincodeborder =
                                              FlutterFlowTheme.of(context)
                                                  .error;
                                          safeSetState(() {});
                                        }
                                      }

                                      safeSetState(() {});
                                    },
                              text: 'Continuar',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.06,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
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
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                                hoverColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          ].divide(SizedBox(height: FFAppConstants.Gap)),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if (_model.timerMilliseconds > 0) {
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'O código expira em',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
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
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: FlutterFlowTimer(
                                    initialTime: _model.timerInitialTimeMs,
                                    getDisplayTime: (value) =>
                                        StopWatchTimer.getDisplayTime(
                                      value,
                                      hours: false,
                                      milliSecond: false,
                                    ),
                                    controller: _model.timerController,
                                    updateStateInterval:
                                        Duration(milliseconds: 1000),
                                    onChanged:
                                        (value, displayTime, shouldUpdate) {
                                      _model.timerMilliseconds = value;
                                      _model.timerValue = displayTime;
                                      if (shouldUpdate) safeSetState(() {});
                                    },
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
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
                                  ),
                                ),
                              ].divide(SizedBox(width: FFAppConstants.halfGap)),
                            );
                          } else {
                            return FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LOGIN_PHONE_CODE_REENVIAR_CDIGO_BTN_ON_T');
                                logFirebaseEvent('Button_alert_dialog');
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Reenviar código'),
                                              content: Text(
                                                  'Deseja enviar um novo código?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Sim'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Não'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  logFirebaseEvent('Button_reset_form_fields');
                                  safeSetState(() {
                                    _model.pinCodeController?.clear();
                                  });
                                } else {
                                  logFirebaseEvent('Button_reset_form_fields');
                                  safeSetState(() {
                                    _model.pinCodeController?.clear();
                                  });
                                  if (FFAppState().wasUser) {
                                    logFirebaseEvent('Button_custom_action');
                                    await actions.otpPhone(
                                      widget!.phoneOnlynumbers!,
                                    );
                                  } else {
                                    logFirebaseEvent('Button_backend_call');
                                    _model.apiResultst3 =
                                        await SendSMSverifyCall.call(
                                      phone: widget!.phoneOnlynumbers,
                                    );
                                  }

                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Novo código enviado por SMS! Verifique novamente.',
                                        style: FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                              lineHeight: 1.0,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 6000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  logFirebaseEvent('Button_timer');
                                  _model.timerController.onResetTimer();

                                  logFirebaseEvent('Button_timer');
                                  _model.timerController.onStartTimer();
                                }

                                safeSetState(() {});
                              },
                              text: 'Reenviar código',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 22.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
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
                            );
                          }
                        },
                      ),
                    ].divide(SizedBox(height: 40.0)),
                  ),
                ),
              ]
                  .divide(SizedBox(height: FFAppConstants.doubleGap))
                  .around(SizedBox(height: FFAppConstants.doubleGap)),
            ),
          ),
        ),
      ),
    );
  }
}
