import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/dialogs/negative_informative_box/negative_informative_box_widget.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/vagas/card_vagas/card_vagas_widget.dart';
import '/components/vagas/dropdown_loading/dropdown_loading_widget.dart';
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
import 'dart:async';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      logFirebaseEvent('HomePage_update_app_state');
      FFAppState().selectedDay = functions.currentDate();
      safeSetState(() {});
      logFirebaseEvent('HomePage_refresh_database_request');
      safeSetState(() {
        FFAppState().clearVagasAbertasCache();
        _model.requestCompleted3 = false;
      });
      await _model.waitForRequestCompleted3();
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
    context.watch<FFAppState>();
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

    return FutureBuilder<List<VwVagasCandidaturasRow>>(
      future: FFAppState()
          .vagasAbertas(
        requestFn: () => VwVagasCandidaturasTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'vagas_status',
                'aberta',
              )
              .order('vagas_horainicio', ascending: true),
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
            body: Center(
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
        List<VwVagasCandidaturasRow> homePageVwVagasCandidaturasRowList =
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: FloatingActionButton(
                    onPressed: () async {
                      logFirebaseEvent(
                          'HOME_FloatingActionButton_8q8qcsly_ON_TA');
                      logFirebaseEvent('FloatingActionButton_custom_action');
                      _model.whatsappHome = await actions.launchWhatsAppChat(
                        'Olá, visitei a Revoluna e fiquei com uma dúvida',
                        FFAppState().concierge,
                      );
                      if (!_model.whatsappHome!) {
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
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
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
                  future: FFAppState()
                      .vagasMedico(
                    requestFn: () => VwVagasCandidaturasTable().queryRows(
                      queryFn: (q) => q
                          .eqOrNull(
                            'medico_id',
                            currentUserUid,
                          )
                          .order('vagas_horainicio', ascending: true),
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
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
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
                                0.0,
                                valueOrDefault<double>(
                                  FFAppConstants.doubleGap,
                                  0.0,
                                ),
                                0.0),
                            child: wrapWithModel(
                              model: _model.headerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: HeaderWidget(),
                            ),
                          ),
                          Expanded(
                            child: RefreshIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                              onRefresh: () async {
                                logFirebaseEvent(
                                    'HOME_Column_ejocz0i4_ON_PULL_TO_REFRESH');
                                logFirebaseEvent(
                                    'Column_refresh_database_request');
                                safeSetState(() {
                                  FFAppState().clearVagasAbertasCache();
                                  _model.requestCompleted3 = false;
                                });
                                await _model.waitForRequestCompleted3();
                                logFirebaseEvent(
                                    'Column_refresh_database_request');
                                safeSetState(() {
                                  FFAppState().clearVagasMedicoCache();
                                  _model.requestCompleted1 = false;
                                });
                                await _model.waitForRequestCompleted1();
                                logFirebaseEvent(
                                    'Column_refresh_database_request');
                                safeSetState(() {
                                  FFAppState().clearEstadosCache();
                                  _model.requestCompleted2 = false;
                                });
                                await _model.waitForRequestCompleted2();
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
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
                                                    0.0,
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
                                              events: containerVwVagasCandidaturasRowList
                                                  .where((e) =>
                                                      e.candidaturaStatus ==
                                                      'APROVADO')
                                                  .toList()
                                                  .map((e) => e.vagasData)
                                                  .withoutNulls
                                                  .toList()
                                                  .unique((e) => e)
                                                  .sortedList(
                                                      keyOf: (e) => e,
                                                      desc: false),
                                              weekViewEnabled:
                                                  _model.calendarView,
                                              openVagas:
                                                  homePageVwVagasCandidaturasRowList
                                                      .where((e) =>
                                                          (e.vagasStatus ==
                                                              'aberta') &&
                                                          (e.hospitalEstado ==
                                                              FFAppState()
                                                                  .estadoUF))
                                                      .toList()
                                                      .map((e) => e.vagasData)
                                                      .withoutNulls
                                                      .toList()
                                                      .unique((e) => e)
                                                      .sortedList(
                                                          keyOf: (e) => e,
                                                          desc: false),
                                              callback: () async {
                                                logFirebaseEvent(
                                                    'HOME_Container_byk7bs38_CALLBACK');
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
                                        ].addToEnd(SizedBox(
                                            height: FFAppConstants.Gap)),
                                      ),
                                    ),
                                    if (!(containerVwVagasCandidaturasRowList
                                            .where((e) =>
                                                (e.vagasData ==
                                                    FFAppState().selectedDay) &&
                                                (e.candidaturaStatus ==
                                                    'APROVADO'))
                                            .toList()
                                            .isNotEmpty) &&
                                        !(homePageVwVagasCandidaturasRowList
                                            .where((e) =>
                                                e.vagasData ==
                                                FFAppState().selectedDay)
                                            .toList()
                                            .isNotEmpty))
                                      wrapWithModel(
                                        model: _model.emptyListModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: EmptyListWidget(),
                                      ),
                                    if (containerVwVagasCandidaturasRowList
                                        .where((e) =>
                                            (e.vagasData ==
                                                FFAppState().selectedDay) &&
                                            (e.candidaturaStatus == 'APROVADO'))
                                        .toList()
                                        .isNotEmpty)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0,
                                            0.0,
                                            0.0,
                                            valueOrDefault<double>(
                                              FFAppConstants.Gap,
                                              0.0,
                                            )),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCircle,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 14.0,
                                                  ),
                                                  Text(
                                                    'Plantões aprovados',
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
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final homeApprovedList =
                                                        containerVwVagasCandidaturasRowList
                                                            .where((e) =>
                                                                (e.vagasData ==
                                                                    FFAppState()
                                                                        .selectedDay) &&
                                                                (e.candidaturaStatus ==
                                                                    'APROVADO'))
                                                            .toList();

                                                    return ListView.separated(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 2.0),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          homeApprovedList
                                                              .length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 2.0),
                                                      itemBuilder: (context,
                                                          homeApprovedListIndex) {
                                                        final homeApprovedListItem =
                                                            homeApprovedList[
                                                                homeApprovedListIndex];
                                                        return Stack(
                                                          children: [
                                                            wrapWithModel(
                                                              model: _model
                                                                  .cardVagasModels1
                                                                  .getModel(
                                                                homeApprovedListItem
                                                                    .vagasId!,
                                                                homeApprovedListIndex,
                                                              ),
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  CardVagasWidget(
                                                                key: Key(
                                                                  'Keygbb_${homeApprovedListItem.vagasId!}',
                                                                ),
                                                                specialty:
                                                                    homeApprovedListItem
                                                                        .especialidadeNome,
                                                                value:
                                                                    formatNumber(
                                                                  homeApprovedListItem
                                                                      .vagasValor,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .commaDecimal,
                                                                  currency:
                                                                      'R\$',
                                                                ),
                                                                date:
                                                                    '${dateTimeFormat(
                                                                  "H",
                                                                  homeApprovedListItem
                                                                      .vagasHorainicio
                                                                      ?.time,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}h-${dateTimeFormat(
                                                                  "H",
                                                                  homeApprovedListItem
                                                                      .vagasHorafim
                                                                      ?.time,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}h',
                                                                datecount:
                                                                    'há ${dateTimeFormat(
                                                                  "relative",
                                                                  homeApprovedListItem
                                                                      .vagasCreatedate,
                                                                  locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageShortCode ??
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                )}',
                                                                shift: '',
                                                                type: homeApprovedListItem
                                                                    .vagasTipoNome,
                                                                hospital: functions.cleanHospitalName(
                                                                    homeApprovedListItem
                                                                        .hospitalNome!,
                                                                    FFAppState()
                                                                        .cleanHospital
                                                                        .toList()),
                                                                vaga:
                                                                    homeApprovedListItem
                                                                        .vagasId,
                                                                avatarHospital:
                                                                    homeApprovedListItem
                                                                        .hospitalAvatar,
                                                                showPay: false,
                                                                sector:
                                                                    homeApprovedListItem
                                                                        .setorNome,
                                                                distance: functions.distanceCalc(
                                                                    homeApprovedListItem
                                                                        .hospitalLat!,
                                                                    homeApprovedListItem
                                                                        .hospitalLog!,
                                                                    currentUserLocationValue!),
                                                                showSign: false,
                                                              ),
                                                            ),
                                                            if (true)
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'HOME_PAGE_PAGE__BTN_ON_TAP');
                                                                  currentUserLocationValue = await getCurrentUserLocation(
                                                                      defaultLocation:
                                                                          LatLng(
                                                                              0.0,
                                                                              0.0));
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
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              VagaBottomSheetWidget(
                                                                            speciality:
                                                                                homeApprovedListItem.especialidadeNome,
                                                                            value:
                                                                                homeApprovedListItem.vagasValor?.toDouble(),
                                                                            hospital:
                                                                                homeApprovedListItem.hospitalNome,
                                                                            date:
                                                                                homeApprovedListItem.vagasData,
                                                                            datecreated:
                                                                                homeApprovedListItem.vagasCreatedate,
                                                                            startTime:
                                                                                homeApprovedListItem.vagasHorainicio?.time,
                                                                            endTime:
                                                                                homeApprovedListItem.vagasHorafim?.time,
                                                                            shift:
                                                                                homeApprovedListItem.vagasPeriodoNome,
                                                                            type:
                                                                                homeApprovedListItem.vagasTipoNome,
                                                                            lat:
                                                                                homeApprovedListItem.hospitalLat,
                                                                            lon:
                                                                                homeApprovedListItem.hospitalLog,
                                                                            address:
                                                                                homeApprovedListItem.hospitalEnd,
                                                                            jobid:
                                                                                homeApprovedListItem.vagasId,
                                                                            contractor:
                                                                                homeApprovedListItem.grupoNome,
                                                                            contractorName:
                                                                                homeApprovedListItem.escalistaNome,
                                                                            contractorPhone:
                                                                                homeApprovedListItem.escalistaTelefone,
                                                                            contractorEmail:
                                                                                homeApprovedListItem.escalistaEmail,
                                                                            payday:
                                                                                homeApprovedListItem.vagasDatapagamento,
                                                                            payment:
                                                                                homeApprovedListItem.vagasFormarecebimentoNome,
                                                                            avatarHospital:
                                                                                homeApprovedListItem.hospitalAvatar,
                                                                            sector:
                                                                                homeApprovedListItem.setorNome,
                                                                            showFavorite:
                                                                                homeApprovedListItem.medicoFavorito,
                                                                            candidates:
                                                                                homeApprovedListItem,
                                                                            callback:
                                                                                () async {},
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));

                                                                  logFirebaseEvent(
                                                                      'Button_update_page_state');
                                                                  _model.isBottomSheetLoading =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Button_google_analytics_event');
                                                                  logFirebaseEvent(
                                                                    'vagas_exibicao',
                                                                    parameters: {
                                                                      'user_id':
                                                                          currentUserUid,
                                                                      'time':
                                                                          getCurrentTimestamp,
                                                                      'location':
                                                                          currentUserLocationValue,
                                                                      'vaga_id':
                                                                          homeApprovedListItem
                                                                              .vagasId,
                                                                    },
                                                                  );
                                                                  return;
                                                                },
                                                                text: '',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.13,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0x00A369ED),
                                                                  textStyle: FlutterFlowTheme.of(
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
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                showLoadingIndicator:
                                                                    false,
                                                              ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (homePageVwVagasCandidaturasRowList
                                        .where((e) =>
                                            e.vagasData ==
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
                                                      options: List<String>.from(homePageVwVagasCandidaturasRowList
                                                          .where((e) =>
                                                              (e.hospitalEstado ==
                                                                  FFAppState()
                                                                      .estadoUF) &&
                                                              (e.vagasStatus ==
                                                                  'aberta') &&
                                                              (e.vagasData ==
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
                                                      optionLabels: homePageVwVagasCandidaturasRowList
                                                          .where((e) =>
                                                              (e.vagasStatus ==
                                                                  'aberta') &&
                                                              (e.vagasData ==
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
                                                      hintText:
                                                          'Especialidades',
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
                                                            'Sigla',
                                                            homePageVwVagasCandidaturasRowList
                                                                .where((e) =>
                                                                    (e.vagasData ==
                                                                        FFAppState()
                                                                            .selectedDay) &&
                                                                    (e.vagasStatus ==
                                                                        'aberta'))
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
                                                            _model.dropDownValue2 ??=
                                                                FFAppState()
                                                                    .estadoUF,
                                                          ),
                                                          options: List<String>.from(homePageVwVagasCandidaturasRowList
                                                              .where((e) =>
                                                                  (e.vagasStatus ==
                                                                      'aberta') &&
                                                                  (e.vagasData ==
                                                                      FFAppState()
                                                                          .selectedDay))
                                                              .toList()
                                                              .unique((e) => e
                                                                  .hospitalEstado!)
                                                              .map((e) => e
                                                                  .hospitalEstado)
                                                              .withoutNulls
                                                              .toList()
                                                              .sortedList(
                                                                  keyOf: (e) =>
                                                                      e,
                                                                  desc: false)),
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
                                                                'HOME_DropDown_3brc9nkb_ON_FORM_WIDGET_SE');
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
                                                                  .clearVagasAbertasCache();
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
                                              if (_model.dropDownValue1 !=
                                                      null &&
                                                  _model.dropDownValue1 != '') {
                                                return Builder(
                                                  builder: (context) {
                                                    final homeOpenList1 = functions
                                                        .sortByLocation(
                                                            currentUserLocationValue!,
                                                            homePageVwVagasCandidaturasRowList
                                                                .toList(),
                                                            true)
                                                        .where((e) =>
                                                            (e.vagasData ==
                                                                FFAppState()
                                                                    .selectedDay) &&
                                                            (e.hospitalEstado ==
                                                                FFAppState()
                                                                    .estadoUF) &&
                                                            (e.especialidadeId ==
                                                                _model
                                                                    .dropDownValue1))
                                                        .toList()
                                                        .unique(
                                                            (e) => e.vagasId!)
                                                        .sortedList(
                                                            keyOf: (e) =>
                                                                e.vagasValor!,
                                                            desc: true)
                                                        .toList();

                                                    return ListView.separated(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 2.0),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          homeOpenList1.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 2.0),
                                                      itemBuilder: (context,
                                                          homeOpenList1Index) {
                                                        final homeOpenList1Item =
                                                            homeOpenList1[
                                                                homeOpenList1Index];
                                                        return Stack(
                                                          children: [
                                                            wrapWithModel(
                                                              model: _model
                                                                  .cardVagasModels2
                                                                  .getModel(
                                                                homeOpenList1Item
                                                                    .vagasId!,
                                                                homeOpenList1Index,
                                                              ),
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  CardVagasWidget(
                                                                key: Key(
                                                                  'Keyhcx_${homeOpenList1Item.vagasId!}',
                                                                ),
                                                                specialty:
                                                                    homeOpenList1Item
                                                                        .especialidadeNome,
                                                                value:
                                                                    formatNumber(
                                                                  homeOpenList1Item
                                                                      .vagasValor,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .commaDecimal,
                                                                  currency:
                                                                      'R\$',
                                                                ),
                                                                date:
                                                                    '${dateTimeFormat(
                                                                  "H",
                                                                  homeOpenList1Item
                                                                      .vagasHorainicio
                                                                      ?.time,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}h-${dateTimeFormat(
                                                                  "H",
                                                                  homeOpenList1Item
                                                                      .vagasHorafim
                                                                      ?.time,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}h',
                                                                datecount:
                                                                    'há ${dateTimeFormat(
                                                                  "relative",
                                                                  homeOpenList1Item
                                                                      .vagasCreatedate,
                                                                  locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageShortCode ??
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                )}',
                                                                shift: '',
                                                                type: homeOpenList1Item
                                                                    .vagasTipoNome,
                                                                hospital: functions.cleanHospitalName(
                                                                    homeOpenList1Item
                                                                        .hospitalNome!,
                                                                    FFAppState()
                                                                        .cleanHospital
                                                                        .toList()),
                                                                vaga:
                                                                    homeOpenList1Item
                                                                        .vagasId,
                                                                avatarHospital:
                                                                    homeOpenList1Item
                                                                        .hospitalAvatar,
                                                                showPay: false,
                                                                sector:
                                                                    homeOpenList1Item
                                                                        .setorNome,
                                                                distance: functions.distanceCalc(
                                                                    homeOpenList1Item
                                                                        .hospitalLat!,
                                                                    homeOpenList1Item
                                                                        .hospitalLog!,
                                                                    currentUserLocationValue!),
                                                                showSign: false,
                                                              ),
                                                            ),
                                                            if (true)
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'HOME_PAGE_PAGE__BTN_ON_TAP');
                                                                  currentUserLocationValue = await getCurrentUserLocation(
                                                                      defaultLocation:
                                                                          LatLng(
                                                                              0.0,
                                                                              0.0));
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
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              VagaBottomSheetWidget(
                                                                            speciality:
                                                                                homeOpenList1Item.especialidadeNome,
                                                                            value:
                                                                                homeOpenList1Item.vagasValor?.toDouble(),
                                                                            hospital:
                                                                                homeOpenList1Item.hospitalNome,
                                                                            date:
                                                                                homeOpenList1Item.vagasData,
                                                                            datecreated:
                                                                                homeOpenList1Item.vagasCreatedate,
                                                                            startTime:
                                                                                homeOpenList1Item.vagasHorainicio?.time,
                                                                            endTime:
                                                                                homeOpenList1Item.vagasHorafim?.time,
                                                                            shift:
                                                                                homeOpenList1Item.vagasPeriodoNome,
                                                                            type:
                                                                                homeOpenList1Item.vagasTipoNome,
                                                                            lat:
                                                                                homeOpenList1Item.hospitalLat,
                                                                            lon:
                                                                                homeOpenList1Item.hospitalLog,
                                                                            address:
                                                                                homeOpenList1Item.hospitalEnd,
                                                                            jobid:
                                                                                homeOpenList1Item.vagasId,
                                                                            contractor:
                                                                                homeOpenList1Item.grupoNome,
                                                                            contractorName:
                                                                                homeOpenList1Item.escalistaNome,
                                                                            contractorPhone:
                                                                                homeOpenList1Item.escalistaTelefone,
                                                                            contractorEmail:
                                                                                homeOpenList1Item.escalistaEmail,
                                                                            payday:
                                                                                homeOpenList1Item.vagasDatapagamento,
                                                                            payment:
                                                                                homeOpenList1Item.vagasFormarecebimentoNome,
                                                                            avatarHospital:
                                                                                homeOpenList1Item.hospitalAvatar,
                                                                            sector:
                                                                                homeOpenList1Item.setorNome,
                                                                            showFavorite:
                                                                                homeOpenList1Item.medicoFavorito,
                                                                            candidates: homePageVwVagasCandidaturasRowList.where((e) => (e.medicoId == currentUserUid) && (e.vagasId == homeOpenList1Item.vagasId)).toList().isNotEmpty
                                                                                ? homePageVwVagasCandidaturasRowList.where((e) => (e.medicoId == currentUserUid) && (e.vagasId == homeOpenList1Item.vagasId)).toList().firstOrNull
                                                                                : homeOpenList1Item,
                                                                            callback:
                                                                                () async {},
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));

                                                                  logFirebaseEvent(
                                                                      'Button_update_page_state');
                                                                  _model.isBottomSheetLoading =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Button_google_analytics_event');
                                                                  logFirebaseEvent(
                                                                    'vagas_exibicao',
                                                                    parameters: {
                                                                      'user_id':
                                                                          currentUserUid,
                                                                      'time':
                                                                          getCurrentTimestamp,
                                                                      'location':
                                                                          currentUserLocationValue,
                                                                      'vaga_id':
                                                                          homeOpenList1Item
                                                                              .vagasId,
                                                                    },
                                                                  );
                                                                  return;
                                                                },
                                                                text: '',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.13,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0x00A369ED),
                                                                  textStyle: FlutterFlowTheme.of(
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
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
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
                                                    final homeOpenList2 = functions
                                                        .sortByLocation(
                                                            currentUserLocationValue!,
                                                            homePageVwVagasCandidaturasRowList
                                                                .toList(),
                                                            true)
                                                        .where((e) =>
                                                            (e.vagasData ==
                                                                FFAppState()
                                                                    .selectedDay) &&
                                                            (e.hospitalEstado ==
                                                                FFAppState()
                                                                    .estadoUF))
                                                        .toList()
                                                        .unique(
                                                            (e) => e.vagasId!)
                                                        .sortedList(
                                                            keyOf: (e) =>
                                                                e.vagasValor!,
                                                            desc: true)
                                                        .toList();

                                                    return ListView.separated(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 2.0),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          homeOpenList2.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 2.0),
                                                      itemBuilder: (context,
                                                          homeOpenList2Index) {
                                                        final homeOpenList2Item =
                                                            homeOpenList2[
                                                                homeOpenList2Index];
                                                        return Stack(
                                                          children: [
                                                            wrapWithModel(
                                                              model: _model
                                                                  .cardVagasModels3
                                                                  .getModel(
                                                                homeOpenList2Item
                                                                    .vagasId!,
                                                                homeOpenList2Index,
                                                              ),
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  CardVagasWidget(
                                                                key: Key(
                                                                  'Key0i9_${homeOpenList2Item.vagasId!}',
                                                                ),
                                                                specialty:
                                                                    homeOpenList2Item
                                                                        .especialidadeNome,
                                                                value:
                                                                    formatNumber(
                                                                  homeOpenList2Item
                                                                      .vagasValor,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .commaDecimal,
                                                                  currency:
                                                                      'R\$',
                                                                ),
                                                                date:
                                                                    '${dateTimeFormat(
                                                                  "H",
                                                                  homeOpenList2Item
                                                                      .vagasHorainicio
                                                                      ?.time,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}h-${dateTimeFormat(
                                                                  "H",
                                                                  homeOpenList2Item
                                                                      .vagasHorafim
                                                                      ?.time,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}h',
                                                                datecount:
                                                                    'há ${dateTimeFormat(
                                                                  "relative",
                                                                  homeOpenList2Item
                                                                      .vagasCreatedate,
                                                                  locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageShortCode ??
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                )}',
                                                                shift: '',
                                                                type: homeOpenList2Item
                                                                    .vagasTipoNome,
                                                                hospital: functions.cleanHospitalName(
                                                                    homeOpenList2Item
                                                                        .hospitalNome!,
                                                                    FFAppState()
                                                                        .cleanHospital
                                                                        .toList()),
                                                                vaga:
                                                                    homeOpenList2Item
                                                                        .vagasId,
                                                                avatarHospital:
                                                                    homeOpenList2Item
                                                                        .hospitalAvatar,
                                                                showPay: false,
                                                                sector:
                                                                    homeOpenList2Item
                                                                        .setorNome,
                                                                distance: functions.distanceCalc(
                                                                    homeOpenList2Item
                                                                        .hospitalLat!,
                                                                    homeOpenList2Item
                                                                        .hospitalLog!,
                                                                    currentUserLocationValue!),
                                                                showSign: false,
                                                              ),
                                                            ),
                                                            if (true)
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'HOME_PAGE_PAGE__BTN_ON_TAP');
                                                                  currentUserLocationValue = await getCurrentUserLocation(
                                                                      defaultLocation:
                                                                          LatLng(
                                                                              0.0,
                                                                              0.0));
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
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              VagaBottomSheetWidget(
                                                                            speciality:
                                                                                homeOpenList2Item.especialidadeNome,
                                                                            value:
                                                                                homeOpenList2Item.vagasValor?.toDouble(),
                                                                            hospital:
                                                                                homeOpenList2Item.hospitalNome,
                                                                            date:
                                                                                homeOpenList2Item.vagasData,
                                                                            datecreated:
                                                                                homeOpenList2Item.vagasCreatedate,
                                                                            startTime:
                                                                                homeOpenList2Item.vagasHorainicio?.time,
                                                                            endTime:
                                                                                homeOpenList2Item.vagasHorafim?.time,
                                                                            shift:
                                                                                homeOpenList2Item.vagasPeriodoNome,
                                                                            type:
                                                                                homeOpenList2Item.vagasTipoNome,
                                                                            lat:
                                                                                homeOpenList2Item.hospitalLat,
                                                                            lon:
                                                                                homeOpenList2Item.hospitalLog,
                                                                            address:
                                                                                homeOpenList2Item.hospitalEnd,
                                                                            jobid:
                                                                                homeOpenList2Item.vagasId,
                                                                            contractor:
                                                                                homeOpenList2Item.grupoNome,
                                                                            contractorName:
                                                                                homeOpenList2Item.escalistaNome,
                                                                            contractorPhone:
                                                                                homeOpenList2Item.escalistaTelefone,
                                                                            contractorEmail:
                                                                                homeOpenList2Item.escalistaEmail,
                                                                            payday:
                                                                                homeOpenList2Item.vagasDatapagamento,
                                                                            payment:
                                                                                homeOpenList2Item.vagasFormarecebimentoNome,
                                                                            avatarHospital:
                                                                                homeOpenList2Item.hospitalAvatar,
                                                                            sector:
                                                                                homeOpenList2Item.setorNome,
                                                                            showFavorite:
                                                                                homeOpenList2Item.medicoFavorito,
                                                                            candidates: homePageVwVagasCandidaturasRowList.where((e) => (e.medicoId == currentUserUid) && (e.vagasId == homeOpenList2Item.vagasId)).toList().isNotEmpty
                                                                                ? homePageVwVagasCandidaturasRowList.where((e) => (e.medicoId == currentUserUid) && (e.vagasId == homeOpenList2Item.vagasId)).toList().firstOrNull
                                                                                : homeOpenList2Item,
                                                                            callback:
                                                                                () async {},
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));

                                                                  logFirebaseEvent(
                                                                      'Button_update_page_state');
                                                                  _model.isBottomSheetLoading =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Button_google_analytics_event');
                                                                  logFirebaseEvent(
                                                                    'vagas_exibicao',
                                                                    parameters: {
                                                                      'user_id':
                                                                          currentUserUid,
                                                                      'time':
                                                                          getCurrentTimestamp,
                                                                      'location':
                                                                          currentUserLocationValue,
                                                                      'vaga_id':
                                                                          homeOpenList2Item
                                                                              .vagasId,
                                                                    },
                                                                  );
                                                                  return;
                                                                },
                                                                text: '',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.13,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0x00A369ED),
                                                                  textStyle: FlutterFlowTheme.of(
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
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
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
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
