import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future clearCache(BuildContext context) async {
  logFirebaseEvent('clearCache_clear_query_cache');
  FFAppState().clearVagasCandidaturasCache();
  logFirebaseEvent('clearCache_clear_query_cache');
  FFAppState().clearCleanHospitalTermsCache();
}
