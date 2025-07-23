import '/components/loading/banner_loading/banner_loading_widget.dart';
import '/components/loading/lista_home_loading/lista_home_loading_widget.dart';
import '/components/loading/saldos_loading/saldos_loading_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'home_loading_widget.dart' show HomeLoadingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeLoadingModel extends FlutterFlowModel<HomeLoadingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for bannerLoading component.
  late BannerLoadingModel bannerLoadingModel;
  // Model for saldosLoading component.
  late SaldosLoadingModel saldosLoadingModel;
  // Model for listaHomeLoading component.
  late ListaHomeLoadingModel listaHomeLoadingModel;

  @override
  void initState(BuildContext context) {
    bannerLoadingModel = createModel(context, () => BannerLoadingModel());
    saldosLoadingModel = createModel(context, () => SaldosLoadingModel());
    listaHomeLoadingModel = createModel(context, () => ListaHomeLoadingModel());
  }

  @override
  void dispose() {
    bannerLoadingModel.dispose();
    saldosLoadingModel.dispose();
    listaHomeLoadingModel.dispose();
  }
}
