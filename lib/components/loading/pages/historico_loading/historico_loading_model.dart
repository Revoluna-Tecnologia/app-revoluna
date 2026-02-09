import '/components/header/header_widget.dart';
import '/components/loading/card_vagas_loading/card_vagas_loading_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'historico_loading_widget.dart' show HistoricoLoadingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoricoLoadingModel extends FlutterFlowModel<HistoricoLoadingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // Model for cardVagasLoading component.
  late CardVagasLoadingModel cardVagasLoadingModel1;
  // Model for cardVagasLoading component.
  late CardVagasLoadingModel cardVagasLoadingModel2;
  // Model for cardVagasLoading component.
  late CardVagasLoadingModel cardVagasLoadingModel3;
  // Model for cardVagasLoading component.
  late CardVagasLoadingModel cardVagasLoadingModel4;
  // Model for cardVagasLoading component.
  late CardVagasLoadingModel cardVagasLoadingModel5;
  // Model for cardVagasLoading component.
  late CardVagasLoadingModel cardVagasLoadingModel6;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    cardVagasLoadingModel1 =
        createModel(context, () => CardVagasLoadingModel());
    cardVagasLoadingModel2 =
        createModel(context, () => CardVagasLoadingModel());
    cardVagasLoadingModel3 =
        createModel(context, () => CardVagasLoadingModel());
    cardVagasLoadingModel4 =
        createModel(context, () => CardVagasLoadingModel());
    cardVagasLoadingModel5 =
        createModel(context, () => CardVagasLoadingModel());
    cardVagasLoadingModel6 =
        createModel(context, () => CardVagasLoadingModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    cardVagasLoadingModel1.dispose();
    cardVagasLoadingModel2.dispose();
    cardVagasLoadingModel3.dispose();
    cardVagasLoadingModel4.dispose();
    cardVagasLoadingModel5.dispose();
    cardVagasLoadingModel6.dispose();
  }
}
