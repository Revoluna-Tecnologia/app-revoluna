import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/dialogs/negative_informative_box/negative_informative_box_widget.dart';
import '/components/loading/dropdown_loading/dropdown_loading_widget.dart';
import '/components/loading/pages/initial_loading/initial_loading_widget.dart';
import '/components/vagas/card_vagas_initial/card_vagas_initial_widget.dart';
import '/components/vagas/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/other/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'initial_page_model.dart';
export 'initial_page_model.dart';

class InitialPageWidget extends StatefulWidget {
  const InitialPageWidget({super.key});

  static String routeName = 'InitialPage';
  static String routePath = '/initialPage';

  @override
  State<InitialPageWidget> createState() => _InitialPageWidgetState();
}

class _InitialPageWidgetState extends State<InitialPageWidget> {
  late InitialPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitialPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'InitialPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      logFirebaseEvent('INITIAL_InitialPage_ON_INIT_STATE');
      logFirebaseEvent('InitialPage_custom_action');
      await actions.conciergenumber();
      logFirebaseEvent('InitialPage_custom_action');
      await actions.markAppAsLoaded();
      logFirebaseEvent('InitialPage_update_app_state');
      FFAppState().selectedDay = functions.currentDate();
      safeSetState(() {});
      logFirebaseEvent('InitialPage_refresh_database_request');
      safeSetState(() {
        FFAppState().clearVagasAbertasInicialCache();
        _model.requestCompleted3 = false;
      });
      await _model.waitForRequestCompleted3();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<VwVagasAbertasRow>>(
      future: FFAppState()
          .vagasAbertasInicial(
        requestFn: () => VwVagasAbertasTable().queryRows(
          queryFn: (q) => q.order('vaga_valor'),
        ),
      )
          .then((result) {
        _model.requestCompleted3 = true;
        return result;
      }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: InitialLoadingWidget(),
          );
        }
        List<VwVagasAbertasRow> initialPageVwVagasAbertasRowList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              floatingActionButton: Builder(
                builder: (context) => Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 98.0),
                  child: FloatingActionButton(
                    onPressed: () async {
                      logFirebaseEvent(
                          'INITIAL_FloatingActionButton_dex7mwlp_ON');
                      logFirebaseEvent('FloatingActionButton_custom_action');
                      _model.whatsappInitial = await actions.launchWhatsAppChat(
                        'Olá, visitei a Revoluna e fiquei com uma dúvida',
                        FFAppState().concierge,
                      );
                      if (!_model.whatsappInitial!) {
                        logFirebaseEvent('FloatingActionButton_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(dialogContext).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: NegativeInformativeBoxWidget(
                                  title: 'Necessário WhatsApp',
                                  body:
                                      'Para prosseguir é preciso ter o aplicativo WhatsaApp instalado no seu  aparelho',
                                ),
                              ),
                            );
                          },
                        );
                      }

                      safeSetState(() {});
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                            ),
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                top: true,
                child: SafeArea(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            FFAppConstants.doubleGap,
                            0.0,
                          ),
                          0.0,
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
                                valueOrDefault<double>(
                                  FFAppConstants.Gap,
                                  0.0,
                                )),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      valueOrDefault<double>(
                                        FFAppConstants.halfGap,
                                        0.0,
                                      ),
                                      0.0,
                                      0.0,
                                      0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: SvgPicture.asset(
                                      'assets/images/logo.svg',
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.025,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      0.0,
                                      valueOrDefault<double>(
                                        FFAppConstants.halfGap,
                                        0.0,
                                      ),
                                      0.0),
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    child: Stack(
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Entrar',
                                              style: FlutterFlowTheme.of(
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
                                            Builder(
                                              builder: (context) {
                                                if (FFAppState()
                                                            .profilepicture !=
                                                        null &&
                                                    FFAppState()
                                                            .profilepicture !=
                                                        '') {
                                                  return Hero(
                                                    tag: FFAppState()
                                                        .profilepicture,
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: Container(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        FFAppState()
                                                            .profilepicture,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Container(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/Avatar.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ].divide(SizedBox(
                                              width: FFAppConstants.Gap)),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'INITIAL_PAGE_PAGE__BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamed(
                                              LoginPhoneWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                ),
                                              },
                                            );
                                          },
                                          text: '',
                                          options: FFButtonOptions(
                                            width: 100.0,
                                            height: double.infinity,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x00A369ED),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                                BorderRadius.circular(100.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: RefreshIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                              onRefresh: () async {
                                logFirebaseEvent(
                                    'INITIAL_Column_v2uvsmzz_ON_PULL_TO_REFRE');
                                logFirebaseEvent(
                                    'Column_refresh_database_request');
                                safeSetState(() {
                                  FFAppState().clearVagasAbertasInicialCache();
                                  _model.requestCompleted3 = false;
                                });
                                await _model.waitForRequestCompleted3();
                                logFirebaseEvent(
                                    'Column_refresh_database_request');
                                safeSetState(() {
                                  FFAppState().clearEstadosCache();
                                  _model.requestCompleted2 = false;
                                });
                                await _model.waitForRequestCompleted2();
                                logFirebaseEvent(
                                    'Column_refresh_database_request');
                                safeSetState(() {
                                  _model.clearBannersCache();
                                  _model.requestCompleted1 = false;
                                });
                                await _model.waitForRequestCompleted1();
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
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
                                      child: FutureBuilder<List<BannerMktRow>>(
                                        future: _model
                                            .banners(
                                          requestFn: () =>
                                              BannerMktTable().queryRows(
                                            queryFn: (q) => q,
                                          ),
                                        )
                                            .then((result) {
                                          _model.requestCompleted1 = true;
                                          return result;
                                        }),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<BannerMktRow>
                                              bannerBannerMktRowList =
                                              snapshot.data!;

                                          return ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                valueOrDefault<double>(
                                              FFAppConstants.borderM,
                                              0.0,
                                            )),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        valueOrDefault<double>(
                                                  FFAppConstants.borderM,
                                                  0.0,
                                                )),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.2,
                                                child: CarouselSlider(
                                                  items: [
                                                    Stack(
                                                      children: [
                                                        CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl:
                                                              bannerBannerMktRowList
                                                                  .elementAtOrNull(
                                                                      0)!
                                                                  .imgpath!,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ],
                                                    ),
                                                    Stack(
                                                      children: [
                                                        CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl:
                                                              bannerBannerMktRowList
                                                                  .elementAtOrNull(
                                                                      1)!
                                                                  .imgpath!,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'INITIAL_PAGE_PAGE__BTN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Button_custom_action');
                                                            await actions
                                                                .requestLocationPermission();
                                                          },
                                                          text: '',
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0x00A369ED),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
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
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Stack(
                                                      children: [
                                                        CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl:
                                                              bannerBannerMktRowList
                                                                  .elementAtOrNull(
                                                                      2)!
                                                                  .imgpath!,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Builder(
                                                          builder: (context) =>
                                                              FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'INITIAL_PAGE_PAGE__BTN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Button_custom_action');
                                                              _model.whatsappBanner =
                                                                  await actions
                                                                      .launchWhatsAppChat(
                                                                'Olá, visitei a Revoluna e fiquei com uma dúvida',
                                                                FFAppState()
                                                                    .concierge,
                                                              );
                                                              if (!_model
                                                                  .whatsappBanner!) {
                                                                logFirebaseEvent(
                                                                    'Button_alert_dialog');
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            NegativeInformativeBoxWidget(
                                                                          title:
                                                                              'Necessário WhatsApp',
                                                                          body:
                                                                              'Para prosseguir é preciso ter o aplicativo WhatsaApp instalado no seu  aparelho',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: '',
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0x00A369ED),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Stack(
                                                      children: [
                                                        CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl:
                                                              bannerBannerMktRowList
                                                                  .elementAtOrNull(
                                                                      3)!
                                                                  .imgpath!,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'INITIAL_PAGE_PAGE__BTN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Button_navigate_to');

                                                            context.pushNamed(
                                                                LoginPhoneWidget
                                                                    .routeName);
                                                          },
                                                          text: '',
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0x00A369ED),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
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
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                  carouselController: _model
                                                          .carouselController ??=
                                                      CarouselSliderController(),
                                                  options: CarouselOptions(
                                                    initialPage: 1,
                                                    viewportFraction: 1.0,
                                                    disableCenter: true,
                                                    enlargeCenterPage: false,
                                                    enlargeFactor: 0.0,
                                                    enableInfiniteScroll: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    autoPlay: true,
                                                    autoPlayAnimationDuration:
                                                        Duration(
                                                            milliseconds: 500),
                                                    autoPlayInterval: Duration(
                                                        milliseconds:
                                                            (500 + 10000)),
                                                    autoPlayCurve:
                                                        Curves.linear,
                                                    pauseAutoPlayInFiniteScroll:
                                                        true,
                                                    onPageChanged: (index, _) =>
                                                        _model.carouselCurrentIndex =
                                                            index,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
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
                                                    valueOrDefault<double>(
                                                      FFAppConstants.Gap,
                                                      0.0,
                                                    ),
                                                    valueOrDefault<double>(
                                                      FFAppConstants.Gap,
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child:
                                                custom_widgets.CustomCalendar(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.1,
                                              weekViewEnabled:
                                                  _model.calendarView,
                                              openVagas:
                                                  initialPageVwVagasAbertasRowList
                                                      .where((e) =>
                                                          e.hospitalEstado ==
                                                          FFAppState().estadoUF)
                                                      .toList()
                                                      .unique((e) => e.vagaId!)
                                                      .map((e) => e.vagaData)
                                                      .withoutNulls
                                                      .toList()
                                                      .sortedList(
                                                          keyOf: (e) => e,
                                                          desc: false),
                                              callback: () async {
                                                logFirebaseEvent(
                                                    'INITIAL_Container_tvdoi6qs_CALLBACK');
                                                logFirebaseEvent(
                                                    'CustomCalendar_refresh_database_request');
                                                safeSetState(() {
                                                  FFAppState()
                                                      .clearEstadosCache();
                                                  _model.requestCompleted2 =
                                                      false;
                                                });
                                                await _model
                                                    .waitForRequestCompleted2();
                                              },
                                            ),
                                          ),
                                          ToggleIcon(
                                            onPressed: () async {
                                              safeSetState(() =>
                                                  _model.calendarView =
                                                      !_model.calendarView);
                                            },
                                            value: _model.calendarView,
                                            onIcon: Icon(
                                              FFIcons.kchevronDown,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                            offIcon: Icon(
                                              FFIcons.kchevronUp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (initialPageVwVagasAbertasRowList
                                        .where((e) =>
                                            e.vagaData ==
                                            FFAppState().selectedDay)
                                        .toList()
                                        .isNotEmpty)
                                      StickyHeader(
                                        overlapHeaders: false,
                                        header: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCircle,
                                                    color: Color(0xFF9FEB0F),
                                                    size: 14.0,
                                                  ),
                                                  Text(
                                                    'Plantões disponíveis',
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
                                                ]
                                                    .divide(SizedBox(
                                                        width:
                                                            FFAppConstants.Gap))
                                                    .addToStart(SizedBox(
                                                        width: FFAppConstants
                                                            .doubleGap))
                                                    .addToEnd(SizedBox(
                                                        width: FFAppConstants
                                                            .doubleGap)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .dropDownValueController1 ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.dropDownValue1 ??=
                                                            '',
                                                      ),
                                                      options: List<String>.from(initialPageVwVagasAbertasRowList
                                                          .where((e) =>
                                                              (e.hospitalEstado ==
                                                                  FFAppState()
                                                                      .estadoUF) &&
                                                              (e.vagaData ==
                                                                  FFAppState()
                                                                      .selectedDay))
                                                          .toList()
                                                          .unique((e) => e
                                                              .especialidadeId!)
                                                          .sortedList(
                                                              keyOf: (e) => e
                                                                  .especialidadeNome!,
                                                              desc: false)
                                                          .map((e) =>
                                                              e.especialidadeId)
                                                          .withoutNulls
                                                          .toList()),
                                                      optionLabels: initialPageVwVagasAbertasRowList
                                                          .where((e) =>
                                                              (e.vagaData ==
                                                                  FFAppState()
                                                                      .selectedDay) &&
                                                              (e.hospitalEstado ==
                                                                  FFAppState()
                                                                      .estadoUF))
                                                          .toList()
                                                          .unique((e) => e
                                                              .especialidadeId!)
                                                          .sortedList(
                                                              keyOf: (e) => e
                                                                  .especialidadeNome!,
                                                              desc: false)
                                                          .map((e) => e
                                                              .especialidadeNome)
                                                          .withoutNulls
                                                          .toList(),
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.dropDownValue1 =
                                                                  val),
                                                      width: 200.0,
                                                      height: 40.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .geologica(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintText: 'Especialidade',
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
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
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderWidth: 0.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: FutureBuilder<
                                                        List<EstadosBrasilRow>>(
                                                      future: FFAppState()
                                                          .estados(
                                                        requestFn: () =>
                                                            EstadosBrasilTable()
                                                                .queryRows(
                                                          queryFn: (q) =>
                                                              q.inFilterOrNull(
                                                            'sigla',
                                                            initialPageVwVagasAbertasRowList
                                                                .where((e) =>
                                                                    e.vagaData ==
                                                                    FFAppState()
                                                                        .selectedDay)
                                                                .toList()
                                                                .unique((e) => e
                                                                    .hospitalEstado!)
                                                                .map((e) => e
                                                                    .hospitalEstado)
                                                                .withoutNulls
                                                                .toList(),
                                                          ),
                                                        ),
                                                      )
                                                          .then((result) {
                                                        _model.requestCompleted2 =
                                                            true;
                                                        return result;
                                                      }),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return DropdownLoadingWidget();
                                                        }
                                                        List<EstadosBrasilRow>
                                                            dropDownEstadosBrasilRowList =
                                                            snapshot.data!;

                                                        return FlutterFlowDropDown<
                                                            String>(
                                                          controller: _model
                                                                  .dropDownValueController2 ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model
                                                                .dropDownValue2 ??= FFAppState()
                                                                            .estadoUF !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .estadoUF !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .estadoUF
                                                                : 'SP',
                                                          ),
                                                          options: List<
                                                                  String>.from(
                                                              initialPageVwVagasAbertasRowList
                                                                  .where((e) =>
                                                                      e.vagaData ==
                                                                      FFAppState()
                                                                          .selectedDay)
                                                                  .toList()
                                                                  .unique((e) => e
                                                                      .hospitalEstado!)
                                                                  .map((e) => e
                                                                      .hospitalEstado)
                                                                  .withoutNulls
                                                                  .toList()
                                                                  .sortedList(
                                                                      keyOf:
                                                                          (e) =>
                                                                              e,
                                                                      desc:
                                                                          false)),
                                                          optionLabels:
                                                              dropDownEstadosBrasilRowList
                                                                  .sortedList(
                                                                      keyOf: (e) => e
                                                                          .sigla!,
                                                                      desc:
                                                                          false)
                                                                  .map((e) =>
                                                                      e.nome)
                                                                  .withoutNulls
                                                                  .toList(),
                                                          onChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.dropDownValue2 =
                                                                    val);
                                                            logFirebaseEvent(
                                                                'INITIAL_DropDown_q87qn1xo_ON_FORM_WIDGET');
                                                            logFirebaseEvent(
                                                                'DropDown_update_app_state');
                                                            FFAppState()
                                                                    .estadoUF =
                                                                _model
                                                                    .dropDownValue2!;
                                                            FFAppState()
                                                                    .estadoUFIndex =
                                                                dropDownEstadosBrasilRowList
                                                                    .where((e) =>
                                                                        e.sigla ==
                                                                        _model
                                                                            .dropDownValue2)
                                                                    .toList()
                                                                    .firstOrNull!
                                                                    .id;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'DropDown_refresh_database_request');
                                                            safeSetState(() {
                                                              FFAppState()
                                                                  .clearVagasAbertasInicialCache();
                                                              _model.requestCompleted3 =
                                                                  false;
                                                            });
                                                            await _model
                                                                .waitForRequestCompleted3();
                                                          },
                                                          width: 200.0,
                                                          height: 40.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .geologica(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                          hintText: 'Região',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          borderWidth: 0.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ]
                                                    .divide(SizedBox(
                                                        width:
                                                            FFAppConstants.Gap))
                                                    .around(SizedBox(
                                                        width: FFAppConstants
                                                            .Gap)),
                                              ),
                                            ]
                                                .divide(SizedBox(
                                                    height: FFAppConstants.Gap))
                                                .around(SizedBox(
                                                    height:
                                                        FFAppConstants.Gap)),
                                          ),
                                        ),
                                        content: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              if (initialPageVwVagasAbertasRowList
                                                  .where((e) =>
                                                      e.hospitalEstado ==
                                                      FFAppState().estadoUF)
                                                  .toList()
                                                  .isNotEmpty) {
                                                return Builder(
                                                  builder: (context) {
                                                    if (_model.dropDownValue1 !=
                                                            null &&
                                                        _model.dropDownValue1 !=
                                                            '') {
                                                      return Builder(
                                                        builder: (context) {
                                                          final filteredList = initialPageVwVagasAbertasRowList
                                                              .where((e) =>
                                                                  (e.vagaData == FFAppState().selectedDay) &&
                                                                  (e.hospitalEstado ==
                                                                      FFAppState()
                                                                          .estadoUF) &&
                                                                  (e.especialidadeId ==
                                                                      _model
                                                                          .dropDownValue1))
                                                              .toList();
                                                          if (filteredList
                                                              .isEmpty) {
                                                            return EmptyListWidget(
                                                              text:
                                                                  'Sem vagas para mostrar',
                                                            );
                                                          }

                                                          return ListView
                                                              .separated(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        2.0),
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                filteredList
                                                                    .length,
                                                            separatorBuilder:
                                                                (_, __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            2.0),
                                                            itemBuilder: (context,
                                                                filteredListIndex) {
                                                              final filteredListItem =
                                                                  filteredList[
                                                                      filteredListIndex];
                                                              return Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .cardVagasInitialModels1
                                                                          .getModel(
                                                                        filteredListItem
                                                                            .vagaId!,
                                                                        filteredListIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          CardVagasInitialWidget(
                                                                        key:
                                                                            Key(
                                                                          'Key0nl_${filteredListItem.vagaId!}',
                                                                        ),
                                                                        specialty:
                                                                            filteredListItem.especialidadeNome,
                                                                        value:
                                                                            formatNumber(
                                                                          filteredListItem
                                                                              .vagaValor,
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.commaDecimal,
                                                                          currency:
                                                                              'R\$',
                                                                        ),
                                                                        time:
                                                                            '${dateTimeFormat(
                                                                          "H",
                                                                          filteredListItem
                                                                              .vagaHorainicio
                                                                              ?.time,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}h-${dateTimeFormat(
                                                                          "H",
                                                                          filteredListItem
                                                                              .vagaHorafim
                                                                              ?.time,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}h',
                                                                        datecount:
                                                                            'há ${dateTimeFormat(
                                                                          "relative",
                                                                          filteredListItem
                                                                              .vagaCreatedate,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                        )}',
                                                                        shift: filteredListItem
                                                                            .periodoNome,
                                                                        type: filteredListItem
                                                                            .tiposVagaNome,
                                                                        hospital: functions.cleanHospitalName(
                                                                            filteredListItem.hospitalNome!,
                                                                            FFAppState().cleanHospital.toList()),
                                                                        vaga: filteredListItem
                                                                            .vagaId,
                                                                        avatarHospital:
                                                                            filteredListItem.hospitalAvatar,
                                                                        sector:
                                                                            filteredListItem.setorNome,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (true)
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'INITIAL_PAGE_PAGE__BTN_ON_TAP');
                                                                        if (_model
                                                                            .isBottomSheetLoading) {
                                                                          return;
                                                                        }

                                                                        logFirebaseEvent(
                                                                            'Button_update_page_state');
                                                                        _model.isBottomSheetLoading =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          useSafeArea:
                                                                              true,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: VagaBottomSheetWidget(
                                                                                  speciality: filteredListItem.especialidadeNome,
                                                                                  value: filteredListItem.vagaValor?.toDouble(),
                                                                                  hospital: filteredListItem.hospitalNome,
                                                                                  date: filteredListItem.vagaData,
                                                                                  datecreated: filteredListItem.vagaCreatedate,
                                                                                  startTime: filteredListItem.vagaHorainicio?.time,
                                                                                  endTime: filteredListItem.vagaHorafim?.time,
                                                                                  shift: filteredListItem.periodoNome,
                                                                                  type: filteredListItem.tiposVagaNome,
                                                                                  lat: filteredListItem.hospitalLat,
                                                                                  lon: filteredListItem.hospitalLog,
                                                                                  address: filteredListItem.hospitalEnd,
                                                                                  jobid: filteredListItem.vagaId,
                                                                                  contractor: filteredListItem.grupoNome,
                                                                                  contractorName: filteredListItem.escalistaNome,
                                                                                  contractorPhone: filteredListItem.escalistaTelefone,
                                                                                  contractorEmail: filteredListItem.escalistaEmail,
                                                                                  payday: filteredListItem.vagaDatapagamento,
                                                                                  payment: filteredListItem.formarecebimentoNome,
                                                                                  avatarHospital: filteredListItem.hospitalAvatar,
                                                                                  sector: filteredListItem.setorNome,
                                                                                  callback: () async {},
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));

                                                                        logFirebaseEvent(
                                                                            'Button_update_page_state');
                                                                        _model.isBottomSheetLoading =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_google_analytics_event');
                                                                        logFirebaseEvent(
                                                                          'vagas_exibicao_initial',
                                                                          parameters: {
                                                                            'user_id':
                                                                                currentUserUid,
                                                                            'time':
                                                                                getCurrentTimestamp,
                                                                            'vaga_id':
                                                                                filteredListItem.vagaId,
                                                                          },
                                                                        );
                                                                        return;
                                                                      },
                                                                      text: '',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: double
                                                                            .infinity,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.13,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: Color(
                                                                            0x00A369ED),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              font: GoogleFonts.geologica(
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      showLoadingIndicator:
                                                                          false,
                                                                    ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      return Builder(
                                                        builder: (context) {
                                                          final defaultList = initialPageVwVagasAbertasRowList
                                                              .where((e) =>
                                                                  (e.vagaData ==
                                                                      FFAppState()
                                                                          .selectedDay) &&
                                                                  (e.hospitalEstado ==
                                                                      FFAppState()
                                                                          .estadoUF))
                                                              .toList();
                                                          if (defaultList
                                                              .isEmpty) {
                                                            return EmptyListWidget(
                                                              text:
                                                                  'Sem vagas para mostrar',
                                                            );
                                                          }

                                                          return ListView
                                                              .separated(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        2.0),
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                defaultList
                                                                    .length,
                                                            separatorBuilder:
                                                                (_, __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            2.0),
                                                            itemBuilder: (context,
                                                                defaultListIndex) {
                                                              final defaultListItem =
                                                                  defaultList[
                                                                      defaultListIndex];
                                                              return Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .cardVagasInitialModels2
                                                                          .getModel(
                                                                        defaultListItem
                                                                            .vagaId!,
                                                                        defaultListIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          CardVagasInitialWidget(
                                                                        key:
                                                                            Key(
                                                                          'Keytip_${defaultListItem.vagaId!}',
                                                                        ),
                                                                        specialty:
                                                                            defaultListItem.especialidadeNome,
                                                                        value:
                                                                            formatNumber(
                                                                          defaultListItem
                                                                              .vagaValor,
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.commaDecimal,
                                                                          currency:
                                                                              'R\$',
                                                                        ),
                                                                        time:
                                                                            '${dateTimeFormat(
                                                                          "H",
                                                                          defaultListItem
                                                                              .vagaHorainicio
                                                                              ?.time,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}h-${dateTimeFormat(
                                                                          "H",
                                                                          defaultListItem
                                                                              .vagaHorafim
                                                                              ?.time,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}h',
                                                                        datecount:
                                                                            'há ${dateTimeFormat(
                                                                          "relative",
                                                                          defaultListItem
                                                                              .vagaCreatedate,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                        )}',
                                                                        shift: defaultListItem
                                                                            .periodoNome,
                                                                        type: defaultListItem
                                                                            .tiposVagaNome,
                                                                        hospital: functions.cleanHospitalName(
                                                                            defaultListItem.hospitalNome!,
                                                                            FFAppState().cleanHospital.toList()),
                                                                        vaga: defaultListItem
                                                                            .vagaId,
                                                                        avatarHospital:
                                                                            defaultListItem.hospitalAvatar,
                                                                        sector:
                                                                            defaultListItem.setorNome,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (true)
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'INITIAL_PAGE_PAGE__BTN_ON_TAP');
                                                                        if (_model
                                                                            .isBottomSheetLoading) {
                                                                          return;
                                                                        }

                                                                        logFirebaseEvent(
                                                                            'Button_update_page_state');
                                                                        _model.isBottomSheetLoading =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          useSafeArea:
                                                                              true,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: VagaBottomSheetWidget(
                                                                                  speciality: defaultListItem.especialidadeNome,
                                                                                  value: defaultListItem.vagaValor?.toDouble(),
                                                                                  hospital: defaultListItem.hospitalNome,
                                                                                  date: defaultListItem.vagaData,
                                                                                  datecreated: defaultListItem.vagaCreatedate,
                                                                                  startTime: defaultListItem.vagaHorainicio?.time,
                                                                                  endTime: defaultListItem.vagaHorafim?.time,
                                                                                  shift: defaultListItem.periodoNome,
                                                                                  type: defaultListItem.tiposVagaNome,
                                                                                  lat: defaultListItem.hospitalLat,
                                                                                  lon: defaultListItem.hospitalLog,
                                                                                  address: defaultListItem.hospitalEnd,
                                                                                  jobid: defaultListItem.vagaId,
                                                                                  contractor: defaultListItem.grupoNome,
                                                                                  contractorName: defaultListItem.escalistaNome,
                                                                                  contractorPhone: defaultListItem.escalistaTelefone,
                                                                                  contractorEmail: defaultListItem.escalistaEmail,
                                                                                  payday: defaultListItem.vagaDatapagamento,
                                                                                  payment: defaultListItem.formarecebimentoNome,
                                                                                  avatarHospital: defaultListItem.hospitalAvatar,
                                                                                  sector: defaultListItem.setorNome,
                                                                                  callback: () async {},
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));

                                                                        logFirebaseEvent(
                                                                            'Button_update_page_state');
                                                                        _model.isBottomSheetLoading =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_google_analytics_event');
                                                                        logFirebaseEvent(
                                                                          'vagas_exibicao_initial',
                                                                          parameters: {
                                                                            'user_id':
                                                                                currentUserUid,
                                                                            'time':
                                                                                getCurrentTimestamp,
                                                                            'vaga_id':
                                                                                defaultListItem.vagaId,
                                                                          },
                                                                        );
                                                                        return;
                                                                      },
                                                                      text: '',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: double
                                                                            .infinity,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.13,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: Color(
                                                                            0x00A369ED),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              font: GoogleFonts.geologica(
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      showLoadingIndicator:
                                                                          false,
                                                                    ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                );
                                              } else {
                                                return wrapWithModel(
                                                  model: _model.emptyListModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: EmptyListWidget(
                                                    text:
                                                        'Selecione uma região',
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    if (!(initialPageVwVagasAbertasRowList
                                        .where((e) =>
                                            e.vagaData ==
                                            FFAppState().selectedDay)
                                        .toList()
                                        .isNotEmpty))
                                      wrapWithModel(
                                        model: _model.emptyListModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: EmptyListWidget(
                                          text:
                                              'Sem vagas para mostrar, selecione outra data',
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
