import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_email_model.dart';
export 'login_email_model.dart';

class LoginEmailWidget extends StatefulWidget {
  const LoginEmailWidget({super.key});

  static String routeName = 'LoginEmail';
  static String routePath = '/loginEmail';

  @override
  State<LoginEmailWidget> createState() => _LoginEmailWidgetState();
}

class _LoginEmailWidgetState extends State<LoginEmailWidget> {
  late LoginEmailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginEmailModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LoginEmail'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOGIN_EMAIL_LoginEmail_ON_INIT_STATE');
      logFirebaseEvent('LoginEmail_update_page_state');
      _model.emailborder = Color(4293256677);
      safeSetState(() {});
    });

    _model.eMailTextController ??= TextEditingController();
    _model.eMailFocusNode ??= FocusNode();
    _model.eMailFocusNode!.addListener(() => safeSetState(() {}));
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
                  mainAxisSize: MainAxisSize.max,
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
                    mainAxisSize: MainAxisSize.max,
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
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.eMailTextController,
                                        focusNode: _model.eMailFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.eMailTextController',
                                          Duration(milliseconds: 0),
                                          () async {
                                            logFirebaseEvent(
                                                'LOGIN_EMAIL_E-mail_ON_TEXTFIELD_CHANGE');
                                            if (_model
                                                    .eMailTextController.text !=
                                                '') {
                                              logFirebaseEvent(
                                                  'E-mail_update_page_state');
                                              _model.emailborder =
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText;
                                              safeSetState(() {});
                                              return;
                                            } else {
                                              logFirebaseEvent(
                                                  'E-mail_update_page_state');
                                              _model.emailborder =
                                                  FlutterFlowTheme.of(context)
                                                      .accent2;
                                              safeSetState(() {});
                                              return;
                                            }
                                          },
                                        ),
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          alignLabelWithHint: false,
                                          hintText: 'e-mail@dominio.com',
                                          errorStyle: FlutterFlowTheme.of(
                                                  context)
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
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
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: valueOrDefault<Color>(
                                                _model.emailborder,
                                                FlutterFlowTheme.of(context)
                                                    .accent2,
                                              ),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(
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
                                            borderRadius: BorderRadius.circular(
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
                                            borderRadius: BorderRadius.circular(
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
                                            borderRadius: BorderRadius.circular(
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
                                            FFIcons.kmail,
                                            size: 14.0,
                                          ),
                                          suffixIcon: _model
                                                  .eMailTextController!
                                                  .text
                                                  .isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    _model.eMailTextController
                                                        ?.clear();
                                                    logFirebaseEvent(
                                                        'LOGIN_EMAIL_E-mail_ON_TEXTFIELD_CHANGE');
                                                    if (_model
                                                            .eMailTextController
                                                            .text !=
                                                        '') {
                                                      logFirebaseEvent(
                                                          'E-mail_update_page_state');
                                                      _model.emailborder =
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText;
                                                      safeSetState(() {});
                                                      return;
                                                    } else {
                                                      logFirebaseEvent(
                                                          'E-mail_update_page_state');
                                                      _model.emailborder =
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
                                                    color: FlutterFlowTheme.of(
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
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .eMailTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          if (!isAndroid && !isiOS)
                                            TextInputFormatter.withFunction(
                                                (oldValue, newValue) {
                                              return TextEditingValue(
                                                selection: newValue.selection,
                                                text: newValue.text
                                                    .toCapitalization(
                                                        TextCapitalization
                                                            .none),
                                              );
                                            }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.emailborder ==
                                    FlutterFlowTheme.of(context).error)
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Endereço de e-mail inválido',
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
                                  ),
                              ].divide(
                                  SizedBox(height: FFAppConstants.halfGap)),
                            ),
                            FFButtonWidget(
                              onPressed: (_model.eMailTextController.text ==
                                          null ||
                                      _model.eMailTextController.text == '')
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'LOGIN_EMAIL_PAGE_CONTINUAR_BTN_ON_TAP');
                                      var _shouldSetState = false;
                                      logFirebaseEvent('Button_backend_call');
                                      _model.getemail =
                                          await GetIdfromEmailCall.call(
                                        inputEmail: _model
                                            .eMailTextController.text
                                            .toLowerCase(),
                                      );

                                      _shouldSetState = true;
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().wasUser =
                                          (_model.getemail?.bodyText ?? '') !=
                                              'null';
                                      FFAppState().inputEmail = _model
                                          .eMailTextController.text
                                          .toLowerCase();
                                      FFAppState().update(() {});
                                      if (FFAppState().wasUser) {
                                        logFirebaseEvent('Button_backend_call');
                                        _model.queryUser =
                                            await UserProfileTable().queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'id',
                                            (_model.getemail?.jsonBody ?? '')
                                                .toString(),
                                          ),
                                        );
                                        _shouldSetState = true;
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().displayName = _model
                                            .queryUser!
                                            .firstOrNull!
                                            .displayname!;
                                        FFAppState().gender = _model
                                            .queryUser!.firstOrNull!.gender!;
                                        FFAppState().profilepicture = _model
                                            .queryUser!
                                            .firstOrNull!
                                            .profilepicture!;
                                        FFAppState().estadoUF = _model
                                            .queryUser!.firstOrNull!.uFindex;
                                        FFAppState().update(() {});
                                        logFirebaseEvent('Button_backend_call');
                                        _model.isTester =
                                            await AretheytesterCall.call(
                                          userId:
                                              (_model.getemail?.jsonBody ?? '')
                                                  .toString(),
                                        );

                                        _shouldSetState = true;
                                        if ((_model.isTester?.jsonBody ?? '')) {
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed(
                                              LoginPasswordWidget.routeName);
                                        } else {
                                          logFirebaseEvent(
                                              'Button_custom_action');
                                          _model.magiclinksent =
                                              await actions.otpEmailMagic(
                                            _model.eMailTextController.text
                                                .toLowerCase(),
                                          );
                                          _shouldSetState = true;
                                          if (!_model.magiclinksent!) {
                                            logFirebaseEvent(
                                                'Button_update_page_state');
                                            _model.emailborder =
                                                FlutterFlowTheme.of(context)
                                                    .error;
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                        }
                                      } else {
                                        logFirebaseEvent('Button_backend_call');
                                        _model.sendVerifyEmail =
                                            await SendVerifyEmailCall.call(
                                          email: _model.eMailTextController.text
                                              .toLowerCase(),
                                        );

                                        _shouldSetState = true;
                                        if (!(_model
                                                .sendVerifyEmail?.succeeded ??
                                            true)) {
                                          logFirebaseEvent(
                                              'Button_update_page_state');
                                          _model.emailborder =
                                              FlutterFlowTheme.of(context)
                                                  .error;
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }

                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                          LoginMagicLinkWidget.routeName);

                                      if (_shouldSetState) safeSetState(() {});
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
                        child: Container(
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
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ],
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
                            0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LOGIN_EMAIL_CONTINUAR_COM_TELEFONE_BTN_O');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(LoginPhoneWidget.routeName);
                              },
                              text: 'Continuar com Telefone',
                              icon: Icon(
                                FFIcons.ksmartphone,
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
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LOGIN_EMAIL_CONTINUAR_COM_GOOGLE_BTN_ON_');
                                var _shouldSetState = false;
                                logFirebaseEvent('Button_auth');
                                GoRouter.of(context).prepareAuthEvent();
                                final user =
                                    await authManager.signInWithGoogle(context);
                                if (user == null) {
                                  return;
                                }
                                logFirebaseEvent('Button_backend_call');
                                _model.queryUserGoogle =
                                    await UserProfileTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'id',
                                    currentUserUid,
                                  ),
                                );
                                _shouldSetState = true;
                                logFirebaseEvent('Button_custom_action');
                                _model.googleFullName =
                                    await actions.getGoogleNames();
                                _shouldSetState = true;
                                if (_model.queryUserGoogle!
                                    .where((e) => e.role == 'free')
                                    .toList()
                                    .isNotEmpty) {
                                  logFirebaseEvent('Button_update_app_state');
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
                                  FFAppState().wasUser = true;
                                  safeSetState(() {});
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamedAuth(
                                      HomePageWidget.routeName,
                                      context.mounted);
                                } else {
                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().inputEmail = currentUserEmail;
                                  FFAppState().wasUser = false;
                                  safeSetState(() {});
                                  if (_model
                                          .queryUserGoogle?.firstOrNull?.role !=
                                      'signup') {
                                    logFirebaseEvent('Button_alert_dialog');
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
                                    logFirebaseEvent('Button_navigate_to');

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
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LOGIN_EMAIL_CONTINUAR_COM_APPLE_BTN_ON_T');
                                var _shouldSetState = false;
                                logFirebaseEvent('Button_custom_action');
                                _model.appleData = await actions.loginApple(
                                  context,
                                );
                                _shouldSetState = true;
                                logFirebaseEvent('Button_backend_call');
                                _model.queryAppleUser =
                                    await UserProfileTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'id',
                                    _model.appleData?.elementAtOrNull(2),
                                  ),
                                );
                                _shouldSetState = true;
                                if (_model.queryAppleUser!
                                    .where((e) => e.role == 'free')
                                    .toList()
                                    .isNotEmpty) {
                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().displayName = _model
                                      .queryAppleUser!
                                      .firstOrNull!
                                      .displayname!;
                                  FFAppState().gender = _model
                                      .queryAppleUser!.firstOrNull!.gender!;
                                  FFAppState().profilepicture = _model
                                      .queryAppleUser!
                                      .firstOrNull!
                                      .profilepicture!;
                                  FFAppState().wasUser = true;
                                  safeSetState(() {});
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed(HomePageWidget.routeName);
                                } else {
                                  if (_model
                                          .queryAppleUser?.firstOrNull?.role !=
                                      'signup') {
                                    logFirebaseEvent('Button_alert_dialog');
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
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().inputEmail =
                                        currentUserEmail != null &&
                                                currentUserEmail != ''
                                            ? currentUserEmail
                                            : _model.appleData!.lastOrNull!;
                                    FFAppState().wasUser = false;
                                    safeSetState(() {});
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      Cadastro1Widget.routeName,
                                      queryParameters: {
                                        'camefrom': serializeParam(
                                          'apple',
                                          ParamType.String,
                                        ),
                                        'appleFullName': serializeParam(
                                          _model.appleData,
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
                        logFirebaseEvent(
                            'LOGIN_EMAIL_PRECISA_DE_AJUDA_BTN_ON_TAP');
                        logFirebaseEvent('Button_custom_action');
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
                        logFirebaseEvent(
                            'LOGIN_EMAIL_TERMOS_DE_USO_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

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
              ]
                  .divide(SizedBox(height: 40.0))
                  .addToStart(SizedBox(height: FFAppConstants.doubleGap)),
            ),
          ),
        ),
      ),
    );
  }
}
