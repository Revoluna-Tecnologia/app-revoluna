// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> updateUserPhone(String newPhone, String userID) async {
  try {
    // 1. Obter o cliente Supabase do FlutterFlow
    final supaClient = Supabase.instance.client;

    // 2. Obter o usuário atual logado
    final currentUser = userID;

    // 5. Chamar o update oficial do Supabase Auth
    final response =
        await supaClient.auth.updateUser(UserAttributes(phone: newPhone));
  } catch (error) {
    return false;
  }
  return true;
}
