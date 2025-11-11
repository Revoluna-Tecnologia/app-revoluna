import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/back_top_bar/back_top_bar_widget.dart';
import '/components/dialogs/positive_dialog_box/positive_dialog_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'cadastro3_model.dart';
export 'cadastro3_model.dart';

class Cadastro3Widget extends StatefulWidget {
  const Cadastro3Widget({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.termsAccept,
    this.gender,
    required this.estadoUF,
    required this.crm,
    required this.cpf,
    required this.rqe,
    required this.birthdate,
    required this.arecodeindex,
    required this.estadoUFindex,
    required this.specialty,
    required this.camefrom,
    required this.specialtyindex,
  });

  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final bool? termsAccept;
  final String? gender;
  final String? estadoUF;
  final String? crm;
  final String? cpf;
  final String? rqe;
  final DateTime? birthdate;
  final int? arecodeindex;
  final int? estadoUFindex;
  final String? specialty;
  final String? camefrom;
  final int? specialtyindex;

  static String routeName = 'Cadastro3';
  static String routePath = '/cadastro3';

  @override
  State<Cadastro3Widget> createState() => _Cadastro3WidgetState();
}

class _Cadastro3WidgetState extends State<Cadastro3Widget> {
  late Cadastro3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Cadastro3Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Cadastro3'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CADASTRO3_PAGE_Cadastro3_ON_INIT_STATE');
      if (widget!.camefrom == 'google') {
        logFirebaseEvent('Cadastro3_custom_action');
        _model.googleProfilePic = await actions.getGooglePicture();
        logFirebaseEvent('Cadastro3_update_app_state');
        FFAppState().profilepicture = _model.googleProfilePic!;
        FFAppState().update(() {});
        logFirebaseEvent('Cadastro3_update_page_state');
        _model.picWasSet = true;
        _model.ready = true;
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.backTopBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BackTopBarWidget(
                    logo: false,
                    backButton: () async {
                      logFirebaseEvent('CADASTRO3_Container_159mc222_CALLBACK');
                      logFirebaseEvent('BackTopBar_navigate_back');
                      context.safePop();
                    },
                  ),
                ),
                Padding(
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
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            FFAppConstants.halfGap,
                            0.0,
                          ),
                          0.0,
                          valueOrDefault<double>(
                            FFAppConstants.halfGap,
                            0.0,
                          ),
                          0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.07,
                              60.0,
                            ),
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.07,
                              60.0,
                            ),
                            child: custom_widgets.CircularProgressText(
                              width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.07,
                                60.0,
                              ),
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.07,
                                60.0,
                              ),
                              progressValue: 1.0,
                              size: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.07,
                                60.0,
                              ),
                              progressColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent2,
                              strokeWidth: 6.0,
                              displayText: '3/3',
                              animationDuration: 1000.0,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Foto de perfil',
                                textAlign: TextAlign.start,
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
                                'Última etapa!',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                            ],
                          ),
                        ].divide(SizedBox(width: FFAppConstants.doubleGap)),
                      ),
                    ),
                  ),
                ),
                Padding(
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.442,
                                decoration: BoxDecoration(),
                                child: Text(
                                  'Toque para adicionar uma foto de perfil',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.geologica(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Stack(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if (FFAppState().profilepicture != null &&
                                          FFAppState().profilepicture != '') {
                                        return Builder(
                                          builder: (context) {
                                            if (_model.uploadedLocalFile_localupload !=
                                                    null &&
                                                (_model.uploadedLocalFile_localupload
                                                        .bytes?.isNotEmpty ??
                                                    false)) {
                                              return Container(
                                                width: 120.0,
                                                height: 120.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.memory(
                                                  _model.uploadedLocalFile_localupload
                                                          .bytes ??
                                                      Uint8List.fromList([]),
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                width: 120.0,
                                                height: 120.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    FFAppState().profilepicture,
                                                    'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/profilepictures//Avatar.png',
                                                  ),
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        );
                                      } else if (_model
                                          .isDataUploading_localupload) {
                                        return Lottie.asset(
                                          'assets/jsons/81EfiEihcA.json',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.34,
                                          height: 120.0,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        );
                                      } else {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 120.0,
                                            height: 120.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              FFIcons.kupload,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 40.0,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.3, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      buttonSize: 30.96,
                                      fillColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      icon: Icon(
                                        FFIcons.kedit2,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 15.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'CADASTRO3_PAGE__BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_store_media_for_upload');
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          maxWidth: 360.00,
                                          imageQuality: 80,
                                          allowPhoto: true,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          textColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          pickerFontFamily: 'Geologica',
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() => _model
                                                  .isDataUploading_localupload =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading_localupload =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_localupload =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedLocalFile_localupload !=
                                                null &&
                                            (_model.uploadedLocalFile_localupload
                                                    .bytes?.isNotEmpty ??
                                                false)) {
                                          logFirebaseEvent(
                                              'Button_update_page_state');
                                          _model.ready = true;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Button_update_page_state');
                                          _model.picWasSet = false;
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'Button_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Foto de perfil não foi carregada!',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.geologica(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                    ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                            ),
                                          );
                                        }
                                      },
                                      text: '',
                                      options: FFButtonOptions(
                                        width: 120.0,
                                        height: 120.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x00A369ED),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(120.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    valueOrDefault<double>(
                                      FFAppConstants.Gap,
                                      0.0,
                                    ),
                                    0.0,
                                    valueOrDefault<double>(
                                      FFAppConstants.Gap,
                                      0.0,
                                    )),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CADASTRO3_QUERO_SEGUIR_SEM_UMA_FOTO_BTN_');
                                    logFirebaseEvent('Button_alert_dialog');
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Foto de perfil'),
                                                  content: Text(
                                                      'Tem certeza que deseja prosseguir sem personalizar seu perfil?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Sim'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Não'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (!confirmDialogResponse) {
                                      if (_model.uploadedLocalFile_localupload !=
                                              null &&
                                          (_model.uploadedLocalFile_localupload
                                                  .bytes?.isNotEmpty ??
                                              false)) {
                                        logFirebaseEvent(
                                            'Button_clear_uploaded_data');
                                        safeSetState(() {
                                          _model.isDataUploading_localupload =
                                              false;
                                          _model.uploadedLocalFile_localupload =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                        });
                                      }
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().profilepicture =
                                          'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/profilepictures//Avatar.png';
                                      FFAppState().update(() {});
                                      logFirebaseEvent(
                                          'Button_update_page_state');
                                      _model.picWasSet = true;
                                      _model.ready = true;
                                      safeSetState(() {});
                                    }
                                  },
                                  text: 'Quero seguir sem uma foto',
                                  options: FFButtonOptions(
                                    width: 189.6,
                                    height: 31.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0x00A369ED),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.geologica(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(110.0),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: FFAppConstants.Gap)),
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.borderS,
                                        0.0,
                                      )),
                                    ),
                                  ),
                                  unselectedWidgetColor:
                                      FlutterFlowTheme.of(context).accent2,
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue ??= false,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.checkboxValue = newValue!);
                                  },
                                  side: (FlutterFlowTheme.of(context).accent2 !=
                                          null)
                                      ? BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .accent2!,
                                        )
                                      : null,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'Ao fornecer meus dados, estou ciente de que serão tratados de acordo com os ',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      TextSpan(
                                        text: 'termos de uso',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.geologica(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        mouseCursor: SystemMouseCursors.click,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            logFirebaseEvent(
                                                'CADASTRO3_RichTextSpan_ovm1fv34_ON_TAP');
                                            logFirebaseEvent(
                                                'RichTextSpan_navigate_to');

                                            context.pushNamed(
                                                TermosWidget.routeName);
                                          },
                                      ),
                                      TextSpan(
                                        text: '.',
                                        style: TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.geologica(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                ),
                              ),
                            ].divide(SizedBox(width: FFAppConstants.halfGap)),
                          ),
                        ),
                        Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                valueOrDefault<double>(
                                  FFAppConstants.doubleGap,
                                  0.0,
                                ),
                                0.0,
                                0.0),
                            child: FFButtonWidget(
                              onPressed: (!_model.ready ||
                                      (_model.checkboxValue == false))
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'CADASTRO3_PAGE_FINALIZAR_BTN_ON_TAP');
                                      if (!(currentUserUid != null &&
                                          currentUserUid != '')) {
                                        logFirebaseEvent('Button_auth');
                                        GoRouter.of(context).prepareAuthEvent();
                                        if ('${widget!.cpf}${widget!.crm}' !=
                                            '${widget!.cpf}${widget!.crm}') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Senhas não são idênticas',
                                              ),
                                            ),
                                          );
                                          return;
                                        }

                                        final user = await authManager
                                            .createAccountWithEmail(
                                          context,
                                          widget!.email!,
                                          '${widget!.cpf}${widget!.crm}',
                                        );
                                        if (user == null) {
                                          return;
                                        }
                                      }
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().userRole = 'free';
                                      FFAppState().gender = widget!.gender!;
                                      FFAppState().displayName =
                                          widget!.firstname!;
                                      FFAppState().update(() {});
                                      if (!_model.picWasSet) {
                                        logFirebaseEvent(
                                            'Button_upload_media_to_supabase');
                                        {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadDataTxi =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];
                                          var selectedMedia = <SelectedFile>[];
                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles = _model
                                                    .uploadedLocalFile_localupload
                                                    .bytes!
                                                    .isNotEmpty
                                                ? [
                                                    _model
                                                        .uploadedLocalFile_localupload
                                                  ]
                                                : <FFUploadedFile>[];
                                            selectedMedia =
                                                selectedFilesFromUploadedFiles(
                                              selectedUploadedFiles,
                                              storageFolderPath: currentUserUid,
                                            );
                                            downloadUrls =
                                                await uploadSupabaseStorageFiles(
                                              bucketName: 'profilepictures',
                                              selectedFiles: selectedMedia,
                                            );
                                          } finally {
                                            _model.isDataUploading_uploadDataTxi =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadDataTxi =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl_uploadDataTxi =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().profilepicture = _model
                                            .uploadedFileUrl_uploadDataTxi;
                                        FFAppState().update(() {});
                                      }
                                      logFirebaseEvent('Button_backend_call');
                                      await UpdateVerifiedPhoneCall.call(
                                        userId: currentUserUid,
                                        areaCodeIndex:
                                            widget!.arecodeindex?.toString(),
                                        phone: widget!.phone,
                                      );

                                      logFirebaseEvent('Button_backend_call');
                                      _model.updaterole =
                                          await UserProfileTable().update(
                                        data: {
                                          'role': 'free',
                                          'displayname': widget!.firstname,
                                          'gender': widget!.gender,
                                          'profilepicture':
                                              FFAppState().profilepicture,
                                          'areacodeIndex': widget!.arecodeindex,
                                          'UFindex': widget!.estadoUFindex,
                                          'specialtyIndex':
                                              widget!.specialtyindex,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id',
                                          currentUserUid,
                                        ),
                                        returnRows: true,
                                      );
                                      logFirebaseEvent('Button_backend_call');
                                      _model.updateMedicosRow =
                                          await MedicosTable().insert({
                                        'medico_primeironome':
                                            widget!.firstname,
                                        'medico_sobrenome': widget!.lastname,
                                        'medico_genero': widget!.gender,
                                        'medico_cpf': widget!.cpf,
                                        'medico_rqe': widget!.rqe,
                                        'medico_email': widget!.email,
                                        'medico_telefone': widget!.phone,
                                        'medico_crm': widget!.crm,
                                        'medico_estado': widget!.estadoUF,
                                        'medico_especialidade':
                                            widget!.specialty,
                                        'medico_datanascimento':
                                            supaSerialize<DateTime>(
                                                widget!.birthdate),
                                        'id': currentUserUid,
                                      });
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: PositiveDialogBoxWidget(
                                                dialog: 'Cadastro concluído!',
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamedAuth(
                                          HomePageWidget.routeName,
                                          context.mounted);

                                      safeSetState(() {});
                                    },
                              text: 'Finalizar',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.06,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
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
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(
                                    valueOrDefault<double>(
                                  FFAppConstants.borderS,
                                  0.0,
                                )),
                                disabledColor:
                                    FlutterFlowTheme.of(context).accent2,
                                disabledTextColor:
                                    FlutterFlowTheme.of(context).accent3,
                                hoverColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: FFAppConstants.doubleGap))
                          .addToStart(SizedBox(height: FFAppConstants.Gap)),
                    ),
                  ),
                ),
              ]
                  .divide(SizedBox(height: FFAppConstants.Gap))
                  .around(SizedBox(height: FFAppConstants.Gap)),
            ),
          ),
        ),
      ),
    );
  }
}
