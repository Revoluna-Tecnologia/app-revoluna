// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

Future<void> launchWhatsAppChat(String message) async {
  // Ensure the phone number is properly formatted (international format without special characters)
  String formattedNumber = FFAppState().concierge;

  // URL encode the message if provided
  final encodedMessage = message != null ? Uri.encodeComponent(message) : '';

  // Different approaches for different platforms
  Uri? uri;

  if (Platform.isIOS) {
    // For iOS, use direct app URL scheme
    uri = Uri.parse(
        'whatsapp://send?phone=$formattedNumber&text=$encodedMessage');
  } else {
    // For Android, use the wa.me format
    uri = Uri.parse('https://wa.me/$formattedNumber?text=$encodedMessage');
  }

  await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  );
}
