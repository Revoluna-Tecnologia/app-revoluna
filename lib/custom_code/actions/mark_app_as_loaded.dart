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

import '/custom_code/actions/initialize_deeplinks.dart' as deeplinks;

Future<void> markAppAsLoaded() async {
  try {
    print("🔗 markAppAsLoaded: Marcando app como carregado");

    // Marcar no AppState que app carregou
    FFAppState().update(() {
      FFAppState().appFullyLoaded = true;
    });

    // Aguardar UI carregar completamente
    await Future.delayed(Duration(milliseconds: 500));

    // Processar deeplink pendente se houver
    if (FFAppState().pendingDeeplinkUrl.isNotEmpty) {
      print("🔗 Encontrado deeplink pendente, processando...");
      await deeplinks.processPendingDeeplinkFromAppState();
    } else {
      print("🔗 Nenhum deeplink pendente");
    }

    print("🔗 markAppAsLoaded concluída");
  } catch (e) {
    print("🔗 ERRO em markAppAsLoaded: $e");
  }
}
