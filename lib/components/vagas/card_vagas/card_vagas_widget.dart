import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_vagas_model.dart';
export 'card_vagas_model.dart';

class CardVagasWidget extends StatefulWidget {
  const CardVagasWidget({
    super.key,
    this.specialty,
    this.value,
    this.date,
    this.datecount,
    this.shift,
    this.type,
    this.hospital,
    this.vaga,
    Color? colorPay,
    this.avatarHospital,
    bool? showPay,
  })  : this.colorPay = colorPay ?? const Color(0xFFE5E5E5),
        this.showPay = showPay ?? false;

  final String? specialty;
  final String? value;
  final String? date;
  final String? datecount;
  final String? shift;
  final String? type;
  final String? hospital;
  final String? vaga;
  final Color colorPay;
  final String? avatarHospital;
  final bool showPay;

  @override
  State<CardVagasWidget> createState() => _CardVagasWidgetState();
}

class _CardVagasWidgetState extends State<CardVagasWidget> {
  late CardVagasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardVagasModel());
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
      height: 110.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(valueOrDefault<double>(
          FFAppConstants.borderM,
          0.0,
        )),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            valueOrDefault<double>(
              FFAppConstants.Gap,
              0.0,
            ),
            0.0,
            valueOrDefault<double>(
              FFAppConstants.halfGap,
              0.0,
            ),
            0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget!.avatarHospital != ''
                          ? Color(0x00000000)
                          : functions.getColorFromString(widget!.hospital!),
                      FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: BorderRadius.circular(valueOrDefault<double>(
                      FFAppConstants.borderM,
                      0.0,
                    )),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).accent2,
                      width: 1.0,
                    ),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Visibility(
                    visible: widget!.avatarHospital != '',
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(valueOrDefault<double>(
                        FFAppConstants.borderM,
                        0.0,
                      )),
                      child: Image.network(
                        valueOrDefault<String>(
                          widget!.avatarHospital,
                          'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/avatarhospitais//placeholder..png',
                        ),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget!.specialty,
                              '[Especialidade]',
                            ).maybeHandleOverflow(
                              maxChars: 26,
                              replacement: '…',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.geologica(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.value,
                              '[R\$ 0.000,00]',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.geologica(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget!.shift == 'Diurno') {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 1.0, 1.0, 1.0),
                                        child: Icon(
                                          FFIcons.ksun,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 14.0,
                                        ),
                                      ),
                                    );
                                  } else if (widget!.shift == 'Noturno') {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 1.0, 1.0, 1.0),
                                        child: Icon(
                                          FFIcons.kmoon,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 14.0,
                                        ),
                                      ),
                                    );
                                  } else if (widget!.shift ==
                                      'Meio período (manhã)') {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 1.0, 1.0, 1.0),
                                        child: Icon(
                                          FFIcons.ksunrise,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 14.0,
                                        ),
                                      ),
                                    );
                                  } else if (widget!.shift ==
                                      'Meio período (tarde)') {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 1.0, 1.0, 1.0),
                                        child: Icon(
                                          FFIcons.ksunset,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 14.0,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 1.0, 1.0, 1.0),
                                        child: Icon(
                                          FFIcons.kcinderela,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 14.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                '•',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.geologica(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (widget!.type == 'Cobertura') {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 1.0, 1.0, 1.0),
                                        child: Icon(
                                          FFIcons.krefreshCw,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 14.0,
                                        ),
                                      ),
                                    );
                                  } else if (widget!.type == 'Fixo') {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 1.0, 1.0, 1.0),
                                        child: Icon(
                                          FFIcons.kbriefcase,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 12.0,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 1.0, 1.0, 1.0),
                                        child: Icon(
                                          Icons.local_hospital_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 17.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                '•',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.geologica(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                              ),
                              AutoSizeText(
                                valueOrDefault<String>(
                                  widget!.date,
                                  '[dd/mm]',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.geologica(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                '•',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.geologica(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget!.datecount,
                                  '[count]',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.geologica(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: FFAppConstants.halfGap)),
                          ),
                        ].divide(SizedBox(height: FFAppConstants.halfGap)),
                      ),
                      if (widget!.showPay)
                        Container(
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: true,
                            child: Icon(
                              FFIcons.kdollarSign,
                              color: valueOrDefault<Color>(
                                widget!.colorPay,
                                FlutterFlowTheme.of(context).accent2,
                              ),
                              size: 24.0,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ]
                  .divide(SizedBox(width: FFAppConstants.doubleGap))
                  .addToStart(SizedBox(width: FFAppConstants.Gap))
                  .addToEnd(SizedBox(width: FFAppConstants.Gap)),
            ),
          ],
        ),
      ),
    );
  }
}
