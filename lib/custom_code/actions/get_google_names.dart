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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<String>> getGoogleNames() async {
  // Initialize return list with empty values
  List<String> namesList = ['', ''];

  try {
    // Get current user from Supabase
    final User? currentUser = SupaFlow.client.auth.currentUser;

    if (currentUser != null && currentUser.userMetadata != null) {
      // Try to get display name from user metadata
      // The field might be 'name', 'full_name', or 'display_name' depending on OAuth provider
      String? fullName = currentUser.userMetadata!['name'] as String?;
      fullName ??= currentUser.userMetadata!['full_name'] as String?;
      fullName ??= currentUser.userMetadata!['display_name'] as String?;

      if (fullName != null && fullName.isNotEmpty) {
        // Parse the full name
        List<String> nameParts = fullName.trim().split(' ');

        // Get first name (first part)
        if (nameParts.isNotEmpty) {
          namesList[0] = nameParts.first;
        }

        // Get last name (last part)
        if (nameParts.length > 1) {
          namesList[1] = nameParts.last;
        }
      }
    }
  } catch (e) {
    print('Error getting user display name: $e');
  }

  return namesList;
}
