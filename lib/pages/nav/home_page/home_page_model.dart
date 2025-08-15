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
import '/flutter_flow/request_manager.dart';

import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool visibleValues = false;

  bool isBottomSheetLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - appTracking] action in HomePage widget.
  bool? appTracking;
  // Stores action output result for [Backend Call - Update Row(s)] action in HomePage widget.
  List<MedicosRow>? medicoTrackingUpdateTrueCopy;
  // Stores action output result for [Backend Call - Update Row(s)] action in HomePage widget.
  List<MedicosRow>? medicoTrackingUpdateFalseCopy;
  // Model for drawerMenu component.
  late DrawerMenuModel drawerMenuModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  Stream<List<CleanHospitalRow>>? containerSupabaseStream;
  // Models for cardVagasSlim dynamic component.
  late FlutterFlowDynamicModels<CardVagasSlimModel> cardVagasSlimModels;

  /// Query cache managers for this widget.

  final _bannerManager = FutureRequestManager<List<BannerMKTRow>>();
  Future<List<BannerMKTRow>> banner({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<BannerMKTRow>> Function() requestFn,
  }) =>
      _bannerManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBannerCache() => _bannerManager.clear();
  void clearBannerCacheKey(String? uniqueKey) =>
      _bannerManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
    headerModel = createModel(context, () => HeaderModel());
    cardVagasSlimModels = FlutterFlowDynamicModels(() => CardVagasSlimModel());
  }

  @override
  void dispose() {
    drawerMenuModel.dispose();
    headerModel.dispose();
    cardVagasSlimModels.dispose();

    /// Dispose query cache managers for this widget.

    clearBannerCache();
  }
}
