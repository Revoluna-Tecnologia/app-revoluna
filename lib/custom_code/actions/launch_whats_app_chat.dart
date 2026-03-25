// Automatic FlutterFlow imports
import '/backend/backend.dart';
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

Future<bool> launchWhatsAppChat(String message, String phone) async {
  try {
    // Format the phone number to international format
    // Remove all non-numeric characters
    String cleanPhone = phone.replaceAll(RegExp(r'[^0-9]'), '');

    // If the number doesn't start with country code, add Brazil's code (55)
    // Brazilian numbers should be: 55 + DDD (2 digits) + number (8 or 9 digits)
    String formattedPhone;
    if (!cleanPhone.startsWith('55')) {
      // Add Brazil country code if not present
      formattedPhone = '55$cleanPhone';
    } else {
      formattedPhone = cleanPhone;
    }

    // Different approaches for different platforms
    Uri? uri;

    // URL encode the message if provided
    final encodedMessage = Uri.encodeComponent(message);

    if (Platform.isIOS) {
      // For iOS, use direct app URL scheme
      uri = Uri.parse(
          'whatsapp://send?phone=$formattedPhone&text=$encodedMessage');
    } else {
      // For Android, try the app URL scheme first, fallback to wa.me
      uri = Uri.parse(
          'whatsapp://send?phone=$formattedPhone&text=$encodedMessage');
    }

    // Try to launch directly without canLaunchUrl check
    // because both iOS and Android may return false even when WhatsApp is installed
    bool success = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    return success;
  } catch (e) {
    // Return false if any error occurs
    return false;
  }
}
