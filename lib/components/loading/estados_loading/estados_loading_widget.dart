import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'estados_loading_model.dart';
export 'estados_loading_model.dart';

class EstadosLoadingWidget extends StatefulWidget {
  const EstadosLoadingWidget({super.key});

  @override
  State<EstadosLoadingWidget> createState() => _EstadosLoadingWidgetState();
}

class _EstadosLoadingWidgetState extends State<EstadosLoadingWidget> {
  late EstadosLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstadosLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowDropDown<String>(
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(null),
      options: ['Option 1', 'Option 2', 'Option 3'],
      onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
      width: MediaQuery.sizeOf(context).width * 0.45,
      height: MediaQuery.sizeOf(context).height * 0.02,
      maxHeight: MediaQuery.sizeOf(context).height * 0.4,
      textStyle: FlutterFlowTheme.of(context).bodySmall.override(
            font: GoogleFonts.geologica(
              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
          ),
      hintText: 'Carregando...',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 18.0,
      ),
      fillColor: FlutterFlowTheme.of(context).primaryBackground,
      elevation: 2.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 0.0,
      margin: EdgeInsetsDirectional.fromSTEB(
          valueOrDefault<double>(
            FFAppConstants.Gap,
            0.0,
          ),
          0.0,
          valueOrDefault<double>(
            FFAppConstants.Gap,
            0.0,
          ),
          0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
