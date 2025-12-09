import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/dialogs/negative_informative_box/negative_informative_box_widget.dart';
import '/components/loading/banner_loading/banner_loading_widget.dart';
import '/components/vagas/card_vagas_initial/card_vagas_initial_widget.dart';
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
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'dart:async';
import 'initial_page_widget.dart' show InitialPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InitialPageModel extends FlutterFlowModel<InitialPageWidget> {
  ///  Local state fields for this page.

  bool visibleValues = false;

  bool isBottomSheetLoading = false;

  bool calendarView = true;

  ///  State fields for stateful widgets in this page.

  bool requestCompleted3 = false;
  String? requestLastUniqueKey3;
  // Stores action output result for [Custom Action - launchWhatsAppChat] action in FloatingActionButton widget.
  bool? whatsappInitial;
  bool requestCompleted2 = false;
  String? requestLastUniqueKey2;
  bool requestCompleted1 = false;
  String? requestLastUniqueKey1;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Stores action output result for [Custom Action - launchWhatsAppChat] action in Button widget.
  bool? whatsappBanner;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Models for cardVagasInitial dynamic component.
  late FlutterFlowDynamicModels<CardVagasInitialModel> cardVagasInitialModels1;
  // Models for cardVagasInitial dynamic component.
  late FlutterFlowDynamicModels<CardVagasInitialModel> cardVagasInitialModels2;
  // Model for emptyList component.
  late EmptyListModel emptyListModel1;
  // Model for emptyList component.
  late EmptyListModel emptyListModel2;

  /// Query cache managers for this widget.

  final _bannersManager = FutureRequestManager<List<BannerMktRow>>();
  Future<List<BannerMktRow>> banners({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<BannerMktRow>> Function() requestFn,
  }) =>
      _bannersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBannersCache() => _bannersManager.clear();
  void clearBannersCacheKey(String? uniqueKey) =>
      _bannersManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    cardVagasInitialModels1 =
        FlutterFlowDynamicModels(() => CardVagasInitialModel());
    cardVagasInitialModels2 =
        FlutterFlowDynamicModels(() => CardVagasInitialModel());
    emptyListModel1 = createModel(context, () => EmptyListModel());
    emptyListModel2 = createModel(context, () => EmptyListModel());
  }

  @override
  void dispose() {
    cardVagasInitialModels1.dispose();
    cardVagasInitialModels2.dispose();
    emptyListModel1.dispose();
    emptyListModel2.dispose();

    /// Dispose query cache managers for this widget.

    clearBannersCache();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted3;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted2;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted1;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
