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

import 'index.dart'; // Imports other custom actions

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:crypto/crypto.dart';

Future<List<String>> loginApple(BuildContext context) async {
  // Initialize return list with empty values
  List<String> appleData = ['', '', '', ''];

  final rawNonce = SupaFlow.client.auth.generateRawNonce();
  final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

  final credential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
    nonce: hashedNonce,
  );

  // Capture the name data from Apple credential
  final String firstName = credential.givenName ?? "";
  final String lastName = credential.familyName ?? "";
  final String email = credential.email ?? "";

  // Now prepare auth event and complete authentication
  GoRouter.of(context).prepareAuthEvent();

  final idToken = credential.identityToken;
  if (idToken == null) {
    throw const AuthException(
        'Could not find ID Token from generated credential.');
  }

  // Complete the authentication
  await SupaFlow.client.auth.signInWithIdToken(
    provider: OAuthProvider.apple,
    idToken: idToken,
    nonce: rawNonce,
  );

  final user = SupaFlow.client.auth.currentUser;

  // Construct return list
  appleData[0] = firstName;
  appleData[1] = lastName;
  appleData[2] = user!.id;
  appleData[3] = email;

  return appleData;
}
