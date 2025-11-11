import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_escala_model.dart';
export 'card_escala_model.dart';

class CardEscalaWidget extends StatefulWidget {
  const CardEscalaWidget({
    super.key,
    this.shift,
    this.type,
    this.start,
    this.end,
    this.drName,
    this.avatarMedico,
    this.sector,
    bool? openJob,
    this.isDisabled,
    bool? showpay,
    this.colorpay,
    this.checkcolor,
  })  : this.openJob = openJob ?? false,
        this.showpay = showpay ?? false;

  final String? shift;
  final String? type;
  final String? start;
  final String? end;
  final String? drName;
  final String? avatarMedico;
  final String? sector;
  final bool openJob;
  final bool? isDisabled;
  final bool showpay;
  final Color? colorpay;
  final Color? checkcolor;

  @override
  State<CardEscalaWidget> createState() => _CardEscalaWidgetState();
}

class _CardEscalaWidgetState extends State<CardEscalaWidget> {
  late CardEscalaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardEscalaModel());
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(valueOrDefault<double>(
                FFAppConstants.borderM,
                0.0,
              )),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                valueOrDefault<String>(
                  widget!.avatarMedico,
                  'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/profilepictures//Avatar.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                valueOrDefault<String>(
                  widget!.start,
                  '[start]',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.geologica(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: widget!.isDisabled!
                          ? FlutterFlowTheme.of(context).accent3
                          : FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              AutoSizeText(
                valueOrDefault<String>(
                  widget!.end,
                  '[end]',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.geologica(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: widget!.isDisabled!
                          ? FlutterFlowTheme.of(context).accent3
                          : FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ].divide(SizedBox(height: FFAppConstants.halfGap)),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  valueOrDefault<String>(
                    widget!.drName,
                    '[drName]',
                  ),
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.geologica(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        color: widget!.isDisabled!
                            ? FlutterFlowTheme.of(context).accent3
                            : FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                ),
              ]
                  .divide(SizedBox(height: FFAppConstants.halfGap))
                  .addToStart(SizedBox(height: FFAppConstants.Gap))
                  .addToEnd(SizedBox(height: FFAppConstants.Gap)),
            ),
          ),
          if (widget!.openJob)
            Icon(
              FFIcons.kpassarPlantao,
              color: widget!.isDisabled!
                  ? FlutterFlowTheme.of(context).accent3
                  : FlutterFlowTheme.of(context).primary,
              size: 18.0,
            ),
          if (widget!.showpay)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0,
                  valueOrDefault<double>(
                    FFAppConstants.halfGap,
                    0.0,
                  ),
                  0.0,
                  valueOrDefault<double>(
                    FFAppConstants.Gap,
                    0.0,
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    FFIcons.kcheck,
                    color: valueOrDefault<Color>(
                      widget!.checkcolor,
                      FlutterFlowTheme.of(context).accent2,
                    ),
                    size: 16.0,
                  ),
                  Icon(
                    FFIcons.kdollarSign,
                    color: valueOrDefault<Color>(
                      widget!.colorpay,
                      FlutterFlowTheme.of(context).accent2,
                    ),
                    size: 16.0,
                  ),
                ],
              ),
            ),
        ]
            .divide(SizedBox(width: FFAppConstants.doubleGap))
            .around(SizedBox(width: FFAppConstants.doubleGap)),
      ),
    );
  }
}
