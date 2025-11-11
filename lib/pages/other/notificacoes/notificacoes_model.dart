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
import 'notificacoes_widget.dart' show NotificacoesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificacoesModel extends FlutterFlowModel<NotificacoesWidget> {
  ///  Local state fields for this page.

  List<NotificationsRow> notifications = [];
  void addToNotifications(NotificationsRow item) => notifications.add(item);
  void removeFromNotifications(NotificationsRow item) =>
      notifications.remove(item);
  void removeAtIndexFromNotifications(int index) =>
      notifications.removeAt(index);
  void insertAtIndexInNotifications(int index, NotificationsRow item) =>
      notifications.insert(index, item);
  void updateNotificationsAtIndex(
          int index, Function(NotificationsRow) updateFn) =>
      notifications[index] = updateFn(notifications[index]);

  ///  State fields for stateful widgets in this page.

  // Model for BackTopBar component.
  late BackTopBarModel backTopBarModel;
  // Stores action output result for [Backend Call - Query Rows] action in ListView widget.
  List<NotificationsRow>? notificationsQueryReload;
  // Models for notificationCard dynamic component.
  late FlutterFlowDynamicModels<NotificationCardModel> notificationCardModels;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<NotificationsRow>? updatedNotfRow;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<NotificationsRow>? notificationsQueryUpdate;

  @override
  void initState(BuildContext context) {
    backTopBarModel = createModel(context, () => BackTopBarModel());
    notificationCardModels =
        FlutterFlowDynamicModels(() => NotificationCardModel());
  }

  @override
  void dispose() {
    backTopBarModel.dispose();
    notificationCardModels.dispose();
  }
}
