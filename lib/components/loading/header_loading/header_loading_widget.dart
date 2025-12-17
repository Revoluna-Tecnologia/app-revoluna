import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_loading_model.dart';
export 'header_loading_model.dart';

class HeaderLoadingWidget extends StatefulWidget {
  const HeaderLoadingWidget({super.key});

  @override
  State<HeaderLoadingWidget> createState() => _HeaderLoadingWidgetState();
}

class _HeaderLoadingWidgetState extends State<HeaderLoadingWidget> {
  late HeaderLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.09,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              if (FFAppState().profilepicture != null &&
                  FFAppState().profilepicture != '') {
                return Hero(
                  tag: FFAppState().profilepicture,
                  transitionOnUserGestures: true,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.14,
                    height: MediaQuery.sizeOf(context).width * 0.14,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      FFAppState().profilepicture,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              } else {
                return Container(
                  width: MediaQuery.sizeOf(context).width * 0.14,
                  height: MediaQuery.sizeOf(context).width * 0.14,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/Avatar.png',
                    fit: BoxFit.cover,
                  ),
                );
              }
            },
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) {
                    if (FFAppState().gender == 'Prefiro não informar') {
                      return Text(
                        FFAppState().displayName,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.geologica(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                      );
                    } else {
                      return Text(
                        '${FFAppState().gender} ${FFAppState().displayName}',
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
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
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.12,
            height: MediaQuery.sizeOf(context).height * 0.06,
            child: Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                Icon(
                  Icons.menu_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 37.0,
                ),
                if (false)
                  Align(
                    alignment: AlignmentDirectional(0.9, -1.9),
                    child: Text(
                      '•',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.geologica(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).tertiary,
                            fontSize: 27.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                    ),
                  ),
              ],
            ),
          ),
        ].divide(SizedBox(width: FFAppConstants.Gap)),
      ),
    );
  }
}
