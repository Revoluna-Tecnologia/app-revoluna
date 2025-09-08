import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loading/banner_loading/banner_loading_widget.dart';
import '/components/loading/header_loading/header_loading_widget.dart';
import '/components/loading/lista_home_loading/lista_home_loading_widget.dart';
import '/components/loading/pages/home_loading/home_loading_widget.dart';
import '/components/vagas/card_vagas_slim/card_vagas_slim_widget.dart';
import '/components/vagas/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/other/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
      logFirebaseEvent('HomePage_custom_action');
      await actions.conciergenumber();
      logFirebaseEvent('HomePage_custom_action');
      await actions.unreadNotifications();
      logFirebaseEvent('HomePage_custom_action');
      await actions.markAppAsLoaded();
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_DISPOSE');
      if (isiOS) {
        logFirebaseEvent('HomePage_custom_action');
        _model.appTracking = await actions.appTracking();
        if (_model.appTracking!) {
          logFirebaseEvent('HomePage_backend_call');
          _model.medicoTrackingUpdateTrueCopy = await MedicosTable().update(
            data: {
              'tracking_privacy': true,
            },
            matchingRows: (rows) => rows.eqOrNull(
              'id',
              currentUserUid,
            ),
            returnRows: true,
          );
        } else {
          logFirebaseEvent('HomePage_backend_call');
          _model.medicoTrackingUpdateFalseCopy = await MedicosTable().update(
            data: {
              'tracking_privacy': false,
            },
            matchingRows: (rows) => rows.eqOrNull(
              'id',
              currentUserUid,
            ),
            returnRows: true,
          );
        }
      }
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

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
          endDrawer: Container(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: Drawer(
              child: wrapWithModel(
                model: _model.drawerMenuModel,
                updateCallback: () => safeSetState(() {}),
                child: DrawerMenuWidget(),
              ),
            ),
          ),
          body: SafeArea(
            top: true,
            child: FutureBuilder<List<VwVagasCandidaturasRow>>(
              future: FFAppState().vagasCandidaturas(
                requestFn: () => VwVagasCandidaturasTable().queryRows(
                  queryFn: (q) => q,
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return HomeLoadingWidget();
                }
                List<VwVagasCandidaturasRow>
                    containerVwVagasCandidaturasRowList = snapshot.data!;

                return Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              FFAppConstants.doubleGap,
                              0.0,
                            ),
                            valueOrDefault<double>(
                              FFAppConstants.doubleGap,
                              0.0,
                            ),
                            valueOrDefault<double>(
                              FFAppConstants.doubleGap,
                              0.0,
                            ),
                            0.0),
                        child: FutureBuilder<List<EstadosBrasilRow>>(
                          future: FFAppState().estados(
                            requestFn: () => EstadosBrasilTable().queryRows(
                              queryFn: (q) => q,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return HeaderLoadingWidget();
                            }
                            List<EstadosBrasilRow> headerEstadosBrasilRowList =
                                snapshot.data!;

                            return wrapWithModel(
                              model: _model.headerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: HeaderWidget(
                                estados: headerEstadosBrasilRowList,
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
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
                                child: FutureBuilder<List<BannerMKTRow>>(
                                  future: _model.banner(
                                    requestFn: () => BannerMKTTable().queryRows(
                                      queryFn: (q) => q,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return BannerLoadingWidget();
                                    }
                                    List<BannerMKTRow> bannerBannerMKTRowList =
                                        snapshot.data!;

                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.borderM,
                                        0.0,
                                      )),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              valueOrDefault<double>(
                                            FFAppConstants.borderM,
                                            0.0,
                                          )),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final bannerVar =
                                                bannerBannerMKTRowList.toList();

                                            return Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.2,
                                              child: CarouselSlider.builder(
                                                itemCount: bannerVar.length,
                                                itemBuilder: (context,
                                                    bannerVarIndex, _) {
                                                  final bannerVarItem =
                                                      bannerVar[bannerVarIndex];
                                                  return Stack(
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
                                                        imageUrl: bannerVarItem
                                                            .imgpath!,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'HOME_PAGE_PAGE__BTN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Button_launch_u_r_l');
                                                          await launchURL(
                                                              bannerVarItem
                                                                  .url!);
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
                                                          color:
                                                              Color(0x00A369ED),
                                                          textStyle:
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
                                                  );
                                                },
                                                carouselController: _model
                                                        .carouselController ??=
                                                    CarouselSliderController(),
                                                options: CarouselOptions(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          1,
                                                          bannerVar.length -
                                                              1)),
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
                                                  autoPlayCurve: Curves.linear,
                                                  pauseAutoPlayInFiniteScroll:
                                                      true,
                                                  onPageChanged: (index, _) =>
                                                      _model.carouselCurrentIndex =
                                                          index,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
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
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.155,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5.0,
                                        color: Color(0x246814E5),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(
                                        valueOrDefault<double>(
                                      FFAppConstants.borderM,
                                      0.0,
                                    )),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -0.3),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    FFAppConstants.doubleGap,
                                                    0.0,
                                                  ),
                                                  valueOrDefault<double>(
                                                    FFAppConstants.doubleGap,
                                                    0.0,
                                                  ),
                                                  valueOrDefault<double>(
                                                    FFAppConstants.doubleGap,
                                                    0.0,
                                                  ),
                                                  valueOrDefault<double>(
                                                    FFAppConstants.Gap,
                                                    0.0,
                                                  )),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppConstants.Gap,
                                                            0.0,
                                                          ),
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppConstants
                                                                .doubleGap,
                                                            0.0,
                                                          ),
                                                          0.0,
                                                          0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.07,
                                                          60.0,
                                                        ),
                                                        height: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.07,
                                                          60.0,
                                                        ),
                                                        child: custom_widgets
                                                            .CustomCircularProgress(
                                                          width: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.07,
                                                            60.0,
                                                          ),
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.07,
                                                            60.0,
                                                          ),
                                                          progressValue:
                                                              valueOrDefault<
                                                                  double>(
                                                            () {
                                                              if (formatNumber(
                                                                    functions.sumList(containerVwVagasCandidaturasRowList
                                                                        .where((e) =>
                                                                            (e.medicoId != null && e.medicoId != '') &&
                                                                            (e.candidaturaStatus ==
                                                                                'APROVADO'))
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e.vagasValor)
                                                                        .withoutNulls
                                                                        .toList()),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                    currency:
                                                                        'R\$ ',
                                                                  ) ==
                                                                  '0') {
                                                                return 0.0;
                                                              } else if (_model
                                                                  .visibleValues) {
                                                                return ((functions.sumList(containerVwVagasCandidaturasRowList
                                                                            .where((e) =>
                                                                                e.medicoId ==
                                                                                currentUserUid)
                                                                            .toList()
                                                                            .map((e) => e
                                                                                .pagamentoValor)
                                                                            .withoutNulls
                                                                            .toList()) /
                                                                        functions.sumList(containerVwVagasCandidaturasRowList
                                                                            .where((e) =>
                                                                                (e.medicoId == currentUserUid) &&
                                                                                (e.candidaturaStatus == 'APROVADO'))
                                                                            .toList()
                                                                            .map((e) => e.vagasValor)
                                                                            .withoutNulls
                                                                            .toList())) *
                                                                    100);
                                                              } else {
                                                                return 0.0;
                                                              }
                                                            }(),
                                                            0.0,
                                                          ),
                                                          size: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.1,
                                                            85.0,
                                                          ),
                                                          progressColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          strokeWidth: 8.0,
                                                          showPercentage: _model
                                                              .visibleValues,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      FFAppConstants
                                                                          .doubleGap,
                                                                      0.0,
                                                                    ),
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: _model
                                                                        .visibleValues
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.visibleValues
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).secondaryBackground,
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                  ),
                                                                  AutoSizeText(
                                                                    formatNumber(
                                                                      functions.sumList(containerVwVagasCandidaturasRowList
                                                                          .where((e) =>
                                                                              e.medicoId ==
                                                                              currentUserUid)
                                                                          .toList()
                                                                          .map((e) =>
                                                                              e.pagamentoValor)
                                                                          .withoutNulls
                                                                          .toList()),
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .commaDecimal,
                                                                      currency:
                                                                          'R\$ ',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displayMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.geologica(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).displayMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).displayMedium.fontStyle,
                                                                          ),
                                                                          color: _model.visibleValues
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).secondaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .displayMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .displayMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width: FFAppConstants
                                                                        .halfGap)),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: _model
                                                                        .visibleValues
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.visibleValues
                                                                            ? FlutterFlowTheme.of(context).secondary
                                                                            : FlutterFlowTheme.of(context).secondaryBackground,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                      ),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                  ),
                                                                  AutoSizeText(
                                                                    formatNumber(
                                                                      functions.sumList(containerVwVagasCandidaturasRowList
                                                                          .where((e) =>
                                                                              (e.medicoId == currentUserUid) &&
                                                                              (e.candidaturaStatus ==
                                                                                  'APROVADO'))
                                                                          .toList()
                                                                          .map((e) =>
                                                                              e.vagasValor)
                                                                          .withoutNulls
                                                                          .toList()),
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .commaDecimal,
                                                                      currency:
                                                                          'R\$ ',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.geologica(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                          ),
                                                                          color: _model.visibleValues
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).secondaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    'a receber',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.geologica(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          color: _model.visibleValues
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).secondaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width: FFAppConstants
                                                                        .halfGap)),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height:
                                                                  FFAppConstants
                                                                      .halfGap)),
                                                        ),
                                                      ),
                                                    ].divide(SizedBox(
                                                        width: FFAppConstants
                                                            .doubleGap)),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(
                                                height: FFAppConstants.Gap)),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    FFAppConstants.halfGap,
                                                    0.0,
                                                  ),
                                                  0.0),
                                          child: ToggleIcon(
                                            onPressed: () async {
                                              safeSetState(() =>
                                                  _model.visibleValues =
                                                      !_model.visibleValues);
                                            },
                                            value: _model.visibleValues,
                                            onIcon: Icon(
                                              FFIcons.keye,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 15.0,
                                            ),
                                            offIcon: Icon(
                                              FFIcons.keyeOff,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              size: 15.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.9, -0.9),
                                        child: Text(
                                          'Meu saldo',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.geologica(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
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
                                      FFAppConstants.doubleGap,
                                      0.0,
                                    ),
                                    0.0,
                                    valueOrDefault<double>(
                                      FFAppConstants.doubleGap,
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      FFAppConstants.Gap,
                                      0.0,
                                    )),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (containerVwVagasCandidaturasRowList
                                                  .where((e) =>
                                                      functions.inThisWeek(
                                                          e.vagasData!) &&
                                                      (e.candidaturaStatus ==
                                                          'APROVADO') &&
                                                      (e.medicoId ==
                                                          currentUserUid))
                                                  .toList()
                                                  .length >
                                              0) {
                                            return RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Você tem ',
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
                                                  ),
                                                  TextSpan(
                                                    text: formatNumber(
                                                      containerVwVagasCandidaturasRowList
                                                          .where((e) =>
                                                              (e.medicoId ==
                                                                  currentUserUid) &&
                                                              (e.candidaturaStatus ==
                                                                  'APROVADO') &&
                                                              functions.inThisWeek(
                                                                  e.vagasData!))
                                                          .toList()
                                                          .length,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '0',
                                                      locale: '',
                                                    ),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                  TextSpan(
                                                    text: ' ',
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: formatNumber(
                                                              containerVwVagasCandidaturasRowList
                                                                  .where((e) =>
                                                                      (e.candidaturaStatus ==
                                                                          'APROVADO') &&
                                                                      functions
                                                                          .inThisWeek(
                                                                              e.vagasData!))
                                                                  .toList()
                                                                  .length,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '0',
                                                              locale: '',
                                                            ) ==
                                                            '1'
                                                        ? 'plantão'
                                                        : 'plantões',
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                  TextSpan(
                                                    text: ' essa semana',
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
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.geologica(
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
                                              ),
                                            );
                                          } else {
                                            return Text(
                                              'Você não tem plantões essa semana.\nAproveite para explorar novas oportunidades!',
                                              textAlign: TextAlign.center,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
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
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              StreamBuilder<List<CleanHospitalRow>>(
                                stream: FFAppState().cleanHospitalTerms(
                                  requestFn: () => _model
                                          .containerSupabaseStream ??=
                                      SupaFlow.client
                                          .from("clean_hospital")
                                          .stream(primaryKey: ['id']).map(
                                              (list) => list
                                                  .map((item) =>
                                                      CleanHospitalRow(item))
                                                  .toList()),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return ListaHomeLoadingWidget();
                                  }
                                  List<CleanHospitalRow>
                                      containerCleanHospitalRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5.0,
                                          color: Color(0x246814E5),
                                          offset: Offset(
                                            0.0,
                                            -5.0,
                                          ),
                                        )
                                      ],
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final list = functions
                                            .sortByPayment(
                                                containerVwVagasCandidaturasRowList
                                                    .sortedList(
                                                        keyOf: (e) =>
                                                            e.vagasCreatedate!,
                                                        desc: true)
                                                    .where((e) =>
                                                        (e.vagasData! >=
                                                            functions
                                                                .currentDate()!) &&
                                                        (e.vagasStatus ==
                                                            'aberta') &&
                                                        (e.hospitalEstado ==
                                                            _model.headerModel
                                                                .dropDownValue))
                                                    .toList(),
                                                true)
                                            .toList()
                                            .take(20)
                                            .toList();
                                        if (list.isEmpty) {
                                          return EmptyListWidget(
                                            text: 'Sem vagas para mostrar',
                                          );
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: list.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 2.0),
                                          itemBuilder: (context, listIndex) {
                                            final listItem = list[listIndex];
                                            return Stack(
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .cardVagasSlimModels
                                                      .getModel(
                                                    listItem.vagasId!,
                                                    listIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: CardVagasSlimWidget(
                                                    key: Key(
                                                      'Keytx1_${listItem.vagasId!}',
                                                    ),
                                                    specialty: listItem
                                                        .especialidadeNome,
                                                    value: formatNumber(
                                                      listItem.vagasValor,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .commaDecimal,
                                                      currency: 'R\$',
                                                    ),
                                                    date: dateTimeFormat(
                                                      "dd/MM",
                                                      listItem.vagasData,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    datecount:
                                                        'há ${dateTimeFormat(
                                                      "relative",
                                                      listItem.vagasCreatedate,
                                                      locale: FFLocalizations
                                                                  .of(context)
                                                              .languageShortCode ??
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )}',
                                                    shift: listItem
                                                        .vagasPeriodoNome,
                                                    type:
                                                        listItem.vagasTipoNome,
                                                    hospital: functions
                                                        .cleanHospitalName(
                                                            listItem
                                                                .hospitalNome!,
                                                            containerCleanHospitalRowList
                                                                .map((e) =>
                                                                    e.terms)
                                                                .withoutNulls
                                                                .toList()),
                                                    vaga: listItem.vagasId,
                                                    avatarHospital:
                                                        listItem.hospitalAvatar,
                                                    showPay: false,
                                                    sector: listItem.setorNome,
                                                    distance:
                                                        valueOrDefault<String>(
                                                      functions.distanceCalc(
                                                          listItem.hospitalLat!,
                                                          listItem.hospitalLog!,
                                                          currentUserLocationValue!),
                                                      'Não encontrado',
                                                    ),
                                                    showSign: (int job,
                                                            int payment) {
                                                      return (payment - job) <=
                                                          86400;
                                                    }(
                                                        listItem.vagasData!
                                                            .secondsSinceEpoch,
                                                        listItem
                                                            .vagasDatapagamento!
                                                            .secondsSinceEpoch),
                                                  ),
                                                ),
                                                if (true)
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'HOME_PAGE_PAGE__BTN_ON_TAP');
                                                      if (_model
                                                          .isBottomSheetLoading) {
                                                        return;
                                                      }

                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.isBottomSheetLoading =
                                                          true;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
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
                                                                  VagaBottomSheetWidget(
                                                                speciality: listItem
                                                                    .especialidadeNome,
                                                                value: listItem
                                                                    .vagasValor
                                                                    ?.toDouble(),
                                                                hospital: listItem
                                                                    .hospitalNome,
                                                                date: listItem
                                                                    .vagasData,
                                                                datecreated:
                                                                    listItem
                                                                        .vagasCreatedate,
                                                                startTime: listItem
                                                                    .vagasHorainicio
                                                                    ?.time,
                                                                endTime: listItem
                                                                    .vagasHorafim
                                                                    ?.time,
                                                                shift: listItem
                                                                    .vagasPeriodoNome,
                                                                type: listItem
                                                                    .vagasTipoNome,
                                                                lat: listItem
                                                                    .hospitalLat,
                                                                lon: listItem
                                                                    .hospitalLog,
                                                                address: listItem
                                                                    .hospitalEnd,
                                                                jobid: listItem
                                                                    .vagasId,
                                                                contractor:
                                                                    listItem
                                                                        .grupoNome,
                                                                contractorName:
                                                                    listItem
                                                                        .escalistaNome,
                                                                contractorPhone:
                                                                    listItem
                                                                        .escalistaTelefone,
                                                                contractorEmail:
                                                                    listItem
                                                                        .escalistaEmail,
                                                                payday: listItem
                                                                    .vagasDatapagamento,
                                                                payment: listItem
                                                                    .vagasFormarecebimentoNome,
                                                                avatarHospital:
                                                                    listItem
                                                                        .hospitalAvatar,
                                                                sector: listItem
                                                                    .setorNome,
                                                                showFavorite:
                                                                    listItem
                                                                        .medicoFavorito,
                                                                candidates: containerVwVagasCandidaturasRowList
                                                                    .where((e) =>
                                                                        e.vagasId ==
                                                                        listItem
                                                                            .vagasId)
                                                                    .toList(),
                                                                callback:
                                                                    () async {},
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
                                                      safeSetState(() {});
                                                      return;
                                                    },
                                                    text: '',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.13,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0x00A369ED),
                                                      textStyle:
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    showLoadingIndicator: false,
                                                  ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ].divide(
                                SizedBox(height: FFAppConstants.doubleGap)),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: FFAppConstants.doubleGap)),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
