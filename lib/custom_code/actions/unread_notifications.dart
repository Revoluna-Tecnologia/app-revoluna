// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future unreadNotifications() async {
  try {
    final user = SupaFlow.client.auth.currentUser;
    final bool response = (await SupaFlow.client
            .from('notifications')
            .select('id')
            .eq('recipient_id', user!.id)
            .eq('is_read', false))
        .isNotEmpty;

    // Define o valor na appState
    FFAppState().update(() {
      FFAppState().unreadNotifications = response;
    });
  } catch (error) {
    print('Erro ao buscar número: $error');

    // Define o valor padrão na appState em caso de erro
    FFAppState().update(() {
      FFAppState().unreadNotifications = false;
    });
  }
}
