import '/components/loading/banner_loading/banner_loading_widget.dart';
import '/components/loading/calendar_loading/calendar_loading_widget.dart';
import '/components/loading/lista_home_loading/lista_home_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'initial_loading_widget.dart' show InitialLoadingWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InitialLoadingModel extends FlutterFlowModel<InitialLoadingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for bannerLoading component.
  late BannerLoadingModel bannerLoadingModel;
  // Model for calendarLoading component.
  late CalendarLoadingModel calendarLoadingModel;
  // Model for listaHomeLoading component.
  late ListaHomeLoadingModel listaHomeLoadingModel;

  @override
  void initState(BuildContext context) {
    bannerLoadingModel = createModel(context, () => BannerLoadingModel());
    calendarLoadingModel = createModel(context, () => CalendarLoadingModel());
    listaHomeLoadingModel = createModel(context, () => ListaHomeLoadingModel());
  }

  @override
  void dispose() {
    bannerLoadingModel.dispose();
    calendarLoadingModel.dispose();
    listaHomeLoadingModel.dispose();
  }
}
