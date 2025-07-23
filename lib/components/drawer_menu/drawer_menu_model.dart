import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/cadastro/back_top_bar/back_top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'drawer_menu_widget.dart' show DrawerMenuWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerMenuModel extends FlutterFlowModel<DrawerMenuWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BackTopBar component.
  late BackTopBarModel backTopBarModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<NotificationsRow>? notificationsQuery;

  @override
  void initState(BuildContext context) {
    backTopBarModel = createModel(context, () => BackTopBarModel());
  }

  @override
  void dispose() {
    backTopBarModel.dispose();
  }
}
