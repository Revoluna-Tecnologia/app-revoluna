import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/back_top_bar/back_top_bar_widget.dart';
import '/components/dialogs/positive_dialog_box/positive_dialog_box_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'perfil_model.dart';
export 'perfil_model.dart';

class PerfilWidget extends StatefulWidget {
  const PerfilWidget({
    super.key,
    this.inputemail,
    this.inputphone,
  });

  final String? inputemail;
  final String? inputphone;

  static String routeName = 'Perfil';
  static String routePath = '/perfil';

  @override
  State<PerfilWidget> createState() => _PerfilWidgetState();
}

class _PerfilWidgetState extends State<PerfilWidget> {
  late PerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Perfil'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PERFIL_PAGE_Perfil_ON_INIT_STATE');
      logFirebaseEvent('Perfil_backend_call');
      _model.queryMedicos = await MedicosTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          currentUserUid,
        ),
      );
      logFirebaseEvent('Perfil_update_page_state');
      _model.formatedDate = _model.queryMedicos?.firstOrNull?.dataNascimento;
      safeSetState(() {});
    });

    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameFocusNode ??= FocusNode();

    _model.eMailFocusNode ??= FocusNode();

    _model.campoTelefoneFocusNode ??= FocusNode();
    _model.campoTelefoneFocusNode!.addListener(() => safeSetState(() {}));

    _model.birthDateFocusNode ??= FocusNode();
    _model.birthDateFocusNode!.addListener(() => safeSetState(() {}));
    _model.birthDateMask = MaskTextInputFormatter(mask: '##/##/####');

    _model.cpfFocusNode ??= FocusNode();
    _model.cpfFocusNode!.addListener(() => safeSetState(() {}));
    _model.cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');

    _model.crmFocusNode ??= FocusNode();
    _model.crmFocusNode!.addListener(() => safeSetState(() {}));

    _model.rqeFocusNode ??= FocusNode();
    _model.rqeFocusNode!.addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<MedicosRow>>(
      future: MedicosTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<MedicosRow> perfilMedicosRowList = snapshot.data!;

        final perfilMedicosRow =
            perfilMedicosRowList.isNotEmpty ? perfilMedicosRowList.first : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: FutureBuilder<List<UserProfileRow>>(
                future: UserProfileTable().querySingleRow(
                  queryFn: (q) => q.eqOrNull(
                    'id',
                    currentUserUid,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<UserProfileRow> containerUserProfileRowList =
                      snapshot.data!;

                  final containerUserProfileRow =
                      containerUserProfileRowList.isNotEmpty
                          ? containerUserProfileRowList.first
                          : null;

                  return Container(
                    decoration: BoxDecoration(),
                    child: FutureBuilder<List<EspecialidadesRow>>(
                      future: EspecialidadesTable().queryRows(
                        queryFn: (q) => q,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<EspecialidadesRow> formEspecialidadesRowList =
                            snapshot.data!;

                        return Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: FutureBuilder<List<EstadosBrasilRow>>(
                            future: EstadosBrasilTable().queryRows(
                              queryFn: (q) => q,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<EstadosBrasilRow>
                                  containerEstadosBrasilRowList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            FFAppConstants.doubleGap,
                                            0.0,
                                          ),
                                          0.0,
                                          0.0),
                                      child: wrapWithModel(
                                        model: _model.backTopBarModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: BackTopBarWidget(
                                          backButton: () async {
                                            logFirebaseEvent(
                                                'PERFIL_PAGE_Container_ogjqkhak_CALLBACK');
                                            logFirebaseEvent(
                                                'BackTopBar_navigate_back');
                                            context.safePop();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              FFAppConstants.doubleGap,
                                              0.0,
                                            ),
                                            valueOrDefault<double>(
                                              FFAppConstants.doubleGap,
                                              0.0,
                                            ),
                                            valueOrDefault<double>(
                                              FFAppConstants.doubleGap,
                                              0.0,
                                            ),
                                            0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Meu perfil',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displayLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .geologica(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displayLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displayLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Text(
                                                    '* Campos obrigatórios',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .geologica(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          if (_model
                                                              .isDataUploading_uploadedPic) {
                                                            return Lottie.asset(
                                                              'assets/jsons/81EfiEihcA.json',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.34,
                                                              height: 120.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                              animate: true,
                                                            );
                                                          } else if (_model
                                                                      .uploadedLocalFile_uploadedPic !=
                                                                  null &&
                                                              (_model
                                                                      .uploadedLocalFile_uploadedPic
                                                                      .bytes
                                                                      ?.isNotEmpty ??
                                                                  false)) {
                                                            return Hero(
                                                              tag:
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFAppState()
                                                                    .profilepicture,
                                                                'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/profilepictures//Avatar.png',
                                                              ),
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: Container(
                                                                width: 120.0,
                                                                height: 120.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model.uploadedLocalFile_uploadedPic
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.png',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return Hero(
                                                              tag:
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFAppState()
                                                                    .profilepicture,
                                                                'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/profilepictures//Avatar.png',
                                                              ),
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: Container(
                                                                width: 120.0,
                                                                height: 120.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    FFAppState()
                                                                        .profilepicture,
                                                                    'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/profilepictures//Avatar.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.png',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.07,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.07,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          FFIcons.kedit2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 15.0,
                                                        ),
                                                      ),
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'PERFIL_PAGE__BTN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Button_store_media_for_upload');
                                                          final selectedMedia =
                                                              await selectMediaWithSourceBottomSheet(
                                                            context: context,
                                                            maxWidth: 360.00,
                                                            imageQuality: 80,
                                                            allowPhoto: true,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            textColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            pickerFontFamily:
                                                                'Geologica',
                                                          );
                                                          if (selectedMedia !=
                                                                  null &&
                                                              selectedMedia.every((m) =>
                                                                  validateFileFormat(
                                                                      m.storagePath,
                                                                      context))) {
                                                            safeSetState(() =>
                                                                _model.isDataUploading_uploadedPic =
                                                                    true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            try {
                                                              selectedUploadedFiles =
                                                                  selectedMedia
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                            blurHash:
                                                                                m.blurHash,
                                                                            originalFilename:
                                                                                m.originalFilename,
                                                                          ))
                                                                      .toList();
                                                            } finally {
                                                              _model.isDataUploading_uploadedPic =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedMedia
                                                                    .length) {
                                                              safeSetState(() {
                                                                _model.uploadedLocalFile_uploadedPic =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                              });
                                                            } else {
                                                              safeSetState(
                                                                  () {});
                                                              return;
                                                            }
                                                          }

                                                          if (_model.uploadedLocalFile_uploadedPic !=
                                                                  null &&
                                                              (_model
                                                                      .uploadedLocalFile_uploadedPic
                                                                      .bytes
                                                                      ?.isNotEmpty ??
                                                                  false)) {
                                                            logFirebaseEvent(
                                                                'Button_update_page_state');
                                                            _model.hasChanged =
                                                                true;
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        text: '',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 120.0,
                                                          height: 120.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0x00A369ED),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .geologica(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      120.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(SizedBox(
                                                    height:
                                                        FFAppConstants.Gap)),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        valueOrDefault<double>(
                                                          FFAppConstants.Gap,
                                                          0.0,
                                                        ),
                                                        valueOrDefault<double>(
                                                          FFAppConstants.Gap,
                                                          0.0,
                                                        ),
                                                        valueOrDefault<double>(
                                                          FFAppConstants.Gap,
                                                          0.0,
                                                        ),
                                                        0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Dados de Contato:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .geologica(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'Nome:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: ' *',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            FlutterFlowRadioButton(
                                                              options: [
                                                                'Dr.',
                                                                'Dra.',
                                                                'Prefiro não informar'
                                                              ].toList(),
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'PERFIL_RadioButton_l7vki09n_ON_FORM_WIDG');
                                                                logFirebaseEvent(
                                                                    'RadioButton_update_page_state');
                                                                _model.hasChanged =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              controller: _model
                                                                      .radioButtonValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      containerUserProfileRow!
                                                                          .gender!),
                                                              optionHeight:
                                                                  20.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              selectedTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                              buttonPosition:
                                                                  RadioButtonPosition
                                                                      .left,
                                                              direction: Axis
                                                                  .horizontal,
                                                              radioButtonColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              inactiveRadioButtonColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                              toggleable: false,
                                                              horizontalAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                        .firstNameTextController ??=
                                                                    TextEditingController(
                                                                  text: perfilMedicosRow
                                                                      ?.primeiroNome,
                                                                ),
                                                                focusNode: _model
                                                                    .firstNameFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.firstNameTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          0),
                                                                  () async {
                                                                    logFirebaseEvent(
                                                                        'PERFIL_FirstName_ON_TEXTFIELD_CHANGE');
                                                                    if (_model
                                                                            .firstNameTextController
                                                                            .text !=
                                                                        '') {
                                                                      logFirebaseEvent(
                                                                          'FirstName_update_page_state');
                                                                      _model
                                                                          .firstnameborder = FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'FirstName_update_page_state');
                                                                      _model
                                                                          .firstnameborder = FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                      safeSetState(
                                                                          () {});
                                                                    }

                                                                    logFirebaseEvent(
                                                                        'FirstName_update_page_state');
                                                                    _model.hasChanged =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                                autofocus:
                                                                    false,
                                                                textCapitalization:
                                                                    TextCapitalization
                                                                        .words,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  alignLabelWithHint:
                                                                      false,
                                                                  hintText:
                                                                      'Primeiro nome',
                                                                  errorStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model
                                                                            .firstnameborder,
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                      ),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  suffixIcon: _model
                                                                          .firstNameTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.firstNameTextController?.clear();
                                                                            logFirebaseEvent('PERFIL_FirstName_ON_TEXTFIELD_CHANGE');
                                                                            if (_model.firstNameTextController.text !=
                                                                                '') {
                                                                              logFirebaseEvent('FirstName_update_page_state');
                                                                              _model.firstnameborder = FlutterFlowTheme.of(context).primaryText;
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              logFirebaseEvent('FirstName_update_page_state');
                                                                              _model.firstnameborder = FlutterFlowTheme.of(context).accent2;
                                                                              safeSetState(() {});
                                                                            }

                                                                            logFirebaseEvent('FirstName_update_page_state');
                                                                            _model.hasChanged =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent3,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                validator: _model
                                                                    .firstNameTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                                inputFormatters: [
                                                                  if (!isAndroid &&
                                                                      !isiOS)
                                                                    TextInputFormatter.withFunction(
                                                                        (oldValue,
                                                                            newValue) {
                                                                      return TextEditingValue(
                                                                        selection:
                                                                            newValue.selection,
                                                                        text: newValue
                                                                            .text
                                                                            .toCapitalization(TextCapitalization.words),
                                                                      );
                                                                    }),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                        .lastNameTextController ??=
                                                                    TextEditingController(
                                                                  text: perfilMedicosRow
                                                                      ?.sobrenome,
                                                                ),
                                                                focusNode: _model
                                                                    .lastNameFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.lastNameTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          0),
                                                                  () async {
                                                                    logFirebaseEvent(
                                                                        'PERFIL_PAGE_LastName_ON_TEXTFIELD_CHANGE');
                                                                    if (_model
                                                                            .lastNameTextController
                                                                            .text !=
                                                                        '') {
                                                                      logFirebaseEvent(
                                                                          'LastName_update_page_state');
                                                                      _model
                                                                          .lastnameborder = FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'LastName_update_page_state');
                                                                      _model
                                                                          .lastnameborder = FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                      safeSetState(
                                                                          () {});
                                                                    }

                                                                    logFirebaseEvent(
                                                                        'LastName_update_page_state');
                                                                    _model.hasChanged =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                                autofocus:
                                                                    false,
                                                                textCapitalization:
                                                                    TextCapitalization
                                                                        .words,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  alignLabelWithHint:
                                                                      false,
                                                                  hintText:
                                                                      'Último sobrenome',
                                                                  errorStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model
                                                                            .lastnameborder,
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                      ),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  suffixIcon: _model
                                                                          .lastNameTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.lastNameTextController?.clear();
                                                                            logFirebaseEvent('PERFIL_PAGE_LastName_ON_TEXTFIELD_CHANGE');
                                                                            if (_model.lastNameTextController.text !=
                                                                                '') {
                                                                              logFirebaseEvent('LastName_update_page_state');
                                                                              _model.lastnameborder = FlutterFlowTheme.of(context).primaryText;
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              logFirebaseEvent('LastName_update_page_state');
                                                                              _model.lastnameborder = FlutterFlowTheme.of(context).accent2;
                                                                              safeSetState(() {});
                                                                            }

                                                                            logFirebaseEvent('LastName_update_page_state');
                                                                            _model.hasChanged =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent3,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                validator: _model
                                                                    .lastNameTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                                inputFormatters: [
                                                                  if (!isAndroid &&
                                                                      !isiOS)
                                                                    TextInputFormatter.withFunction(
                                                                        (oldValue,
                                                                            newValue) {
                                                                      return TextEditingValue(
                                                                        selection:
                                                                            newValue.selection,
                                                                        text: newValue
                                                                            .text
                                                                            .toCapitalization(TextCapitalization.words),
                                                                      );
                                                                    }),
                                                                ],
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height:
                                                                  FFAppConstants
                                                                      .halfGap)),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: FFAppConstants
                                                              .Gap)),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'E-mail:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: ' *',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                    .eMailTextController ??=
                                                                TextEditingController(
                                                              text:
                                                                  perfilMedicosRow
                                                                      ?.email,
                                                            ),
                                                            focusNode: _model
                                                                .eMailFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.eMailTextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      100),
                                                              () =>
                                                                  safeSetState(
                                                                      () {}),
                                                            ),
                                                            autofocus: false,
                                                            autofillHints: [
                                                              AutofillHints
                                                                  .email
                                                            ],
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            readOnly: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              alignLabelWithHint:
                                                                  false,
                                                              hintText:
                                                                  'e-mail@dominio.com',
                                                              errorStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                        lineHeight:
                                                                            1.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    _model
                                                                        .emailborder,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                  ),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: _model
                                                                      .emailborder!,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              prefixIcon: Icon(
                                                                FFIcons.kmail,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                size: 14.0,
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                            maxLines: null,
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .eMailTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: FFAppConstants
                                                              .Gap)),
                                                    ),
                                                    FutureBuilder<
                                                        List<CodigosAreaRow>>(
                                                      future: CodigosAreaTable()
                                                              .queryRows(
                                                        queryFn: (q) => q,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<CodigosAreaRow>
                                                            containerCodigosAreaRowList =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          'Telefone móvel:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.geologica(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: '*',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                              ),
                                                              FlutterFlowDropDown<
                                                                  int>(
                                                                controller: _model
                                                                        .dropCodigoPaisValueController ??=
                                                                    FormFieldController<
                                                                        int>(
                                                                  _model.dropCodigoPaisValue ??=
                                                                      containerUserProfileRow
                                                                          ?.areacodeIndex,
                                                                ),
                                                                options: List<
                                                                        int>.from(
                                                                    containerCodigosAreaRowList
                                                                        .map((e) =>
                                                                            e.index)
                                                                        .toList()),
                                                                optionLabels: containerCodigosAreaRowList
                                                                    .map((e) =>
                                                                        e.lista)
                                                                    .withoutNulls
                                                                    .toList(),
                                                                onChanged:
                                                                    (val) async {
                                                                  safeSetState(() =>
                                                                      _model.dropCodigoPaisValue =
                                                                          val);
                                                                  logFirebaseEvent(
                                                                      'PERFIL_dropCodigoPais_ON_FORM_WIDGET_SEL');
                                                                  logFirebaseEvent(
                                                                      'dropCodigoPais_set_form_field');
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .campoTelefoneTextController
                                                                        ?.text = '';
                                                                  });
                                                                },
                                                                width: double
                                                                    .infinity,
                                                                maxHeight: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.25,
                                                                searchHintTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                  shadows: [
                                                                    Shadow(
                                                                      color: Color(
                                                                          0x26A369ED),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          0.0),
                                                                      blurRadius:
                                                                          5.0,
                                                                    )
                                                                  ],
                                                                ),
                                                                searchTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.geologica(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                  shadows: [
                                                                    Shadow(
                                                                      color: Color(
                                                                          0x26A369ED),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          0.0),
                                                                      blurRadius:
                                                                          5.0,
                                                                    )
                                                                  ],
                                                                ),
                                                                searchHintText:
                                                                    'Pesquisar...',
                                                                searchCursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                icon: Icon(
                                                                  FFIcons
                                                                      .kchevronDown,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                borderWidth:
                                                                    1.0,
                                                                borderRadius:
                                                                    FFAppConstants
                                                                        .borderS,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        valueOrDefault<
                                                                            double>(
                                                                          FFAppConstants
                                                                              .Gap,
                                                                          0.0,
                                                                        ),
                                                                        0.0,
                                                                        valueOrDefault<
                                                                            double>(
                                                                          FFAppConstants
                                                                              .Gap,
                                                                          0.0,
                                                                        ),
                                                                        0.0),
                                                                hidesUnderline:
                                                                    true,
                                                                disabled: true,
                                                                isOverButton:
                                                                    true,
                                                                isSearchable:
                                                                    true,
                                                                isMultiSelect:
                                                                    false,
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model.campoTelefoneTextController ??=
                                                                              TextEditingController(
                                                                        text: functions.aplicarmascara(
                                                                            perfilMedicosRow?.telefone,
                                                                            containerCodigosAreaRowList.elementAtOrNull(containerUserProfileRow!.areacodeIndex)!.formato!),
                                                                      ),
                                                                      focusNode:
                                                                          _model
                                                                              .campoTelefoneFocusNode,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.campoTelefoneTextController',
                                                                        Duration(
                                                                            milliseconds:
                                                                                100),
                                                                        () => safeSetState(
                                                                            () {}),
                                                                      ),
                                                                      autofocus:
                                                                          false,
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .next,
                                                                      readOnly:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        alignLabelWithHint:
                                                                            false,
                                                                        hintText: _model.dropCodigoPaisValue ==
                                                                                0
                                                                            ? 'Somente números com DDD'
                                                                            : 'Somente números',
                                                                        errorStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              font: GoogleFonts.geologica(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              lineHeight: 1.0,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              _model.phoneborder,
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                            ),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(valueOrDefault<double>(
                                                                            FFAppConstants.borderS,
                                                                            0.0,
                                                                          )),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                _model.phoneborder,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(valueOrDefault<double>(
                                                                            FFAppConstants.borderS,
                                                                            0.0,
                                                                          )),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(valueOrDefault<double>(
                                                                            FFAppConstants.borderS,
                                                                            0.0,
                                                                          )),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(valueOrDefault<double>(
                                                                            FFAppConstants.borderS,
                                                                            0.0,
                                                                          )),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        prefixIcon:
                                                                            Icon(
                                                                          FFIcons
                                                                              .ksmartphone,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.geologica(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent3,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      maxLines:
                                                                          null,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .phone,
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .campoTelefoneTextControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                  if (valueOrDefault<
                                                                      bool>(
                                                                    (_model.phoneborder ==
                                                                            FlutterFlowTheme.of(context)
                                                                                .error) &&
                                                                        (_model.campoTelefoneTextController.text !=
                                                                            ''),
                                                                    false,
                                                                  ))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          valueOrDefault<double>(
                                                                            FFAppConstants.doubleGap,
                                                                            0.0,
                                                                          ),
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Número de telefone inválido',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              font: GoogleFonts.geologica(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    height: FFAppConstants
                                                                        .halfGap)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height:
                                                                    FFAppConstants
                                                                        .Gap)),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .doubleGap,
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Dados pessoais:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Nascimento: ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: '*',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                        Stack(
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                        .birthDateTextController ??=
                                                                    TextEditingController(
                                                                  text:
                                                                      dateTimeFormat(
                                                                    "dd/MM/yyyy",
                                                                    perfilMedicosRow
                                                                        ?.dataNascimento,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                ),
                                                                focusNode: _model
                                                                    .birthDateFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.birthDateTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          0),
                                                                  () async {
                                                                    logFirebaseEvent(
                                                                        'PERFIL_BirthDate_ON_TEXTFIELD_CHANGE');
                                                                    if (_model.birthDateTextController.text !=
                                                                            null &&
                                                                        _model.birthDateTextController.text !=
                                                                            '') {
                                                                      logFirebaseEvent(
                                                                          'BirthDate_update_page_state');
                                                                      _model
                                                                          .birthborder = FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'BirthDate_update_page_state');
                                                                      _model
                                                                          .birthborder = FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                      safeSetState(
                                                                          () {});
                                                                    }

                                                                    logFirebaseEvent(
                                                                        'BirthDate_update_page_state');
                                                                    _model.hasChanged =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                                autofocus:
                                                                    false,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                readOnly: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  alignLabelWithHint:
                                                                      false,
                                                                  hintText:
                                                                      'Selecione uma data',
                                                                  errorStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  prefixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .calendar_month_rounded,
                                                                    color: Colors
                                                                        .transparent,
                                                                    size: 20.0,
                                                                  ),
                                                                  suffixIcon: _model
                                                                          .birthDateTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.birthDateTextController?.clear();
                                                                            logFirebaseEvent('PERFIL_BirthDate_ON_TEXTFIELD_CHANGE');
                                                                            if (_model.birthDateTextController.text != null &&
                                                                                _model.birthDateTextController.text != '') {
                                                                              logFirebaseEvent('BirthDate_update_page_state');
                                                                              _model.birthborder = FlutterFlowTheme.of(context).primaryText;
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              logFirebaseEvent('BirthDate_update_page_state');
                                                                              _model.birthborder = FlutterFlowTheme.of(context).accent2;
                                                                              safeSetState(() {});
                                                                            }

                                                                            logFirebaseEvent('BirthDate_update_page_state');
                                                                            _model.hasChanged =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent3,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .datetime,
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                validator: _model
                                                                    .birthDateTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                                inputFormatters: [
                                                                  _model
                                                                      .birthDateMask
                                                                ],
                                                              ),
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .calendar_month_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                size: 24.0,
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    'IconButton pressed ...');
                                                              },
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'PERFIL_PAGE_Container_zizlx9lr_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Container_date_time_picker');
                                                                await showModalBottomSheet<
                                                                        bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      final _datePickedCupertinoTheme =
                                                                          CupertinoTheme.of(
                                                                              context);
                                                                      return Container(
                                                                        height:
                                                                            MediaQuery.of(context).size.height /
                                                                                3,
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                        child:
                                                                            CupertinoTheme(
                                                                          data:
                                                                              _datePickedCupertinoTheme.copyWith(
                                                                            textTheme:
                                                                                _datePickedCupertinoTheme.textTheme.copyWith(
                                                                              dateTimePickerTextStyle: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                    font: GoogleFonts.geologica(
                                                                                      fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              CupertinoDatePicker(
                                                                            mode:
                                                                                CupertinoDatePickerMode.date,
                                                                            minimumDate:
                                                                                (DateTime.fromMicrosecondsSinceEpoch(-2208978000000000) ?? DateTime(1900)),
                                                                            initialDateTime:
                                                                                functions.eighteenYearsAgo(),
                                                                            maximumDate:
                                                                                (functions.eighteenYearsAgo() ?? DateTime(2050)),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            use24hFormat:
                                                                                false,
                                                                            onDateTimeChanged: (newDateTime) =>
                                                                                safeSetState(() {
                                                                              _model.datePicked = newDateTime;
                                                                            }),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    });
                                                                logFirebaseEvent(
                                                                    'Container_set_form_field');
                                                                safeSetState(
                                                                    () {
                                                                  _model.birthDateTextController
                                                                          ?.text =
                                                                      dateTimeFormat(
                                                                    "dd/MM/yyyy",
                                                                    _model
                                                                        .datePicked,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  );
                                                                  _model
                                                                      .birthDateMask
                                                                      .updateMask(
                                                                    newValue:
                                                                        TextEditingValue(
                                                                      text: _model
                                                                          .birthDateTextController!
                                                                          .text,
                                                                    ),
                                                                  );
                                                                });
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.birthborder =
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4;
                                                                _model.formatedDate =
                                                                    _model
                                                                        .datePicked;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.751,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.047,
                                                                decoration:
                                                                    BoxDecoration(),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: FFAppConstants
                                                              .Gap)),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'CPF: ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: '*',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                        .cpfTextController ??=
                                                                    TextEditingController(
                                                                  text:
                                                                      perfilMedicosRow
                                                                          ?.cpf,
                                                                ),
                                                                focusNode: _model
                                                                    .cpfFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.cpfTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          0),
                                                                  () async {
                                                                    logFirebaseEvent(
                                                                        'PERFIL_PAGE_CPF_ON_TEXTFIELD_CHANGE');
                                                                    if (_model.cpfTextController.text !=
                                                                            null &&
                                                                        _model.cpfTextController.text !=
                                                                            '') {
                                                                      logFirebaseEvent(
                                                                          'CPF_update_page_state');
                                                                      _model
                                                                          .cpfborder = FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'CPF_update_page_state');
                                                                      _model
                                                                          .cpfborder = FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                      safeSetState(
                                                                          () {});
                                                                    }

                                                                    logFirebaseEvent(
                                                                        'CPF_update_page_state');
                                                                    _model.hasChanged =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                                onFieldSubmitted:
                                                                    (_) async {
                                                                  logFirebaseEvent(
                                                                      'PERFIL_PAGE_CPF_ON_TEXTFIELD_SUBMIT');
                                                                  var _shouldSetState =
                                                                      false;
                                                                  logFirebaseEvent(
                                                                      'CPF_custom_action');
                                                                  _model.validCPF =
                                                                      await actions
                                                                          .isValidCPF(
                                                                    _model
                                                                        .cpfTextController
                                                                        .text,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  if (_model
                                                                      .validCPF!) {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  logFirebaseEvent(
                                                                      'CPF_update_page_state');
                                                                  _model.cpfborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error;
                                                                  safeSetState(
                                                                      () {});
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                autofocus:
                                                                    false,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  alignLabelWithHint:
                                                                      false,
                                                                  hintText:
                                                                      'Somente números',
                                                                  errorStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model
                                                                            .cpfborder,
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                      ),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants
                                                                          .borderS,
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  suffixIcon: _model
                                                                          .cpfTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.cpfTextController?.clear();
                                                                            logFirebaseEvent('PERFIL_PAGE_CPF_ON_TEXTFIELD_CHANGE');
                                                                            if (_model.cpfTextController.text != null &&
                                                                                _model.cpfTextController.text != '') {
                                                                              logFirebaseEvent('CPF_update_page_state');
                                                                              _model.cpfborder = FlutterFlowTheme.of(context).primaryText;
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              logFirebaseEvent('CPF_update_page_state');
                                                                              _model.cpfborder = FlutterFlowTheme.of(context).accent2;
                                                                              safeSetState(() {});
                                                                            }

                                                                            logFirebaseEvent('CPF_update_page_state');
                                                                            _model.hasChanged =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color: (_model.cpfFocusNode?.hasFocus ?? false)
                                                                                ? FlutterFlowTheme.of(context).accent3
                                                                                : FlutterFlowTheme.of(context).primaryBackground,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                validator: _model
                                                                    .cpfTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                                inputFormatters: [
                                                                  _model.cpfMask
                                                                ],
                                                              ),
                                                            ),
                                                            if (valueOrDefault<
                                                                bool>(
                                                              (_model.phoneborder ==
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error) &&
                                                                  (_model.campoTelefoneTextController
                                                                          .text !=
                                                                      ''),
                                                              false,
                                                            ))
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        valueOrDefault<
                                                                            double>(
                                                                          FFAppConstants
                                                                              .doubleGap,
                                                                          0.0,
                                                                        ),
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'CPF inserido é inválido',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                          ].divide(SizedBox(
                                                              height:
                                                                  FFAppConstants
                                                                      .halfGap)),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: FFAppConstants
                                                              .Gap)),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'CRM: ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: '*',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                        FlutterFlowDropDown<
                                                            int>(
                                                          controller: _model
                                                                  .dropdownEstadosValueController ??=
                                                              FormFieldController<
                                                                  int>(
                                                            _model.dropdownEstadosValue ??=
                                                                containerUserProfileRow
                                                                    ?.ufIndex,
                                                          ),
                                                          options: List<
                                                                  int>.from(
                                                              containerEstadosBrasilRowList
                                                                  .map((e) =>
                                                                      e.id)
                                                                  .toList()),
                                                          optionLabels:
                                                              containerEstadosBrasilRowList
                                                                  .map((e) =>
                                                                      e.lista)
                                                                  .withoutNulls
                                                                  .toList(),
                                                          onChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.dropdownEstadosValue =
                                                                    val);
                                                            logFirebaseEvent(
                                                                'PERFIL_dropdownEstados_ON_FORM_WIDGET_SE');
                                                            logFirebaseEvent(
                                                                'dropdownEstados_update_page_state');
                                                            _model.hasChanged =
                                                                true;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'dropdownEstados_update_page_state');
                                                            _model.ufborder =
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText;
                                                            safeSetState(() {});
                                                          },
                                                          width:
                                                              double.infinity,
                                                          maxHeight:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.3,
                                                          searchHintTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                            font: GoogleFonts
                                                                .geologica(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                            shadows: [
                                                              Shadow(
                                                                color: Color(
                                                                    0x26A369ED),
                                                                offset: Offset(
                                                                    0.0, 0.0),
                                                                blurRadius: 5.0,
                                                              )
                                                            ],
                                                          ),
                                                          searchTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .geologica(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                            font: GoogleFonts
                                                                .geologica(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                            shadows: [
                                                              Shadow(
                                                                color: Color(
                                                                    0x26A369ED),
                                                                offset: Offset(
                                                                    0.0, 0.0),
                                                                blurRadius: 5.0,
                                                              )
                                                            ],
                                                          ),
                                                          searchHintText:
                                                              'Pesquisar...',
                                                          searchCursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          icon: Icon(
                                                            FFIcons
                                                                .kchevronDown,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              valueOrDefault<
                                                                  Color>(
                                                            _model.ufborder,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                          ),
                                                          borderWidth: 1.0,
                                                          borderRadius:
                                                              FFAppConstants
                                                                  .borderS,
                                                          margin: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .Gap,
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .Gap,
                                                                    0.0,
                                                                  ),
                                                                  0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: true,
                                                          isSearchable: true,
                                                          isMultiSelect: false,
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                    .crmTextController ??=
                                                                TextEditingController(
                                                              text: '${(String crm) {
                                                                        return crm
                                                                            .split('-')[0];
                                                                      }(perfilMedicosRow!.crm!)}' ==
                                                                      'estudante'
                                                                  ? ''
                                                                  : perfilMedicosRow?.crm,
                                                            ),
                                                            focusNode: _model
                                                                .crmFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.crmTextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      0),
                                                              () async {
                                                                logFirebaseEvent(
                                                                    'PERFIL_PAGE_CRM_ON_TEXTFIELD_CHANGE');
                                                                if (_model.crmTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.crmTextController
                                                                            .text !=
                                                                        '') {
                                                                  logFirebaseEvent(
                                                                      'CRM_update_page_state');
                                                                  _model.crmborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'CRM_update_page_state');
                                                                  _model.crmborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                  safeSetState(
                                                                      () {});
                                                                }

                                                                logFirebaseEvent(
                                                                    'CRM_update_page_state');
                                                                _model.hasChanged =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              alignLabelWithHint:
                                                                  false,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    _model
                                                                        .crmborder,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                  ),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .crmTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '[0-9]'))
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: FFAppConstants
                                                              .Gap)),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Especialidade: ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: '*',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                        FlutterFlowDropDown<
                                                            int>(
                                                          controller: _model
                                                                  .dropdownEspecialidadesValueController ??=
                                                              FormFieldController<
                                                                  int>(
                                                            _model.dropdownEspecialidadesValue ??=
                                                                containerUserProfileRow
                                                                    ?.specialtyIndex,
                                                          ),
                                                          options: List<
                                                                  int>.from(
                                                              formEspecialidadesRowList
                                                                  .map((e) =>
                                                                      e.index)
                                                                  .withoutNulls
                                                                  .toList()),
                                                          optionLabels:
                                                              formEspecialidadesRowList
                                                                  .map((e) =>
                                                                      e.nome)
                                                                  .withoutNulls
                                                                  .toList(),
                                                          onChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.dropdownEspecialidadesValue =
                                                                    val);
                                                            logFirebaseEvent(
                                                                'PERFIL_dropdownEspecialidades_ON_FORM_WI');
                                                            logFirebaseEvent(
                                                                'dropdownEspecialidades_update_page_state');
                                                            _model.hasChanged =
                                                                true;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'dropdownEspecialidades_update_page_state');
                                                            _model.specialtyborder =
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText;
                                                            safeSetState(() {});
                                                          },
                                                          width:
                                                              double.infinity,
                                                          maxHeight:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.25,
                                                          searchHintTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                            font: GoogleFonts
                                                                .geologica(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                            shadows: [
                                                              Shadow(
                                                                color: Color(
                                                                    0x26A369ED),
                                                                offset: Offset(
                                                                    0.0, 0.0),
                                                                blurRadius: 5.0,
                                                              )
                                                            ],
                                                          ),
                                                          searchTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .geologica(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                            font: GoogleFonts
                                                                .geologica(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                            shadows: [
                                                              Shadow(
                                                                color: Color(
                                                                    0x26A369ED),
                                                                offset: Offset(
                                                                    0.0, 0.0),
                                                                blurRadius: 5.0,
                                                              )
                                                            ],
                                                          ),
                                                          hintText:
                                                              'Selecione sua especialidade',
                                                          searchHintText:
                                                              'Pesquisar...',
                                                          searchCursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          icon: Icon(
                                                            FFIcons
                                                                .kchevronDown,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              valueOrDefault<
                                                                  Color>(
                                                            _model
                                                                .specialtyborder,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                          ),
                                                          borderWidth: 1.0,
                                                          borderRadius:
                                                              FFAppConstants
                                                                  .borderS,
                                                          margin: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .Gap,
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .Gap,
                                                                    0.0,
                                                                  ),
                                                                  0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: true,
                                                          isSearchable: true,
                                                          isMultiSelect: false,
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: FFAppConstants
                                                              .Gap)),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'RQE: ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                    .rqeTextController ??=
                                                                TextEditingController(
                                                              text:
                                                                  perfilMedicosRow
                                                                      ?.rqe,
                                                            ),
                                                            focusNode: _model
                                                                .rqeFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.rqeTextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      0),
                                                              () async {
                                                                logFirebaseEvent(
                                                                    'PERFIL_PAGE_RQE_ON_TEXTFIELD_CHANGE');
                                                                if (_model.rqeTextController
                                                                            .text !=
                                                                        null &&
                                                                    _model.rqeTextController
                                                                            .text !=
                                                                        '') {
                                                                  logFirebaseEvent(
                                                                      'RQE_update_page_state');
                                                                  _model.rqeborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'RQE_update_page_state');
                                                                  _model.rqeborder =
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2;
                                                                  safeSetState(
                                                                      () {});
                                                                }

                                                                logFirebaseEvent(
                                                                    'RQE_update_page_state');
                                                                _model.hasChanged =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              alignLabelWithHint:
                                                                  false,
                                                              hintText:
                                                                  'Não informado',
                                                              errorStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    _model
                                                                        .rqeborder,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                  ),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                            maxLength: 7,
                                                            maxLengthEnforcement:
                                                                MaxLengthEnforcement
                                                                    .enforced,
                                                            buildCounter: (context,
                                                                    {required currentLength,
                                                                    required isFocused,
                                                                    maxLength}) =>
                                                                null,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .rqeTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '[0-9]'))
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: FFAppConstants
                                                              .Gap)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Theme(
                                                          data: ThemeData(
                                                            checkboxTheme:
                                                                CheckboxThemeData(
                                                              visualDensity:
                                                                  VisualDensity
                                                                      .compact,
                                                              materialTapTargetSize:
                                                                  MaterialTapTargetSize
                                                                      .shrinkWrap,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                  FFAppConstants
                                                                      .borderS,
                                                                  0.0,
                                                                )),
                                                              ),
                                                            ),
                                                            unselectedWidgetColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                          ),
                                                          child: Checkbox(
                                                            value: _model
                                                                    .checkboxValue ??=
                                                                false,
                                                            onChanged:
                                                                (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.checkboxValue =
                                                                      newValue!);
                                                            },
                                                            side: (FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2 !=
                                                                    null)
                                                                ? BorderSide(
                                                                    width: 2,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2!,
                                                                  )
                                                                : null,
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            checkColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      'Ao fornecer meus dados, estou ciente de que serão tratados de acordo com os ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      'termos de uso',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .geologica(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: '.',
                                                                  style:
                                                                      TextStyle(),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .geologica(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 2,
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: FFAppConstants
                                                              .halfGap)),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .doubleGap,
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Proteção de dados:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'PERFIL_PAGE_TERMOS_DE_USO_BTN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Button_navigate_to');

                                                            context.pushNamed(
                                                                TermosWidget
                                                                    .routeName);
                                                          },
                                                          text: 'Termos de uso',
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.05,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent3,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent3,
                                                              width:
                                                                  FFAppConstants
                                                                      .stroke,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              FFAppConstants
                                                                  .borderS,
                                                              0.0,
                                                            )),
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'PERFIL_PAGE_SAIR_BTN_ON_TAP');
                                                            Function()
                                                                _navigate =
                                                                () {};
                                                            logFirebaseEvent(
                                                                'Button_alert_dialog');
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Tem certeza que deseja continuar?'),
                                                                          content:
                                                                              Text('Você está saindo da sua conta. Após a desconexão, poderá acessar novamente a partir deste ou de qualquer outro dispositivo'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('Sim'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Cancelar'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (!confirmDialogResponse) {
                                                              logFirebaseEvent(
                                                                  'Button_auth');
                                                              GoRouter.of(
                                                                      context)
                                                                  .prepareAuthEvent();
                                                              await authManager
                                                                  .signOut();
                                                              GoRouter.of(
                                                                      context)
                                                                  .clearRedirectLocation();

                                                              _navigate = () =>
                                                                  context.goNamedAuth(
                                                                      InitialPageWidget
                                                                          .routeName,
                                                                      context
                                                                          .mounted);
                                                              logFirebaseEvent(
                                                                  'Button_update_app_state');
                                                              FFAppState()
                                                                  .inputAreacode = '';
                                                              FFAppState()
                                                                  .inputPhone = '';
                                                              FFAppState()
                                                                  .inputEmail = '';
                                                              FFAppState()
                                                                  .inputAreacodeIndex = 0;
                                                              FFAppState()
                                                                      .wasUser =
                                                                  false;
                                                              FFAppState()
                                                                  .userRole = '';
                                                              FFAppState()
                                                                  .deleteProfilepicture();
                                                              FFAppState()
                                                                  .profilepicture = '';

                                                              FFAppState()
                                                                  .deleteDisplayName();
                                                              FFAppState()
                                                                  .displayName = '';

                                                              FFAppState()
                                                                  .deleteGender();
                                                              FFAppState()
                                                                  .gender = '';

                                                              FFAppState()
                                                                  .deleteValuesPrivacy();
                                                              FFAppState()
                                                                      .valuesPrivacy =
                                                                  false;

                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            _navigate();
                                                          },
                                                          text: 'Sair',
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.05,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent3,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent3,
                                                              width:
                                                                  FFAppConstants
                                                                      .stroke,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              FFAppConstants
                                                                  .borderS,
                                                              0.0,
                                                            )),
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'PERFIL_PAGE_EXCLUIR_CONTA_BTN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Button_alert_dialog');
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Tem certeza que deseja continuar?'),
                                                                          content:
                                                                              Text('Esta ação NÃO PODE SER DESFEITA. Após a confirmação, todos os seus dados serão irrecuperáveis e não poderão ser restaurados por nossa equipe de suporte.'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('CONFIRMAR'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Cancelar'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (!confirmDialogResponse) {
                                                              logFirebaseEvent(
                                                                  'Button_backend_call');
                                                              _model.deletedUser =
                                                                  await DeleteUserCall
                                                                      .call(
                                                                userId:
                                                                    currentUserUid,
                                                              );

                                                              logFirebaseEvent(
                                                                  'Button_auth');
                                                              GoRouter.of(
                                                                      context)
                                                                  .prepareAuthEvent();
                                                              await authManager
                                                                  .signOut();
                                                              GoRouter.of(
                                                                      context)
                                                                  .clearRedirectLocation();

                                                              logFirebaseEvent(
                                                                  'Button_navigate_to');

                                                              context.goNamedAuth(
                                                                  LoginPhoneWidget
                                                                      .routeName,
                                                                  context
                                                                      .mounted);

                                                              logFirebaseEvent(
                                                                  'Button_update_app_state');
                                                              FFAppState()
                                                                  .inputAreacode = '';
                                                              FFAppState()
                                                                  .inputPhone = '';
                                                              FFAppState()
                                                                  .inputEmail = '';
                                                              FFAppState()
                                                                  .inputAreacodeIndex = 0;
                                                              FFAppState()
                                                                      .wasUser =
                                                                  false;
                                                              FFAppState()
                                                                  .userRole = '';
                                                              FFAppState()
                                                                  .deleteProfilepicture();
                                                              FFAppState()
                                                                  .profilepicture = '';

                                                              FFAppState()
                                                                  .deleteDisplayName();
                                                              FFAppState()
                                                                  .displayName = '';

                                                              FFAppState()
                                                                  .deleteGender();
                                                              FFAppState()
                                                                  .gender = '';

                                                              FFAppState()
                                                                  .deleteValuesPrivacy();
                                                              FFAppState()
                                                                      .valuesPrivacy =
                                                                  false;

                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                          text: 'Excluir conta',
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.05,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .geologica(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent3,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent3,
                                                              width:
                                                                  FFAppConstants
                                                                      .stroke,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              FFAppConstants
                                                                  .borderS,
                                                              0.0,
                                                            )),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: FFAppConstants
                                                              .Gap)),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 60.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                    ),
                                                  ].divide(SizedBox(
                                                      height: FFAppConstants
                                                          .doubleGap)),
                                                ),
                                              ),
                                            ].divide(SizedBox(
                                                height:
                                                    FFAppConstants.doubleGap)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (_model.checkboxValue ?? true)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 80.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Builder(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0,
                                                        valueOrDefault<double>(
                                                          FFAppConstants.Gap,
                                                          0.0,
                                                        ),
                                                        30.0,
                                                        valueOrDefault<double>(
                                                          FFAppConstants
                                                              .doubleGap,
                                                          0.0,
                                                        )),
                                                child: FFButtonWidget(
                                                  onPressed: (!_model
                                                              .hasChanged ||
                                                          (_model.firstNameTextController
                                                                      .text ==
                                                                  null ||
                                                              _model
                                                                      .firstNameTextController
                                                                      .text ==
                                                                  '') ||
                                                          (_model
                                                                      .lastNameTextController
                                                                      .text ==
                                                                  null ||
                                                              _model
                                                                      .lastNameTextController
                                                                      .text ==
                                                                  '') ||
                                                          (_model.radioButtonValue ==
                                                                  null ||
                                                              _model.radioButtonValue ==
                                                                  '') ||
                                                          (_model.birthDateTextController
                                                                      .text ==
                                                                  null ||
                                                              _model.birthDateTextController
                                                                      .text ==
                                                                  ''))
                                                      ? null
                                                      : () async {
                                                          logFirebaseEvent(
                                                              'PERFIL_PAGE_SALVAR_BTN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Button_validate_form');
                                                          if (_model.formKey
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .dropdownEstadosValue ==
                                                              null) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .dropdownEspecialidadesValue ==
                                                              null) {
                                                            return;
                                                          }
                                                          if (_model.uploadedLocalFile_uploadedPic !=
                                                                  null &&
                                                              (_model
                                                                      .uploadedLocalFile_uploadedPic
                                                                      .bytes
                                                                      ?.isNotEmpty ??
                                                                  false)) {
                                                            logFirebaseEvent(
                                                                'Button_upload_media_to_supabase');
                                                            {
                                                              safeSetState(() =>
                                                                  _model.isDataUploading_uploadedPicSupa =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];
                                                              var selectedMedia =
                                                                  <SelectedFile>[];
                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                selectedUploadedFiles = _model
                                                                        .uploadedLocalFile_uploadedPic
                                                                        .bytes!
                                                                        .isNotEmpty
                                                                    ? [
                                                                        _model
                                                                            .uploadedLocalFile_uploadedPic
                                                                      ]
                                                                    : <FFUploadedFile>[];
                                                                selectedMedia =
                                                                    selectedFilesFromUploadedFiles(
                                                                  selectedUploadedFiles,
                                                                  storageFolderPath:
                                                                      currentUserUid,
                                                                );
                                                                downloadUrls =
                                                                    await uploadSupabaseStorageFiles(
                                                                  bucketName:
                                                                      'profilepictures',
                                                                  selectedFiles:
                                                                      selectedMedia,
                                                                );
                                                              } finally {
                                                                _model.isDataUploading_uploadedPicSupa =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.uploadedLocalFile_uploadedPicSupa =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl_uploadedPicSupa =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                              } else {
                                                                safeSetState(
                                                                    () {});
                                                                return;
                                                              }
                                                            }

                                                            logFirebaseEvent(
                                                                'Button_update_app_state');
                                                            FFAppState()
                                                                    .profilepicture =
                                                                _model
                                                                    .uploadedFileUrl_uploadedPicSupa;
                                                            safeSetState(() {});
                                                          }
                                                          logFirebaseEvent(
                                                              'Button_update_app_state');
                                                          FFAppState().gender =
                                                              _model
                                                                  .radioButtonValue!;
                                                          FFAppState()
                                                                  .displayName =
                                                              _model
                                                                  .firstNameTextController
                                                                  .text;
                                                          FFAppState()
                                                              .update(() {});
                                                          logFirebaseEvent(
                                                              'Button_backend_call');
                                                          _model.updateProfile1 =
                                                              await UserProfileTable()
                                                                  .update(
                                                            data: {
                                                              'displayname': _model
                                                                  .firstNameTextController
                                                                  .text,
                                                              'gender': _model
                                                                  .radioButtonValue,
                                                              'profilepicture':
                                                                  FFAppState()
                                                                      .profilepicture,
                                                              'uf_index': _model
                                                                  .dropdownEstadosValue,
                                                              'specialty_index':
                                                                  _model
                                                                      .dropdownEspecialidadesValue,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              currentUserUid,
                                                            ),
                                                            returnRows: true,
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_backend_call');
                                                          _model.updateMedicos =
                                                              await MedicosTable()
                                                                  .update(
                                                            data: {
                                                              'primeiro_nome':
                                                                  _model
                                                                      .firstNameTextController
                                                                      .text,
                                                              'sobrenome': _model
                                                                  .lastNameTextController
                                                                  .text,
                                                              'genero': _model
                                                                  .radioButtonValue,
                                                              'cpf': _model
                                                                  .cpfTextController
                                                                  .text,
                                                              'data_nascimento':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      _model
                                                                          .formatedDate),
                                                              'crm': _model
                                                                  .crmTextController
                                                                  .text,
                                                              'especialidade_id':
                                                                  formEspecialidadesRowList
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .dropdownEspecialidadesValue!)
                                                                      ?.id,
                                                              'estado': containerEstadosBrasilRowList
                                                                  .elementAtOrNull(
                                                                      _model
                                                                          .dropdownEstadosValue!)
                                                                  ?.sigla,
                                                              'rqe': _model
                                                                  .rqeTextController
                                                                  .text,
                                                              'update_at':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                              'update_by':
                                                                  currentUserUid,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              currentUserUid,
                                                            ),
                                                            returnRows: true,
                                                          );
                                                          if (_model.updateMedicos !=
                                                                  null &&
                                                              (_model.updateMedicos)!
                                                                  .isNotEmpty) {
                                                            logFirebaseEvent(
                                                                'Button_update_page_state');
                                                            _model.hasChanged =
                                                                false;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Button_alert_dialog');
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        PositiveDialogBoxWidget(
                                                                      dialog:
                                                                          'Perfil atualizado!',
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            logFirebaseEvent(
                                                                'Button_update_app_state');
                                                            FFAppState()
                                                                    .CRMCheck =
                                                                true;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Button_reset_form_fields');
                                                            safeSetState(() {
                                                              _model.checkboxValue =
                                                                  false;
                                                            });
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Button_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Não foi possível atualizar seu perfil. Entre em contato com o suporte.',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                  text: 'Salvar',
                                                  options: FFButtonOptions(
                                                    width: 330.0,
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .geologica(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            valueOrDefault<
                                                                double>(
                                                      FFAppConstants.borderS,
                                                      0.0,
                                                    )),
                                                    disabledColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent2,
                                                    disabledTextColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                    hoverColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
