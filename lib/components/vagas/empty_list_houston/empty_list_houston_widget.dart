import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_list_houston_model.dart';
export 'empty_list_houston_model.dart';

class EmptyListHoustonWidget extends StatefulWidget {
  const EmptyListHoustonWidget({
    super.key,
    this.text,
  });

  final String? text;

  @override
  State<EmptyListHoustonWidget> createState() => _EmptyListHoustonWidgetState();
}

class _EmptyListHoustonWidgetState extends State<EmptyListHoustonWidget> {
  late EmptyListHoustonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListHoustonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Por que não vejo nada aqui?',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.geologica(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        FFAppConstants.Gap,
                        0.0,
                      ),
                      0.0,
                      50.0,
                      0.0),
                  child: Text(
                    'Esta seção mostra recursos exclusivos de plantões gerenciados pelo Houston: repasse de vaga, visão completa da escala e aprovação centralizada de candidaturas.\n\nSe o escalista não usa o Houston, essas informações não ficam disponíveis.',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.geologica(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          lineHeight: 1.3,
                        ),
                  ),
                ),
              ].divide(SizedBox(height: FFAppConstants.Gap)),
            ),
            ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    FFAppConstants.borderM,
                    0.0,
                  )),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 500),
                    fadeOutDuration: Duration(milliseconds: 500),
                    imageUrl:
                        'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/bannersmarketing/banner_escala.gif',
                    width: double.infinity,
                    height: 110.6,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ]
              .divide(SizedBox(height: FFAppConstants.doubleGap))
              .around(SizedBox(height: FFAppConstants.doubleGap)),
        ),
      ),
    );
  }
}
