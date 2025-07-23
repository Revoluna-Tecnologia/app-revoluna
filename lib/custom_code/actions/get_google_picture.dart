// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> getGooglePicture() async {
  // Default empty picture URL
  String profilePictureUrl = '';

  try {
    // Get current user from Supabase
    final User? currentUser = SupaFlow.client.auth.currentUser;

    if (currentUser != null && currentUser.userMetadata != null) {
      // Try to get profile picture URL from different possible metadata fields
      String? pictureUrl = currentUser.userMetadata!['avatar_url'] as String?;
      pictureUrl ??= currentUser.userMetadata!['picture'] as String?;
      pictureUrl ??= currentUser.userMetadata!['profile_picture'] as String?;

      if (pictureUrl != null && pictureUrl.isNotEmpty) {
        profilePictureUrl = pictureUrl;
      }
    }
  } catch (e) {
    print('Error getting user profile picture: $e');
  }

  return profilePictureUrl;
}
