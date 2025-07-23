import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/cadastro/back_top_bar/back_top_bar_widget.dart';
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
import 'cadastro3_widget.dart' show Cadastro3Widget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Cadastro3Model extends FlutterFlowModel<Cadastro3Widget> {
  ///  Local state fields for this page.

  Color? birthdateborder = Color(4293256677);

  Color cpfborder = Color(4293256677);

  Color crmborder = Color(4293256677);

  Color rqeborder = Color(4293256677);

  bool picWasSet = false;

  bool ready = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getGooglePicture] action in Cadastro3 widget.
  String? googleProfilePic;
  // Model for BackTopBar component.
  late BackTopBarModel backTopBarModel;
  bool isDataUploading_localupload = false;
  FFUploadedFile uploadedLocalFile_localupload =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  bool isDataUploading_uploadDataTxi = false;
  FFUploadedFile uploadedLocalFile_uploadDataTxi =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataTxi = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserProfileRow>? updaterole;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MedicosRow? updateMedicosRow;

  @override
  void initState(BuildContext context) {
    backTopBarModel = createModel(context, () => BackTopBarModel());
  }

  @override
  void dispose() {
    backTopBarModel.dispose();
  }
}
