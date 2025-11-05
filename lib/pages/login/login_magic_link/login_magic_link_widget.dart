import '/auth/supabase_auth/auth_util.dart';
import '/components/cadastro/back_top_bar/back_top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_magic_link_model.dart';
export 'login_magic_link_model.dart';

class LoginMagicLinkWidget extends StatefulWidget {
  const LoginMagicLinkWidget({super.key});

  static String routeName = 'LoginMagicLink';
  static String routePath = '/loginMagicLink';

  @override
  State<LoginMagicLinkWidget> createState() => _LoginMagicLinkWidgetState();
}

class _LoginMagicLinkWidgetState extends State<LoginMagicLinkWidget> {
  late LoginMagicLinkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginMagicLinkModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LoginMagicLink'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOGIN_MAGIC_LINK_LoginMagicLink_ON_INIT_');
      logFirebaseEvent('LoginMagicLink_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 1000,
        ),
      );
      logFirebaseEvent('LoginMagicLink_timer');
      _model.timerController.onStartTimer();
    });

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.backTopBarModel,
                updateCallback: () => safeSetState(() {}),
                child: BackTopBarWidget(
                  logo: false,
                  backButton: () async {
                    logFirebaseEvent(
                        'LOGIN_MAGIC_LINK_Container_cauc43l1_CALL');
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (FFAppState().wasUser) {
                                  return Builder(
                                    builder: (context) {
                                      if (FFAppState().gender ==
                                          'Prefiro não informar') {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Olá, ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .geologica(
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
                                                  text:
                                                      FFAppState().displayName,
                                                  style: TextStyle(),
                                                )
                                              ],
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
                                            textAlign: TextAlign.center,
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFAppState().gender ==
                                                          'Dr.'
                                                      ? 'Bem vindo, '
                                                      : 'Bem vinda, ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .geologica(
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
                                                  text:
                                                      FFAppState().displayName,
                                                  style: TextStyle(),
                                                )
                                              ],
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
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Olá, muito prazer!',
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Enviamos um e-mail de confirmação.',
                                    textAlign: TextAlign.center,
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
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Acesse nesse mesmo dispositvo e clique no link.',
                                    textAlign: TextAlign.center,
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
                              ],
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: FFAppConstants.halfGap)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: currentUserEmailVerified
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'LOGIN_MAGIC_LINK_ABRIR_E_MAIL_BTN_ON_TAP');
                                    logFirebaseEvent('Button_custom_action');
                                    await actions.openMail(
                                      context,
                                    );
                                  },
                            text: 'Abrir e-mail',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.06,
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
                              borderRadius:
                                  BorderRadius.circular(valueOrDefault<double>(
                                FFAppConstants.borderS,
                                0.0,
                              )),
                              disabledColor:
                                  FlutterFlowTheme.of(context).accent2,
                              disabledTextColor:
                                  FlutterFlowTheme.of(context).accent3,
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: !currentUserEmailVerified
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'LOGIN_MAGIC_LINK_CONTINUAR_BTN_ON_TAP');
                                    if (FFAppState().wasUser) {
                                      logFirebaseEvent('Button_navigate_to');

                                      context.goNamed(HomePageWidget.routeName);
                                    } else {
                                      logFirebaseEvent('Button_navigate_to');
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        Cadastro1Widget.routeName,
                                        queryParameters: {
                                          'camefrom': serializeParam(
                                            'email',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                            text: 'Continuar',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.06,
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
                              borderRadius:
                                  BorderRadius.circular(valueOrDefault<double>(
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
                                        'O link expira em ',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  ].divide(
                                      SizedBox(width: FFAppConstants.halfGap)),
                                );
                              } else {
                                return FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'Reenviar link',
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
                                              .secondaryText,
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
                                    borderRadius: BorderRadius.circular(110.0),
                                  ),
                                );
                              }
                            },
                          ),
                        ].divide(SizedBox(height: FFAppConstants.doubleGap)),
                      ),
                    ),
                  ].divide(SizedBox(height: FFAppConstants.doubleGap)),
                ),
              ),
            ]
                .divide(SizedBox(height: FFAppConstants.doubleGap))
                .around(SizedBox(height: FFAppConstants.doubleGap)),
          ),
        ),
      ),
    );
  }
}
