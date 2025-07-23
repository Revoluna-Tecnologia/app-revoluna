import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'passar_plantao_dialog_box_model.dart';
export 'passar_plantao_dialog_box_model.dart';

class PassarPlantaoDialogBoxWidget extends StatefulWidget {
  const PassarPlantaoDialogBoxWidget({super.key});

  @override
  State<PassarPlantaoDialogBoxWidget> createState() =>
      _PassarPlantaoDialogBoxWidgetState();
}

class _PassarPlantaoDialogBoxWidgetState
    extends State<PassarPlantaoDialogBoxWidget> {
  late PassarPlantaoDialogBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PassarPlantaoDialogBoxModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.86,
        height: MediaQuery.sizeOf(context).height * 0.45,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(valueOrDefault<double>(
            FFAppConstants.borderM,
            0.0,
          )),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              0.0,
              valueOrDefault<double>(
                FFAppConstants.Gap,
                0.0,
              ),
              0.0,
              valueOrDefault<double>(
                FFAppConstants.doubleGap,
                0.0,
              )),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0.9, -0.9),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'PASSAR_PLANTAO_DIALOG_BOX_Icon_sxc05y92_');
                    logFirebaseEvent('Icon_dismiss_dialog');
                    Navigator.pop(context, false);
                  },
                  child: Icon(
                    FFIcons.kx,
                    color: FlutterFlowTheme.of(context).tertiary,
                    size: 20.0,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.6),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        FFAppConstants.Gap,
                        0.0,
                      ),
                      0.0,
                      0.0),
                  child: Text(
                    'Atenção!',
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          font: GoogleFonts.geologica(
                            fontWeight: FlutterFlowTheme.of(context)
                                .displayMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .displayMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .displayMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .displayMedium
                              .fontStyle,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.2),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        valueOrDefault<double>(
                          FFAppConstants.doubleGap,
                          0.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          FFAppConstants.doubleGap,
                          0.0,
                        ),
                        0.0),
                    child: Text(
                      'Seu plantão agora está disponível para troca. Outros médicos da sua escala poderão se candidatar. \n\nMas, atenção: a responsabilidade pelo plantão continua sendo sua até que a troca seja oficialmente confirmada.\n\nSe deseja desistir deste plantão, entre em contato com o seu gestor.',
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
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      FFAppConstants.doubleGap,
                      0.0,
                    ),
                    0.0,
                    0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'PASSAR_PLANTAO_DIALOG_BOX_ESTOU_DE_ACORD');
                    logFirebaseEvent('Button_dismiss_dialog');
                    Navigator.pop(context, true);
                  },
                  text: 'Estou de acordo',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.geologica(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(valueOrDefault<double>(
                      FFAppConstants.borderM,
                      0.0,
                    )),
                  ),
                ),
              ),
            ]
                .divide(SizedBox(height: FFAppConstants.Gap))
                .addToEnd(SizedBox(height: FFAppConstants.doubleGap)),
          ),
        ),
      ),
    );
  }
}
