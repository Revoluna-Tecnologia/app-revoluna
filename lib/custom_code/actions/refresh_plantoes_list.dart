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

/// Custom action to refresh the list views in the Plantões page
/// This action triggers a rebuild to refresh the list views when called
/// from the Expandable widget toggle
Future<void> refreshPlantoesList(BuildContext context) async {
  // Check if the context is still valid
  if (!context.mounted) return;

  try {
    // Force a rebuild by triggering markNeedsBuild on the context
    if (context is Element) {
      context.markNeedsBuild();
    }

    // Alternative approach: Find the ancestor widget and rebuild
    final renderObject = context.findRenderObject();
    if (renderObject != null) {
      renderObject.markNeedsPaint();
      renderObject.markNeedsLayout();
    }

    // Optional: Add a small delay to ensure UI updates smoothly
    await Future.delayed(const Duration(milliseconds: 100));
  } catch (e) {
    //print('Erro ao atualizar listas: $e');
  }
}
