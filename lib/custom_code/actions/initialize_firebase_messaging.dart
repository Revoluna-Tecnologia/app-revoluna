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

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'dart:io' show Platform;
import 'dart:convert';
import 'initialize_deeplinks.dart';

void _handleNotificationTap(RemoteMessage message) {
  //debugPrint('📱 Processing notification tap: ${message.data}');

  String? route = message.data['route'];
  String? extraDataJson = message.data['extra_data'];

  if (route != null && route.isNotEmpty) {
    try {
      // Parse dos dados extras
      Map<String, dynamic> extraData = {};
      if (extraDataJson != null && extraDataJson.isNotEmpty) {
        extraData = json.decode(extraDataJson);
      }

      // Se for uma rota para vaga, usar o sistema de deeplink existente
      if (extraData.containsKey('vagas_id')) {
        String vagasId = extraData['vagas_id'].toString();
        String deeplink = 'revoluna://revoluna.com/$route?id=$vagasId';
        //debugPrint('🔗 Deeplink is set: $deeplink');
        // Usar a função handleDeeplink existente
        handleDeeplink(deeplink);
      } else {
        // Para outras rotas, navegar diretamente
        GoRouter.of(appNavigatorKey.currentContext!).go('/$route');
        //debugPrint('Got different route: $route');
      }
    } catch (e) {
      //debugPrint('❌ Error processing notification data: $e');
    }
  }
}

Future<void> initializeFirebaseMessaging() async {
  // 1. Configurar apresentação em foreground no iOS
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  // 2. Solicitar permissões e configurar FCM token
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

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    try {
      String? fcmToken = await messaging.getToken();
      FFAppState().fcmToken = fcmToken ?? "";

      // Detectar plataforma
      String platform;
      if (Platform.isIOS) {
        platform = 'ios';
        String? apnToken = await messaging.getAPNSToken();
        FFAppState().apnToken = apnToken ?? "";
      } else if (Platform.isAndroid) {
        platform = 'android';
      } else {
        platform = 'web';
      }

      final user = SupaFlow.client.auth.currentUser;

      // Salvar tanto o token quanto a plataforma
      if (user != null) {
        await SupaFlow.client.from('user_profile').update({
          'fcm_token': fcmToken,
          'platform': platform,
          'apn_token': FFAppState().apnToken
        }).eq('id', user.id);
      }
    } catch (e) {
      FFAppState().fcmToken = e.toString();
    }
  }

  // 4. Configurar listener apenas para badge updates
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Se for update de badge
    if (message.data['type'] == 'badge_update') {
      int badgeCount = int.tryParse(message.data['badge_count'] ?? '0') ?? 0;
      FlutterAppBadger.updateBadgeCount(badgeCount);
    }
    // Notificações visuais são mostradas automaticamente pelo setForegroundNotificationPresentationOptions
  });

  // 5. Handler para quando o usuário toca na notificação (app em background)
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //debugPrint('🔔 Notification tapped - app was in background');
    _handleNotificationTap(message);
  });

  // 6. Handler para quando o app é aberto através de uma notificação (app fechado)
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    //debugPrint('🔔 App opened from notification');
    _handleNotificationTap(initialMessage);
  }
}
