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

import 'package:url_launcher/url_launcher.dart';

Future openMail(BuildContext context) async {
  try {
    // Lista de apps de email comuns com seus esquemas de URL
    final List<EmailApp> emailApps = [
      EmailApp('Gmail', 'googlegmail://'),
      EmailApp('Outlook', 'ms-outlook://'),
      EmailApp('Yahoo Mail', 'ymail://'),
      EmailApp('Apple Mail', 'message://'),
      EmailApp('Spark', 'readdle-spark://'),
      EmailApp('Edison Mail', 'edison://'),
      EmailApp('Airmail', 'airmail://'),
      EmailApp('ProtonMail', 'protonmail://'),
    ];

    // Verificar quais apps estão disponíveis
    List<EmailApp> availableApps = [];

    for (EmailApp app in emailApps) {
      try {
        final Uri uri = Uri.parse(app.scheme);
        if (await canLaunchUrl(uri)) {
          availableApps.add(app);
        }
      } catch (e) {
        // Ignorar erros e continuar verificando outros apps
      }
    }

    // Verificar se mailto funciona (para apps não listados)
    try {
      final Uri mailtoUri = Uri.parse('mailto:');
      if (await canLaunchUrl(mailtoUri)) {
        // Se temos apps específicos E mailto funciona, mostrar lista personalizada
        if (availableApps.isNotEmpty) {
          availableApps.add(EmailApp('Outros apps de email', 'mailto:'));
        } else {
          // Se só mailto funciona, tentar usar o seletor nativo
          await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
          return;
        }
      }
    } catch (e) {
      // Ignorar erro do mailto
    }

    if (availableApps.isEmpty) {
      if (context.mounted) {
        _showNoMailAppsDialog(context);
      }
      return;
    }

    // Se só tem um app, abrir diretamente
    if (availableApps.length == 1) {
      if (context.mounted) {
        await _launchEmailApp(availableApps.first, context);
      }
      return;
    }

    // Se tem múltiplos apps, mostrar lista
    if (context.mounted) {
      _showEmailAppBottomSheet(context, availableApps);
    }
  } catch (e) {
    if (context.mounted) {
      _showNoMailAppsDialog(context);
    }
  }
}

void _showEmailAppBottomSheet(BuildContext context, List<EmailApp> apps) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Escolher app de email',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...apps.map((app) => ListTile(
                  leading: _getEmailIcon(app.name),
                  title: Text(app.name),
                  onTap: () async {
                    Navigator.pop(context);
                    await _launchEmailApp(app, context);
                  },
                )),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}

Widget _getEmailIcon(String appName) {
  switch (appName.toLowerCase()) {
    case 'gmail':
      return const Icon(Icons.mail, color: Colors.red);
    case 'outlook':
      return const Icon(Icons.mail, color: Colors.blue);
    case 'yahoo mail':
      return const Icon(Icons.mail, color: Colors.purple);
    case 'apple mail':
      return const Icon(Icons.mail, color: Colors.grey);
    case 'spark':
      return const Icon(Icons.flash_on, color: Colors.orange);
    case 'protonmail':
      return const Icon(Icons.security, color: Colors.purple);
    default:
      return const Icon(Icons.email, color: Colors.grey);
  }
}

Future<void> _launchEmailApp(EmailApp app, BuildContext context) async {
  try {
    final Uri uri = Uri.parse(app.scheme);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        _showErrorDialog(context, 'Não foi possível abrir ${app.name}');
      }
    }
  } catch (e) {
    if (context.mounted) {
      _showErrorDialog(context, 'Erro ao tentar abrir ${app.name}');
    }
  }
}

void _showNoMailAppsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Nenhum aplicativo de email encontrado"),
        content: const Text(
            "Não foi possível encontrar aplicativos de email instalados. "
            "Por favor, instale um aplicativo de email."),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}

void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Erro"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}

class EmailApp {
  final String name;
  final String scheme;

  EmailApp(this.name, this.scheme);
}
