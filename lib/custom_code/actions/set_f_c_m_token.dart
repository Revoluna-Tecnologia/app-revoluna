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

import 'index.dart'; // Imports other custom actions

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io' show Platform;

Future setFCMToken() async {
  await Firebase.initializeApp();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FFAppState().fcmToken = "About to check PN permissions";

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    FFAppState().fcmToken = "authorizing works";
    try {
      String? fcmToken = await messaging.getToken();
      FFAppState().fcmToken = fcmToken ?? "";
      //print('FCM Token: $fcmToken');

      // Detectar plataforma
      String platform;
      if (Platform.isIOS) {
        platform = 'ios';
        String? apnToken = await messaging.getAPNSToken();
        FFAppState().apnToken = apnToken ?? "";
        print('APN Token: $apnToken');
      } else if (Platform.isAndroid) {
        platform = 'android';
      } else {
        platform = 'web';
      }

      //print('Platform detected: $platform');

      final user = SupaFlow.client.auth.currentUser;

      // Salvar tanto o token quanto a plataforma
      await SupaFlow.client.from('user_profile').update({
        'fcm_token': fcmToken,
        'platform': platform,
        'apn_token': FFAppState().apnToken
      }).eq('id', user!.id);
      print('User updated: ${user.id}');
    } catch (e) {
      //print('Error: $e');
    }
  }
}
