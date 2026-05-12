import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/loading/escala_list_loading/escala_list_loading_widget.dart';
import '/components/loading/pages/escalas_loading/escalas_loading_widget.dart';
import '/components/vagas/card_escala/card_escala_widget.dart';
import '/components/vagas/empty_list/empty_list_widget.dart';
import '/components/vagas/empty_list_houston/empty_list_houston_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/other/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                child: FutureBuilder<List<VwVagasCandidaturasRow>>(
                  future: FFAppState()
                      .vagasEscala(
                    requestFn: () => VwVagasCandidaturasTable().queryRows(
                      queryFn: (q) => q.neqOrNull(
                        'vaga_status',
                        'cancelada',
                      ),
                    ),
                  )
                      .then((result) {
                    _model.requestCompleted = true;
                    return result;
                  }),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return EscalasLoadingWidget();
                    }
                    List<VwVagasCandidaturasRow>
                        containerVwVagasCandidaturasRowList = snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: RefreshIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                        onRefresh: () async {
                          logFirebaseEvent(
                              'ESCALAS_Column_tav8f1gx_ON_PULL_TO_REFRE');
                          logFirebaseEvent('Column_refresh_database_request');
                          safeSetState(() {
                            FFAppState().clearVagasEscalaCache();
                            _model.requestCompleted = false;
                          });
                          await _model.waitForRequestCompleted();
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
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
                                  mainAxisSize: MainAxisSize.min,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Minha escala',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.geologica(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.1,
                                        events:
                                            containerVwVagasCandidaturasRowList
                                                .where((e) =>
                                                    (e.medicoId ==
                                                        currentUserUid) &&
                                                    (e.candidaturaStatus ==
                                                        'APROVADO'))
                                                .toList()
                                                .map((e) => e.vagaData)
                                                .withoutNulls
                                                .toList(),
                                        weekViewEnabled: _model.calendarView,
                                        announcedVagas:
                                            containerVwVagasCandidaturasRowList
                                                .where((e) =>
                                                    e.vagaStatus == 'anunciada')
                                                .toList()
                                                .map((e) => e.vagaData)
                                                .withoutNulls
                                                .toList(),
                                        callback: () async {},
                                      ),
                                    ),
                                    ToggleIcon(
                                      onPressed: () async {
                                        safeSetState(() => _model.calendarView =
                                            !_model.calendarView);
                                      },
                                      value: _model.calendarView,
                                      onIcon: Icon(
                                        FFIcons.kchevronDown,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      offIcon: Icon(
                                        FFIcons.kchevronUp,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                    ),
                                  ].addToEnd(
                                      SizedBox(height: FFAppConstants.Gap)),
                                ),
                              ),
                              FutureBuilder<List<UserProfileRow>>(
                                future: FFAppState().userProfile(
                                  requestFn: () => UserProfileTable().queryRows(
                                    queryFn: (q) => q,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return EscalaListLoadingWidget();
                                  }
                                  List<UserProfileRow> listUserProfileRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        if (containerVwVagasCandidaturasRowList
                                            .isNotEmpty) {
                                          return Builder(
                                            builder: (context) {
                                              final hospitais =
                                                  containerVwVagasCandidaturasRowList
                                                      .where((e) =>
                                                          (e.vagaData ==
                                                              FFAppState()
                                                                  .selectedDay) &&
                                                          (e.candidaturaStatus !=
                                                                  null &&
                                                              e.candidaturaStatus !=
                                                                  ''))
                                                      .toList()
                                                      .unique(
                                                          (e) => e.hospitalId!)
                                                      .toList();
                                              if (hospitais.isEmpty) {
                                                return EmptyListWidget();
                                              }

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: hospitais.length,
                                                itemBuilder:
                                                    (context, hospitaisIndex) {
                                                  final hospitaisItem =
                                                      hospitais[hospitaisIndex];
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    valueOrDefault<
                                                                        double>(
                                                                      FFAppConstants
                                                                          .doubleGap,
                                                                      0.0,
                                                                    ),
                                                                    valueOrDefault<
                                                                        double>(
                                                                      FFAppConstants
                                                                          .Gap,
                                                                      0.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                hospitaisItem
                                                                    .hospitalNome,
                                                                'hospital',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .geologica(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Builder(
                                                          builder: (context) {
                                                            final setores = containerVwVagasCandidaturasRowList
                                                                .where((e) =>
                                                                    (e.vagaData == FFAppState().selectedDay) &&
                                                                    (e.hospitalId ==
                                                                        hospitaisItem
                                                                            .hospitalId) &&
                                                                    (e.candidaturaStatus !=
                                                                            null &&
                                                                        e.candidaturaStatus !=
                                                                            ''))
                                                                .toList()
                                                                .unique((e) =>
                                                                    e.setorId!)
                                                                .toList();

                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: List.generate(
                                                                  setores
                                                                      .length,
                                                                  (setoresIndex) {
                                                                final setoresItem =
                                                                    setores[
                                                                        setoresIndex];
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            valueOrDefault<double>(
                                                                              FFAppConstants.doubleGap,
                                                                              0.0,
                                                                            ),
                                                                            valueOrDefault<double>(
                                                                              FFAppConstants.halfGap,
                                                                              0.0,
                                                                            ),
                                                                            0.0,
                                                                            valueOrDefault<double>(
                                                                              FFAppConstants.halfGap,
                                                                              0.0,
                                                                            )),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            setoresItem.setorNome,
                                                                            'setor',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                font: GoogleFonts.geologica(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final plantoes = containerVwVagasCandidaturasRowList
                                                                            .where((e) =>
                                                                                (e.vagaData == FFAppState().selectedDay) &&
                                                                                (e.setorId == setoresItem.setorId) &&
                                                                                (e.hospitalId == hospitaisItem.hospitalId))
                                                                            .toList()
                                                                            .unique((e) => e.vagaId!)
                                                                            .toList();
                                                                        if (plantoes
                                                                            .isEmpty) {
                                                                          return EmptyListWidget();
                                                                        }

                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: List.generate(
                                                                              plantoes.length,
                                                                              (plantoesIndex) {
                                                                            final plantoesItem =
                                                                                plantoes[plantoesIndex];
                                                                            return Stack(
                                                                              children: [
                                                                                wrapWithModel(
                                                                                  model: _model.cardEscalaModels.getModel(
                                                                                    plantoesItem.vagaId!,
                                                                                    plantoesIndex,
                                                                                  ),
                                                                                  updateCallback: () => safeSetState(() {}),
                                                                                  child: CardEscalaWidget(
                                                                                    key: Key(
                                                                                      'Key7o5_${plantoesItem.vagaId!}',
                                                                                    ),
                                                                                    shift: plantoesItem.periodoNome,
                                                                                    type: plantoesItem.tiposVagaNome,
                                                                                    start: dateTimeFormat(
                                                                                      "Hm",
                                                                                      plantoesItem.vagaHorainicio?.time,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    end: dateTimeFormat(
                                                                                      "Hm",
                                                                                      plantoesItem.vagaHorafim?.time,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    drName: plantoesItem.vagaStatus == 'aberta'
                                                                                        ? 'Vaga aberta'
                                                                                        : valueOrDefault<String>(
                                                                                            '${plantoesItem.medicoPrimeiroNome} ${plantoesItem.medicoSobrenome}',
                                                                                            'Vaga aberta',
                                                                                          ),
                                                                                    avatarMedico: listUserProfileRowList.where((e) => e.id == plantoesItem.medicoId).toList().firstOrNull?.profilepicture != null && listUserProfileRowList.where((e) => e.id == plantoesItem.medicoId).toList().firstOrNull?.profilepicture != '' ? listUserProfileRowList.where((e) => e.id == plantoesItem.medicoId).toList().firstOrNull?.profilepicture : null,
                                                                                    sector: plantoesItem.setorNome,
                                                                                    openJob: (plantoesItem.vagaStatus == 'aberta') || (plantoesItem.vagaStatus == 'anunciada'),
                                                                                    isDisabled: !((plantoesItem.medicoId == currentUserUid) || ((plantoesItem.vagaStatus == 'aberta') && (plantoesItem.vagaData! >= functions.currentDate()!)) || ((plantoesItem.vagaStatus == 'anunciada') && (plantoesItem.vagaData! >= functions.currentDate()!))),
                                                                                    showpay: plantoesItem.medicoId == currentUserUid,
                                                                                    colorpay: valueOrDefault<Color>(
                                                                                      plantoesItem.pagamentoValor != null ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).accent2,
                                                                                      FlutterFlowTheme.of(context).accent2,
                                                                                    ),
                                                                                    checkcolor: () {
                                                                                      if ((plantoesItem.checkin != null) && (plantoesItem.checkout == null)) {
                                                                                        return Color(0xFFEBC30F);
                                                                                      } else if ((plantoesItem.checkin != null) && (plantoesItem.checkout != null)) {
                                                                                        return FlutterFlowTheme.of(context).tertiary;
                                                                                      } else {
                                                                                        return FlutterFlowTheme.of(context).accent2;
                                                                                      }
                                                                                    }(),
                                                                                  ),
                                                                                ),
                                                                                if (true)
                                                                                  FFButtonWidget(
                                                                                    onPressed: !((plantoesItem.medicoId == currentUserUid) || ((plantoesItem.vagaStatus == 'aberta') && (plantoesItem.vagaData! >= functions.currentDate()!)) || ((plantoesItem.vagaStatus == 'anunciada') && (plantoesItem.vagaData! >= functions.currentDate()!)))
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
                                                                                                      value: plantoesItem.vagaValor?.toDouble(),
                                                                                                      hospital: plantoesItem.hospitalNome,
                                                                                                      date: plantoesItem.vagaData,
                                                                                                      datecreated: plantoesItem.vagaCreatedate,
                                                                                                      startTime: plantoesItem.vagaHorainicio?.time,
                                                                                                      endTime: plantoesItem.vagaHorafim?.time,
                                                                                                      shift: plantoesItem.periodoNome,
                                                                                                      type: plantoesItem.tiposVagaNome,
                                                                                                      address: plantoesItem.hospitalEnd,
                                                                                                      lat: plantoesItem.hospitalLat,
                                                                                                      lon: plantoesItem.hospitalLog,
                                                                                                      jobid: plantoesItem.vagaId,
                                                                                                      contractor: plantoesItem.grupoNome,
                                                                                                      contractorName: plantoesItem.escalistaNome,
                                                                                                      contractorPhone: plantoesItem.escalistaTelefone,
                                                                                                      contractorEmail: plantoesItem.escalistaEmail,
                                                                                                      payday: plantoesItem.vagaDatapagamento,
                                                                                                      payment: plantoesItem.formaRecebimentoNome,
                                                                                                      avatarHospital: plantoesItem.hospitalAvatar,
                                                                                                      sector: plantoesItem.setorNome,
                                                                                                      candidates: plantoesItem,
                                                                                                      callback: () async {
                                                                                                        logFirebaseEvent('_refresh_database_request');
                                                                                                        safeSetState(() {
                                                                                                          FFAppState().clearVagasEscalaCache();
                                                                                                          _model.requestCompleted = false;
                                                                                                        });
                                                                                                        await _model.waitForRequestCompleted();
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          },
                                                                                    text: '',
                                                                                    options: FFButtonOptions(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: MediaQuery.sizeOf(context).height * 0.088,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: Color(0x00A369ED),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            font: GoogleFonts.geologica(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                            color: Colors.white,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderRadius: BorderRadius.circular(valueOrDefault<double>(
                                                                                        FFAppConstants.borderM,
                                                                                        0.0,
                                                                                      )),
                                                                                    ),
                                                                                    showLoadingIndicator: false,
                                                                                  ),
                                                                              ],
                                                                            );
                                                                          }).divide(SizedBox(height: 2.0)).addToStart(SizedBox(height: 2.0)).addToEnd(
                                                                              SizedBox(height: 2.0)),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        } else {
                                          return wrapWithModel(
                                            model: _model.emptyListHoustonModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: EmptyListHoustonWidget(),
                                          );
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
