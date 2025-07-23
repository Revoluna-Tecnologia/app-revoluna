import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/card_escala/card_escala_widget.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loading/header_loading/header_loading_widget.dart';
import '/components/loading/lista_escala_loading/lista_escala_loading_widget.dart';
import '/components/loading/pages/escalas_loading/escalas_loading_widget.dart';
import '/components/vagas/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/other/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'escalas_model.dart';
export 'escalas_model.dart';

class EscalasWidget extends StatefulWidget {
  const EscalasWidget({
    super.key,
    bool? fromhome,
  }) : this.fromhome = fromhome ?? false;

  final bool fromhome;

  static String routeName = 'Escalas';
  static String routePath = '/escalas';

  @override
  State<EscalasWidget> createState() => _EscalasWidgetState();
}

class _EscalasWidgetState extends State<EscalasWidget> {
  late EscalasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscalasModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Escalas'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ESCALAS_PAGE_Escalas_ON_INIT_STATE');
      logFirebaseEvent('Escalas_update_app_state');
      FFAppState().selectedDay = functions.currentDate();
      safeSetState(() {});
      logFirebaseEvent('Escalas_action_block');
      await _model.loadquery(context);
      safeSetState(() {});
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
                return EscalasLoadingWidget();
              }
              List<VwVagasCandidaturasRow> containerVwVagasCandidaturasRowList =
                  snapshot.data!;

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
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x26A369ED),
                            offset: Offset(
                              0.0,
                              6.0,
                            ),
                            spreadRadius: 2.0,
                          )
                        ],
                      ),
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
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Minhas escalas',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.geologica(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
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
                            child: custom_widgets.CustomCalendar(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.1,
                              events: _model.query
                                  .where((e) =>
                                      (e.medicoId == currentUserUid) &&
                                      (e.candidaturaStatus == 'APROVADO'))
                                  .toList()
                                  .map((e) => e.vagasData)
                                  .withoutNulls
                                  .toList(),
                              weekViewEnabled: _model.calendarView,
                              openVagas: _model.query
                                  .where((e) => e.vagasStatus == 'aberta')
                                  .toList()
                                  .map((e) => e.vagasData)
                                  .withoutNulls
                                  .toList(),
                              announcedVagas: _model.query
                                  .where((e) => e.vagasStatus == 'anunciada')
                                  .toList()
                                  .map((e) => e.vagasData)
                                  .withoutNulls
                                  .toList(),
                            ),
                          ),
                          ToggleIcon(
                            onPressed: () async {
                              safeSetState(() =>
                                  _model.calendarView = !_model.calendarView);
                            },
                            value: _model.calendarView,
                            onIcon: Icon(
                              FFIcons.kchevronDown,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            offIcon: Icon(
                              FFIcons.kchevronUp,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          ),
                        ].addToEnd(SizedBox(height: FFAppConstants.Gap)),
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final hospitais = _model.query
                              .map((e) => e.hospitalNome)
                              .withoutNulls
                              .toList()
                              .unique((e) => e)
                              .sortedList(keyOf: (e) => e, desc: false)
                              .toList();
                          if (hospitais.isEmpty) {
                            return EmptyListWidget(
                              text: 'Sem plantões para mostrar',
                            );
                          }

                          return RefreshIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                            onRefresh: () async {
                              logFirebaseEvent(
                                  'ESCALAS_ListView_cl3ay3dr_ON_PULL_TO_REF');
                              logFirebaseEvent('ListView_action_block');
                              await _model.loadquery(context);
                              safeSetState(() {});
                            },
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: hospitais.length,
                              itemBuilder: (context, hospitaisIndex) {
                                final hospitaisItem = hospitais[hospitaisIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.04,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              FFAppConstants.doubleGap,
                                              0.0,
                                            ),
                                            0.0,
                                            0.0,
                                            0.0),
                                        child: Text(
                                          hospitaisItem,
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
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final setores = _model.query
                                            .where((e) =>
                                                e.hospitalNome == hospitaisItem)
                                            .toList()
                                            .map((e) => e.setorNome)
                                            .withoutNulls
                                            .toList()
                                            .unique((e) => e)
                                            .sortedList(
                                                keyOf: (e) => e, desc: false)
                                            .toList();

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: setores.length,
                                          itemBuilder: (context, setoresIndex) {
                                            final setoresItem =
                                                setores[setoresIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.04,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppConstants
                                                                      .doubleGap,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      setoresItem,
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
                                                  ),
                                                ),
                                                FutureBuilder<
                                                    List<UserProfileRow>>(
                                                  future: UserProfileTable()
                                                      .queryRows(
                                                    queryFn: (q) => q,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return ListaEscalaLoadingWidget();
                                                    }
                                                    List<UserProfileRow>
                                                        containerUserProfileRowList =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final plantoes = _model
                                                              .query
                                                              .where((e) =>
                                                                  (e.hospitalNome == hospitaisItem) &&
                                                                  (e.setorNome ==
                                                                      setoresItem) &&
                                                                  (e.vagasData
                                                                          ?.secondsSinceEpoch ==
                                                                      FFAppState()
                                                                          .selectedDay
                                                                          ?.secondsSinceEpoch))
                                                              .toList();
                                                          if (plantoes
                                                              .isEmpty) {
                                                            return EmptyListWidget();
                                                          }

                                                          return ListView
                                                              .separated(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                              0,
                                                              2.0,
                                                              0,
                                                              2.0,
                                                            ),
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                plantoes.length,
                                                            separatorBuilder:
                                                                (_, __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            2.0),
                                                            itemBuilder: (context,
                                                                plantoesIndex) {
                                                              final plantoesItem =
                                                                  plantoes[
                                                                      plantoesIndex];
                                                              return Stack(
                                                                children: [
                                                                  wrapWithModel(
                                                                    model: _model
                                                                        .cardEscalaModels
                                                                        .getModel(
                                                                      plantoesItem
                                                                          .vagasId!,
                                                                      plantoesIndex,
                                                                    ),
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        CardEscalaWidget(
                                                                      key: Key(
                                                                        'Keysga_${plantoesItem.vagasId!}',
                                                                      ),
                                                                      shift: plantoesItem
                                                                          .vagasPeriodoNome,
                                                                      type: plantoesItem
                                                                          .vagasTipoNome,
                                                                      start:
                                                                          dateTimeFormat(
                                                                        "Hm",
                                                                        plantoesItem
                                                                            .vagasHorainicio
                                                                            ?.time,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      end:
                                                                          dateTimeFormat(
                                                                        "Hm",
                                                                        plantoesItem
                                                                            .vagasHorafim
                                                                            ?.time,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      drName: plantoesItem.vagasStatus ==
                                                                              'aberta'
                                                                          ? 'Vaga aberta'
                                                                          : valueOrDefault<
                                                                              String>(
                                                                              '${plantoesItem.medicoPrimeironome} ${plantoesItem.medicoSobrenome}',
                                                                              'Vaga aberta',
                                                                            ),
                                                                      avatarMedico:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        plantoesItem.vagasStatus ==
                                                                                'aberta'
                                                                            ? 'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/avatarhospitais//placeholder..png'
                                                                            : containerUserProfileRowList.where((e) => e.id == plantoesItem.medicoId).toList().firstOrNull?.profilepicture,
                                                                        'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/avatarhospitais//placeholder..png',
                                                                      ),
                                                                      sector: plantoesItem
                                                                          .setorNome,
                                                                      openJob: (plantoesItem.vagasStatus ==
                                                                              'aberta') ||
                                                                          (plantoesItem.vagasStatus ==
                                                                              'anunciada'),
                                                                      isDisabled: !((plantoesItem.medicoId ==
                                                                              currentUserUid) ||
                                                                          ((plantoesItem.vagasStatus == 'aberta') &&
                                                                              (plantoesItem.vagasData! >= functions.currentDate()!)) ||
                                                                          ((plantoesItem.vagasStatus == 'anunciada') && (plantoesItem.vagasData! >= functions.currentDate()!))),
                                                                      showpay: plantoesItem
                                                                              .medicoId ==
                                                                          currentUserUid,
                                                                      colorpay:
                                                                          valueOrDefault<
                                                                              Color>(
                                                                        plantoesItem.pagamentoValor !=
                                                                                null
                                                                            ? FlutterFlowTheme.of(context).tertiary
                                                                            : FlutterFlowTheme.of(context).accent2,
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                      ),
                                                                      checkcolor:
                                                                          () {
                                                                        if ((plantoesItem.checkin !=
                                                                                null) &&
                                                                            (plantoesItem.checkout ==
                                                                                null)) {
                                                                          return Color(
                                                                              0xFFEBC30F);
                                                                        } else if ((plantoesItem.checkin !=
                                                                                null) &&
                                                                            (plantoesItem.checkout !=
                                                                                null)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .tertiary;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .accent2;
                                                                        }
                                                                      }(),
                                                                    ),
                                                                  ),
                                                                  if (true)
                                                                    FFButtonWidget(
                                                                      onPressed: !((plantoesItem.medicoId == currentUserUid) ||
                                                                              ((plantoesItem.vagasStatus == 'aberta') && (plantoesItem.vagasData! >= functions.currentDate()!)) ||
                                                                              ((plantoesItem.vagasStatus == 'anunciada') && (plantoesItem.vagasData! >= functions.currentDate()!)))
                                                                          ? null
                                                                          : () async {
                                                                              logFirebaseEvent('ESCALAS_PAGE__BTN_ON_TAP');
                                                                              logFirebaseEvent('Button_bottom_sheet');
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                useSafeArea: true,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(context).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: VagaBottomSheetWidget(
                                                                                        speciality: plantoesItem.especialidadeNome,
                                                                                        value: plantoesItem.vagasValor?.toDouble(),
                                                                                        hospital: plantoesItem.hospitalNome,
                                                                                        date: plantoesItem.vagasData,
                                                                                        datecreated: plantoesItem.vagasCreatedate,
                                                                                        startTime: plantoesItem.vagasHorainicio?.time,
                                                                                        endTime: plantoesItem.vagasHorafim?.time,
                                                                                        shift: plantoesItem.vagasPeriodoNome,
                                                                                        type: plantoesItem.vagasTipoNome,
                                                                                        address: plantoesItem.hospitalEnd,
                                                                                        lat: plantoesItem.hospitalLat,
                                                                                        lon: plantoesItem.hospitalLog,
                                                                                        jobid: plantoesItem.vagasId,
                                                                                        contractor: plantoesItem.grupoNome,
                                                                                        contractorName: plantoesItem.escalistaNome,
                                                                                        contractorPhone: plantoesItem.escalistaTelefone,
                                                                                        contractorEmail: plantoesItem.escalistaEmail,
                                                                                        payday: plantoesItem.vagasDatapagamento,
                                                                                        payment: plantoesItem.vagasFormarecebimentoNome,
                                                                                        avatarHospital: plantoesItem.hospitalAvatar,
                                                                                        sector: plantoesItem.setorNome,
                                                                                        candidates: containerVwVagasCandidaturasRowList.where((e) => e.vagasId == plantoesItem.vagasId).toList(),
                                                                                        showFavorite: plantoesItem.medicoFavorito,
                                                                                        callback: () async {
                                                                                          logFirebaseEvent('_backend_call');
                                                                                          _model.workHopistalsList = await VwVagasCandidaturasTable().queryRows(
                                                                                            queryFn: (q) => q
                                                                                                .eqOrNull(
                                                                                                  'medico_id',
                                                                                                  currentUserUid,
                                                                                                )
                                                                                                .eqOrNull(
                                                                                                  'candidatura_status',
                                                                                                  'APROVADO',
                                                                                                ),
                                                                                          );
                                                                                          logFirebaseEvent('_backend_call');
                                                                                          _model.reloadQuery = await VwVagasCandidaturasTable().queryRows(
                                                                                            queryFn: (q) => q
                                                                                                .inFilterOrNull(
                                                                                                  'hospital_id',
                                                                                                  _model.workHopistalsList?.map((e) => e.hospitalId).withoutNulls.toList()?.unique((e) => e)?.sortedList(keyOf: (e) => e, desc: false),
                                                                                                )
                                                                                                .neqOrNull(
                                                                                                  'vagas_status',
                                                                                                  'cancelada',
                                                                                                ),
                                                                                          );
                                                                                          logFirebaseEvent('_update_page_state');
                                                                                          _model.query = _model.reloadQuery!.toList().cast<VwVagasCandidaturasRow>();
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));

                                                                              safeSetState(() {});
                                                                            },
                                                                      text: '',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.088,
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
                                                                            BorderRadius.circular(valueOrDefault<double>(
                                                                          FFAppConstants
                                                                              .borderM,
                                                                          0.0,
                                                                        )),
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
                                                    );
                                                  },
                                                ),
                                              ].divide(SizedBox(
                                                  height:
                                                      FFAppConstants.halfGap)),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ]
                                      .addToStart(
                                          SizedBox(height: FFAppConstants.Gap))
                                      .addToEnd(SizedBox(height: 2.0)),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: FFAppConstants.Gap)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
