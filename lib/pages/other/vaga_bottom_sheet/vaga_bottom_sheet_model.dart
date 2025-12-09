import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/dialogs/favorite_dialog_box/favorite_dialog_box_widget.dart';
import '/components/dialogs/justification_box/justification_box_widget.dart';
import '/components/dialogs/location_request/location_request_widget.dart';
import '/components/dialogs/negative_dialog_box/negative_dialog_box_widget.dart';
import '/components/dialogs/negative_informative_box/negative_informative_box_widget.dart';
import '/components/dialogs/passar_plantao_dialog_box/passar_plantao_dialog_box_widget.dart';
import '/components/dialogs/positive_dialog_box/positive_dialog_box_widget.dart';
import '/components/vagas/address_icon_button/address_icon_button_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/other/paywall/paywall_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'vaga_bottom_sheet_widget.dart' show VagaBottomSheetWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VagaBottomSheetModel extends FlutterFlowModel<VagaBottomSheetWidget> {
  ///  Local state fields for this component.

  bool isCandidate = false;

  bool isSaved = false;

  bool? isAnnounced = false;

  bool isApproved = false;

  bool isCheckedIn = false;

  bool isCheckedOut = false;

  bool isFavorite = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in VagaBottomSheet widget.
  List<VagasRequisitosRow>? requirements;
  // Stores action output result for [Backend Call - Query Rows] action in VagaBottomSheet widget.
  List<VagasSalvasRow>? saved;
  // Stores action output result for [Backend Call - Query Rows] action in VagaBottomSheet widget.
  List<CheckinCheckoutRow>? checkin;
  // Stores action output result for [Backend Call - Query Rows] action in VagaBottomSheet widget.
  List<MedicosRow>? medicoinfo;
  // Stores action output result for [Backend Call - Query Rows] action in VagaBottomSheet widget.
  List<MedicosFavoritosRow>? favorite;
  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<VagasRow>? cancelAnounce;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  bool? acceptedSubmit;
  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<VagasRow>? anounceJob;
  // State field(s) for expandable_requisitos widget.
  late ExpandableController expandableRequisitosExpandableController;

  // State field(s) for Checkbox widget.
  Map<RequisitosRow, bool> checkboxValueMap = {};
  List<RequisitosRow> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for expandable_contratante widget.
  late ExpandableController expandableContratanteExpandableController;

  // Stores action output result for [Custom Action - launchWhatsAppChat] action in Button widget.
  bool? launchwhatsapPhone;
  // Stores action output result for [Custom Action - insertCandidaturas] action in Button widget.
  String? insertCandidaturaPhone;
  // State field(s) for expandable_comochegar widget.
  late ExpandableController expandableComochegarExpandableController;

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for epandable_pagamento widget.
  late ExpandableController epandablePagamentoExpandableController;

  // State field(s) for expandable_beneficios widget.
  late ExpandableController expandableBeneficiosExpandableController;

  // Stores action output result for [Custom Action - checkInCheckOut] action in Button widget.
  String? checkOut01;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? checkOutJustification;
  // Stores action output result for [Custom Action - checkInCheckOut] action in Button widget.
  String? checkOut02;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? locationrequest2;
  // Stores action output result for [Custom Action - requestLocationPermission] action in Button widget.
  bool? permission2;
  // Stores action output result for [Custom Action - checkInCheckOut] action in Button widget.
  String? checkIn01;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? checkInJustification;
  // Stores action output result for [Custom Action - checkInCheckOut] action in Button widget.
  String? checkIn02;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? locationrequest;
  // Stores action output result for [Custom Action - requestLocationPermission] action in Button widget.
  bool? permission;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? favoriteAccept;
  // Stores action output result for [Custom Action - insertCandidaturas] action in Button widget.
  String? insertFavorite;
  // Stores action output result for [Custom Action - launchWhatsAppChat] action in Button widget.
  bool? launchwhatsapp;
  // Stores action output result for [Custom Action - insertCandidaturas] action in Button widget.
  String? insertCandidatura;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableRequisitosExpandableController.dispose();
    expandableContratanteExpandableController.dispose();
    expandableComochegarExpandableController.dispose();
    epandablePagamentoExpandableController.dispose();
    expandableBeneficiosExpandableController.dispose();
  }
}
