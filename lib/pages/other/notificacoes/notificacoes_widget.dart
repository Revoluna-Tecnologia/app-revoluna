import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/back_top_bar/back_top_bar_widget.dart';
import '/components/notification_card/notification_card_widget.dart';
import '/components/vagas/no_notifications/no_notifications_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notificacoes_model.dart';
export 'notificacoes_model.dart';

class NotificacoesWidget extends StatefulWidget {
  const NotificacoesWidget({
    super.key,
    this.notificationsQuery,
  });

  final List<NotificationsRow>? notificationsQuery;

  static String routeName = 'Notificacoes';
  static String routePath = '/notificacoes';

  @override
  State<NotificacoesWidget> createState() => _NotificacoesWidgetState();
}

class _NotificacoesWidgetState extends State<NotificacoesWidget> {
  late NotificacoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificacoesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Notificacoes'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NOTIFICACOES_Notificacoes_ON_INIT_STATE');
      logFirebaseEvent('Notificacoes_update_page_state');
      _model.notifications =
          widget!.notificationsQuery!.toList().cast<NotificationsRow>();
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
                        'NOTIFICACOES_Container_bdcz8mfv_CALLBACK');
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
                child: Text(
                  'Notificações',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        font: GoogleFonts.geologica(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Builder(
                  builder: (context) {
                    final notificationsList = _model.notifications
                        .sortedList(keyOf: (e) => e.createdAt, desc: true)
                        .toList();
                    if (notificationsList.isEmpty) {
                      return NoNotificationsWidget(
                        text: 'Sem notificações para mostrar',
                      );
                    }

                    return RefreshIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                      onRefresh: () async {
                        logFirebaseEvent(
                            'NOTIFICACOES_ListView_jt9pfkcr_ON_PULL_T');
                        logFirebaseEvent('ListView_backend_call');
                        _model.notificationsQueryReload =
                            await NotificationsTable().queryRows(
                          queryFn: (q) => q.order('created_at'),
                        );
                        logFirebaseEvent('ListView_update_page_state');
                        _model.notifications = _model.notificationsQueryReload!
                            .toList()
                            .cast<NotificationsRow>();
                        safeSetState(() {});
                      },
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: notificationsList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 2.0),
                        itemBuilder: (context, notificationsListIndex) {
                          final notificationsListItem =
                              notificationsList[notificationsListIndex];
                          return Stack(
                            children: [
                              wrapWithModel(
                                model: _model.notificationCardModels.getModel(
                                  notificationsListItem.id,
                                  notificationsListIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: NotificationCardWidget(
                                  key: Key(
                                    'Key8gz_${notificationsListItem.id}',
                                  ),
                                  title: notificationsListItem.title,
                                  body: notificationsListItem.body,
                                  isRead: notificationsListItem.isRead,
                                ),
                              ),
                              if (true)
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'NOTIFICACOES_PAGE__BTN_ON_TAP');
                                    logFirebaseEvent('Button_backend_call');
                                    _model.updatedNotfRow =
                                        await NotificationsTable().update(
                                      data: {
                                        'is_read': true,
                                        'read_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        notificationsListItem.id,
                                      ),
                                      returnRows: true,
                                    );
                                    if (_model.updatedNotfRow?.firstOrNull
                                            ?.isRead ==
                                        true) {
                                      logFirebaseEvent('Button_backend_call');
                                      _model.notificationsQueryUpdate =
                                          await NotificationsTable().queryRows(
                                        queryFn: (q) => q,
                                      );
                                      logFirebaseEvent(
                                          'Button_update_page_state');
                                      _model.notifications = _model
                                          .notificationsQueryUpdate!
                                          .toList()
                                          .cast<NotificationsRow>();
                                      safeSetState(() {});
                                      logFirebaseEvent('Button_backend_call');
                                      await NotificationreadCall.call(
                                        userId: currentUserUid,
                                      );

                                      logFirebaseEvent('Button_custom_action');
                                      await actions.unreadNotifications();
                                    }

                                    safeSetState(() {});
                                  },
                                  text: '',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.088,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  showLoadingIndicator: false,
                                ),
                            ],
                          );
                        },
                      ),
                    );
                  },
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
