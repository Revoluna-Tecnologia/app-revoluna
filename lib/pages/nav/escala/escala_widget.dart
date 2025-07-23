import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/vagas/card_vagas/card_vagas_widget.dart';
import '/components/vagas/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'escala_model.dart';
export 'escala_model.dart';

class EscalaWidget extends StatefulWidget {
  const EscalaWidget({
    super.key,
    bool? fromhome,
  }) : this.fromhome = fromhome ?? false;

  final bool fromhome;

  static String routeName = 'Escala';
  static String routePath = '/escala';

  @override
  State<EscalaWidget> createState() => _EscalaWidgetState();
}

class _EscalaWidgetState extends State<EscalaWidget>
    with TickerProviderStateMixin {
  late EscalaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscalaModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                child: wrapWithModel(
                  model: _model.headerModel,
                  updateCallback: () => safeSetState(() {}),
                  child: HeaderWidget(),
                ),
              ),
              Expanded(
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
                        children: [
                          Text(
                            'Minha Escala',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.geologica(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
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
                    Expanded(
                      child: FutureBuilder<List<CandidaturasRow>>(
                        future: CandidaturasTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'medicos_id',
                                currentUserUid,
                              )
                              .eqOrNull(
                                'candidatura_status',
                                _model.vagaStatus,
                              ),
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
                          List<CandidaturasRow> containerCandidaturasRowList =
                              snapshot.data!;

                          return Container(
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x26A369ED),
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  spreadRadius: 5.0,
                                )
                              ],
                            ),
                            child: FutureBuilder<List<VagasCompletoRow>>(
                              future: VagasCompletoTable().queryRows(
                                queryFn: (q) => q.inFilterOrNull(
                                  'vagas_id',
                                  containerCandidaturasRowList
                                      .map((e) => e.vagasId)
                                      .toList(),
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<VagasCompletoRow>
                                    tabBarVagasCompletoRowList = snapshot.data!;

                                return Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(0.0, 0),
                                      child: TabBar(
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .accent2,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 14.0,
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
                                        unselectedLabelStyle: FlutterFlowTheme
                                                .of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 14.0,
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
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        tabs: [
                                          Tab(
                                            text: 'Em análise',
                                          ),
                                          Tab(
                                            text: 'Confirmadas',
                                          ),
                                          Tab(
                                            text: 'Encerradas',
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [
                                            () async {
                                              _model.vagaStatus = 'PENDENTE';
                                            },
                                            () async {
                                              _model.vagaStatus = 'APROVADO';
                                            },
                                            () async {
                                              _model.vagaStatus = 'REPROVADO';
                                            }
                                          ][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: [
                                          ClipRRect(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x26A369ED),
                                                    offset: Offset(
                                                      0.0,
                                                      0.0,
                                                    ),
                                                    spreadRadius: 5.0,
                                                  )
                                                ],
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final tabBarVar =
                                                      tabBarVagasCompletoRowList
                                                          .map((e) => e)
                                                          .toList();

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.0),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: tabBarVar.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 2.0),
                                                    itemBuilder: (context,
                                                        tabBarVarIndex) {
                                                      final tabBarVarItem =
                                                          tabBarVar[
                                                              tabBarVarIndex];
                                                      return Stack(
                                                        children: [
                                                          wrapWithModel(
                                                            model: _model
                                                                .cardVagasModels1
                                                                .getModel(
                                                              tabBarVarItem
                                                                  .vagasId!,
                                                              tabBarVarIndex,
                                                            ),
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                CardVagasWidget(
                                                              key: Key(
                                                                'Key86n_${tabBarVarItem.vagasId!}',
                                                              ),
                                                              specialty:
                                                                  tabBarVarItem
                                                                      .especialidadeNome,
                                                              value:
                                                                  formatNumber(
                                                                tabBarVarItem
                                                                    .vagasValor,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .commaDecimal,
                                                                currency:
                                                                    'R\$ ',
                                                              ),
                                                              date:
                                                                  dateTimeFormat(
                                                                "dd/MM",
                                                                tabBarVarItem
                                                                    .vagasData,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              datecount:
                                                                  dateTimeFormat(
                                                                "relative",
                                                                tabBarVarItem
                                                                    .vagasCreatedate,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              shift: tabBarVarItem
                                                                  .periodoNome,
                                                              type:
                                                                  tabBarVarItem
                                                                      .tipoNome,
                                                              hospital:
                                                                  tabBarVarItem
                                                                      .hospitalNome,
                                                              vaga:
                                                                  tabBarVarItem
                                                                      .vagasId,
                                                              showPay: false,
                                                              avatarHospital:
                                                                  tabBarVarItem
                                                                      .hospitalAvatar,
                                                            ),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model
                                                                  .isBottomSheetLoading) {
                                                                return;
                                                              }

                                                              _model.isBottomSheetLoading =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
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
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          VagaBottomSheetWidget(
                                                                        speciality:
                                                                            tabBarVarItem.especialidadeNome,
                                                                        value: tabBarVarItem
                                                                            .vagasValor
                                                                            ?.toDouble(),
                                                                        hospital:
                                                                            tabBarVarItem.hospitalNome,
                                                                        date: tabBarVarItem
                                                                            .vagasData,
                                                                        datecreated:
                                                                            tabBarVarItem.vagasCreatedate,
                                                                        startTime: tabBarVarItem
                                                                            .vagasHorainicio
                                                                            ?.time,
                                                                        endTime: tabBarVarItem
                                                                            .vagasHorafim
                                                                            ?.time,
                                                                        shift: tabBarVarItem
                                                                            .periodoNome,
                                                                        type: tabBarVarItem
                                                                            .tipoNome,
                                                                        lat: tabBarVarItem
                                                                            .hospitalLat,
                                                                        lon: tabBarVarItem
                                                                            .hospitalLog,
                                                                        address:
                                                                            tabBarVarItem.hospitalEnd,
                                                                        vagaID:
                                                                            tabBarVarItem.vagasId,
                                                                        contractor:
                                                                            tabBarVarItem.grupoNome,
                                                                        contractorName:
                                                                            tabBarVarItem.grupoResponsavel,
                                                                        contractorPhone:
                                                                            tabBarVarItem.escalistaTelefone,
                                                                        contractorEmail:
                                                                            tabBarVarItem.escalistaEmail,
                                                                        buttonVis:
                                                                            true,
                                                                        payday:
                                                                            tabBarVarItem.vagasDatapagamento,
                                                                        payment:
                                                                            tabBarVarItem.vagasFormarecebimento,
                                                                        avatarHospital:
                                                                            tabBarVarItem.hospitalAvatar,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));

                                                              _model.isBottomSheetLoading =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              return;
                                                            },
                                                            text: '',
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 110.0,
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
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          FutureBuilder<List<PagamentosRow>>(
                                            future: PagamentosTable().queryRows(
                                              queryFn: (q) => q.eqOrNull(
                                                'medicos_id',
                                                currentUserUid,
                                              ),
                                            ),
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<PagamentosRow>
                                                  containerPagamentosRowList =
                                                  snapshot.data!;

                                              return ClipRRect(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x26A369ED),
                                                        offset: Offset(
                                                          0.0,
                                                          0.0,
                                                        ),
                                                        spreadRadius: 5.0,
                                                      )
                                                    ],
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final tabBarVar =
                                                          tabBarVagasCompletoRowList
                                                              .map((e) => e)
                                                              .toList();

                                                      return ListView.separated(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 2.0),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            tabBarVar.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 2.0),
                                                        itemBuilder: (context,
                                                            tabBarVarIndex) {
                                                          final tabBarVarItem =
                                                              tabBarVar[
                                                                  tabBarVarIndex];
                                                          return Stack(
                                                            children: [
                                                              wrapWithModel(
                                                                model: _model
                                                                    .cardVagasModels2
                                                                    .getModel(
                                                                  tabBarVarItem
                                                                      .vagasId!,
                                                                  tabBarVarIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    CardVagasWidget(
                                                                  key: Key(
                                                                    'Keydsa_${tabBarVarItem.vagasId!}',
                                                                  ),
                                                                  specialty:
                                                                      tabBarVarItem
                                                                          .especialidadeNome,
                                                                  value:
                                                                      formatNumber(
                                                                    tabBarVarItem
                                                                        .vagasValor,
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                    currency:
                                                                        'R\$ ',
                                                                  ),
                                                                  date:
                                                                      dateTimeFormat(
                                                                    "dd/MM",
                                                                    tabBarVarItem
                                                                        .vagasData,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  datecount:
                                                                      dateTimeFormat(
                                                                    "relative",
                                                                    tabBarVarItem
                                                                        .vagasCreatedate,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  shift: tabBarVarItem
                                                                      .periodoNome,
                                                                  type: tabBarVarItem
                                                                      .tipoNome,
                                                                  hospital:
                                                                      tabBarVarItem
                                                                          .hospitalNome,
                                                                  vaga: tabBarVarItem
                                                                      .vagasId,
                                                                  showPay: true,
                                                                  colorPay: containerPagamentosRowList
                                                                          .where((e) =>
                                                                              e.vagasId ==
                                                                              tabBarVarItem
                                                                                  .vagasId)
                                                                          .toList()
                                                                          .isNotEmpty
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                  avatarHospital:
                                                                      tabBarVarItem
                                                                          .hospitalAvatar,
                                                                ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (_model
                                                                      .isBottomSheetLoading) {
                                                                    return;
                                                                  }

                                                                  _model.isBottomSheetLoading =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
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
                                                                                tabBarVarItem.especialidadeNome,
                                                                            value:
                                                                                tabBarVarItem.vagasValor?.toDouble(),
                                                                            hospital:
                                                                                tabBarVarItem.hospitalNome,
                                                                            date:
                                                                                tabBarVarItem.vagasData,
                                                                            datecreated:
                                                                                tabBarVarItem.vagasCreatedate,
                                                                            startTime:
                                                                                tabBarVarItem.vagasHorainicio?.time,
                                                                            endTime:
                                                                                tabBarVarItem.vagasHorafim?.time,
                                                                            shift:
                                                                                tabBarVarItem.periodoNome,
                                                                            type:
                                                                                tabBarVarItem.tipoNome,
                                                                            lat:
                                                                                tabBarVarItem.hospitalLat,
                                                                            lon:
                                                                                tabBarVarItem.hospitalLog,
                                                                            address:
                                                                                tabBarVarItem.hospitalEnd,
                                                                            vagaID:
                                                                                tabBarVarItem.vagasId,
                                                                            contractor:
                                                                                tabBarVarItem.grupoNome,
                                                                            contractorName:
                                                                                tabBarVarItem.grupoResponsavel,
                                                                            contractorPhone:
                                                                                tabBarVarItem.escalistaTelefone,
                                                                            contractorEmail:
                                                                                tabBarVarItem.escalistaEmail,
                                                                            buttonVis:
                                                                                false,
                                                                            payday:
                                                                                tabBarVarItem.vagasDatapagamento,
                                                                            payment:
                                                                                tabBarVarItem.vagasFormarecebimento,
                                                                            avatarHospital:
                                                                                tabBarVarItem.hospitalAvatar,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));

                                                                  _model.isBottomSheetLoading =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                },
                                                                text: '',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 110.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
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
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          ClipRRect(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x26A369ED),
                                                    offset: Offset(
                                                      0.0,
                                                      0.0,
                                                    ),
                                                    spreadRadius: 5.0,
                                                  )
                                                ],
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final tabBarVar =
                                                      tabBarVagasCompletoRowList
                                                          .map((e) => e)
                                                          .toList();

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.0),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: tabBarVar.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 2.0),
                                                    itemBuilder: (context,
                                                        tabBarVarIndex) {
                                                      final tabBarVarItem =
                                                          tabBarVar[
                                                              tabBarVarIndex];
                                                      return Stack(
                                                        children: [
                                                          wrapWithModel(
                                                            model: _model
                                                                .cardVagasModels3
                                                                .getModel(
                                                              tabBarVarItem
                                                                  .vagasId!,
                                                              tabBarVarIndex,
                                                            ),
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                CardVagasWidget(
                                                              key: Key(
                                                                'Keyxob_${tabBarVarItem.vagasId!}',
                                                              ),
                                                              specialty:
                                                                  tabBarVarItem
                                                                      .especialidadeNome,
                                                              value:
                                                                  formatNumber(
                                                                tabBarVarItem
                                                                    .vagasValor,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .commaDecimal,
                                                                currency:
                                                                    'R\$ ',
                                                              ),
                                                              date:
                                                                  dateTimeFormat(
                                                                "dd/MM",
                                                                tabBarVarItem
                                                                    .vagasData,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              datecount:
                                                                  dateTimeFormat(
                                                                "relative",
                                                                tabBarVarItem
                                                                    .vagasCreatedate,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              shift: tabBarVarItem
                                                                  .periodoNome,
                                                              type:
                                                                  tabBarVarItem
                                                                      .tipoNome,
                                                              hospital:
                                                                  tabBarVarItem
                                                                      .hospitalNome,
                                                              vaga:
                                                                  tabBarVarItem
                                                                      .vagasId,
                                                              showPay: false,
                                                              avatarHospital:
                                                                  tabBarVarItem
                                                                      .hospitalAvatar,
                                                            ),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model
                                                                  .isBottomSheetLoading) {
                                                                return;
                                                              }

                                                              _model.isBottomSheetLoading =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
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
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          VagaBottomSheetWidget(
                                                                        speciality:
                                                                            tabBarVarItem.especialidadeNome,
                                                                        value: tabBarVarItem
                                                                            .vagasValor
                                                                            ?.toDouble(),
                                                                        hospital:
                                                                            tabBarVarItem.hospitalNome,
                                                                        date: tabBarVarItem
                                                                            .vagasData,
                                                                        datecreated:
                                                                            tabBarVarItem.vagasCreatedate,
                                                                        startTime: tabBarVarItem
                                                                            .vagasHorainicio
                                                                            ?.time,
                                                                        endTime: tabBarVarItem
                                                                            .vagasHorafim
                                                                            ?.time,
                                                                        shift: tabBarVarItem
                                                                            .periodoNome,
                                                                        type: tabBarVarItem
                                                                            .tipoNome,
                                                                        lat: tabBarVarItem
                                                                            .hospitalLat,
                                                                        lon: tabBarVarItem
                                                                            .hospitalLog,
                                                                        address:
                                                                            tabBarVarItem.hospitalEnd,
                                                                        vagaID:
                                                                            tabBarVarItem.vagasId,
                                                                        contractor:
                                                                            tabBarVarItem.grupoNome,
                                                                        contractorName:
                                                                            tabBarVarItem.grupoResponsavel,
                                                                        contractorPhone:
                                                                            tabBarVarItem.escalistaTelefone,
                                                                        contractorEmail:
                                                                            tabBarVarItem.escalistaEmail,
                                                                        buttonVis:
                                                                            false,
                                                                        payday:
                                                                            tabBarVarItem.vagasDatapagamento,
                                                                        payment:
                                                                            tabBarVarItem.vagasFormarecebimento,
                                                                        avatarHospital:
                                                                            tabBarVarItem.hospitalAvatar,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));

                                                              _model.isBottomSheetLoading =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              return;
                                                            },
                                                            text: '',
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 110.0,
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
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: FFAppConstants.doubleGap)),
                ),
              ),
            ].divide(SizedBox(height: FFAppConstants.doubleGap)),
          ),
        ),
      ),
    );
  }
}
