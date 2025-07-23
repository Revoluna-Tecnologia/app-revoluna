import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/header/header_widget.dart';
import '/components/vagas/card_vagas/card_vagas_widget.dart';
import '/components/vagas/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool visibleValues = false;

  bool isBottomSheetLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - appTracking] action in HomePage widget.
  bool? appTrackingCopy;
  // Stores action output result for [Backend Call - Update Row(s)] action in HomePage widget.
  List<MedicosRow>? medicoTrackingUpdateTrueCopy;
  // Stores action output result for [Backend Call - Update Row(s)] action in HomePage widget.
  List<MedicosRow>? medicoTrackingUpdateFalseCopy;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Models for cardVagas dynamic component.
  late FlutterFlowDynamicModels<CardVagasModel> cardVagasModels;
  // Model for drawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    cardVagasModels = FlutterFlowDynamicModels(() => CardVagasModel());
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    cardVagasModels.dispose();
    drawerMenuModel.dispose();
  }
}
