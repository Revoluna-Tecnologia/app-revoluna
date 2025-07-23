// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:crypto/crypto.dart';
//import 'package:revoluna/app_state.dart';
import '../../backend/supabase/supabase.dart';

//Future<User?> loginApple() async {
Future<void> loginApple(BuildContext context) async {
//  if (kIsWeb) {
//    await SupaFlow.client.auth.signInWithOAuth(
//      OAuthProvider.apple,
//      authScreenLaunchMode: LaunchMode.platformDefault,
//    );

//    return SupaFlow.client.auth.onAuthStateChange
//        .timeout(const Duration(minutes: 5))
//        .firstWhere((event) => event.event == AuthChangeEvent.signedIn)
//        .then((event) => SupaFlow.client.auth.currentUser);
//  }

  final rawNonce = SupaFlow.client.auth.generateRawNonce();
  final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

  final credential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
    nonce: hashedNonce,
  );

  final idToken = credential.identityToken;
  if (idToken == null) {
    throw const AuthException(
        'Could not find ID Token from generated credential.');
  }

  final String firstname = credential.givenName ?? "";
  final String lastname = credential.familyName ?? "";
  final String email = credential.email ?? "";

  FFAppState().update(() {
    FFAppState().appleData = [firstname, lastname, email];
  });

  final authResponse = await SupaFlow.client.auth.signInWithIdToken(
    provider: OAuthProvider.apple,
    idToken: idToken,
    nonce: rawNonce,
  );

//return authResponse.user;
}
