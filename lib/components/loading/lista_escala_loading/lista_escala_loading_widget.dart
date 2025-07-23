import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lista_escala_loading_model.dart';
export 'lista_escala_loading_model.dart';

class ListaEscalaLoadingWidget extends StatefulWidget {
  const ListaEscalaLoadingWidget({super.key});

  @override
  State<ListaEscalaLoadingWidget> createState() =>
      _ListaEscalaLoadingWidgetState();
}

class _ListaEscalaLoadingWidgetState extends State<ListaEscalaLoadingWidget> {
  late ListaEscalaLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaEscalaLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.088,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(valueOrDefault<double>(
          FFAppConstants.borderM,
          0.0,
        )),
      ),
    );
  }
}
