import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/dialogs/favorite_dialog_box/favorite_dialog_box_widget.dart';
import '/components/dialogs/justification_box/justification_box_widget.dart';
import '/components/dialogs/negative_dialog_box/negative_dialog_box_widget.dart';
import '/components/dialogs/negative_informative_box/negative_informative_box_widget.dart';
import '/components/dialogs/passar_plantao_dialog_box/passar_plantao_dialog_box_widget.dart';
import '/components/dialogs/positive_dialog_box/positive_dialog_box_widget.dart';
import '/components/dialogs/small_dialog/small_dialog_widget.dart';
import '/components/vagas/address_icon_button/address_icon_button_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'vaga_bottom_sheet_widget.dart' show VagaBottomSheetWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class VagaBottomSheetModel extends FlutterFlowModel<VagaBottomSheetWidget> {
  ///  Local state fields for this component.

  bool isCandidate = false;

  bool isSaved = false;

  bool? isAnnounced = false;

  bool isApproved = false;

  bool isCheckedIn = false;

  bool isCheckedOut = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in VagaBottomSheet widget.
  List<VagasSalvasRow>? saved;
  // Stores action output result for [Backend Call - Query Rows] action in VagaBottomSheet widget.
  List<CheckinCheckoutRow>? checkin;
  // Stores action output result for [Backend Call - Query Rows] action in VagaBottomSheet widget.
  List<VagasRequisitoRow>? requirements;
  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<VagasRow>? cancelAnounce;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  bool? acceptedSubmit;
  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<VagasRow>? anounceJob;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Checkbox widget.
  Map<RequisitoTipoRow, bool> checkboxValueMap = {};
  List<RequisitoTipoRow> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Switch widget.
  bool? switchValue;
  Stream<List<PagamentosRow>>? switchSupabaseStream;
  // Stores action output result for [Backend Call - Insert Row] action in Switch widget.
  PagamentosRow? insertPay;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // Stores action output result for [Custom Action - checkInCheckOut] action in Button widget.
  String? checkOut01;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? checkOutJustification;
  // Stores action output result for [Custom Action - checkInCheckOut] action in Button widget.
  String? checkOut02;
  // Stores action output result for [Custom Action - checkInCheckOut] action in Button widget.
  String? checkIn01;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? checkInJustification;
  // Stores action output result for [Custom Action - checkInCheckOut] action in Button widget.
  String? checkIn02;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<CandidaturasRow>? deleteCandidatura;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? favoriteAccept;
  // Stores action output result for [Custom Action - insertCandidaturas] action in Button widget.
  String? insertFavorite;
  // Stores action output result for [Custom Action - insertCandidaturas] action in Button widget.
  String? insertCandidatura;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
  }
}
