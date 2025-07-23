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

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:device_calendar/device_calendar.dart' as device_calendar;
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

Future addToCalendar(
  BuildContext context,
  String title,
  DateTime startDate,
  DateTime? endDate,
  String? description,
  String? location,
) async {
  // Add your function code here!

  // Verifica se já tem permissão
  var status = await Permission.calendarWriteOnly.status;

  // Se não tem permissão, solicita primeiro
  if (!status.isGranted) {
    status = await Permission.calendarWriteOnly.request();

    // Se ainda foi negada após solicitar
    if (status.isDenied || status.isPermanentlyDenied) {
      if (context.mounted) {
        _showPermissionDeniedDialog(context, status.isPermanentlyDenied);
      }
      return;
    }
  }

  // Define a data de fim se não foi fornecida (1 hora após o início)
  endDate ??= startDate.add(const Duration(hours: 1));

  // Cria o evento
  final Event event = Event(
    title: title,
    description: description ?? '',
    location: location ?? '',
    startDate: startDate,
    endDate: endDate,
    allDay: false,
  );

  // Inicializa timezone data
  tz_data.initializeTimeZones();

  try {
    // Obtém os calendários disponíveis
    device_calendar.DeviceCalendarPlugin deviceCalendar =
        device_calendar.DeviceCalendarPlugin();
    var calendarsResult = await deviceCalendar.retrieveCalendars();

    if (calendarsResult.isSuccess &&
        calendarsResult.data != null &&
        calendarsResult.data!.isNotEmpty) {
      // Se há múltiplos calendários, mostra dialog para escolher
      if (calendarsResult.data!.length > 1) {
        if (context.mounted) {
          _showCalendarPickerDialog(context, calendarsResult.data!, event);
        }
      } else {
        // Se há apenas um calendário, adiciona diretamente
        if (context.mounted) {
          await _addEventToCalendar(
              context, calendarsResult.data!.first, event);
        }
      }
    } else {
      // Fallback para o método add_2_calendar (abre apps externos)
      await Add2Calendar.addEvent2Cal(event);
      if (context.mounted) {
        _showSuccessDialog(context, "Evento adicionado com sucesso!");
      }
    }
  } catch (e) {
    // Em caso de erro, tenta o método alternativo
    try {
      await Add2Calendar.addEvent2Cal(event);
      if (context.mounted) {
        _showSuccessDialog(context, "Evento adicionado com sucesso!");
      }
    } catch (e2) {
      if (context.mounted) {
        _showErrorDialog(context, "Erro ao adicionar evento: ${e2.toString()}");
      }
    }
  }
}

// Função para adicionar evento a um calendário específico
Future _addEventToCalendar(BuildContext context,
    device_calendar.Calendar calendar, Event event) async {
  device_calendar.DeviceCalendarPlugin deviceCalendar =
      device_calendar.DeviceCalendarPlugin();

  final eventToAdd = device_calendar.Event(calendar.id)
    ..title = event.title
    ..description = event.description
    ..location = event.location
    ..start =
        tz.TZDateTime.from(event.startDate, tz.getLocation('America/Sao_Paulo'))
    ..end =
        tz.TZDateTime.from(event.endDate, tz.getLocation('America/Sao_Paulo'));

  var result = await deviceCalendar.createOrUpdateEvent(eventToAdd);

  if (result?.isSuccess == true) {
    if (context.mounted) {
      _showSuccessDialog(context, "Evento adicionado ao ${calendar.name}!");
    }
  } else {
    if (context.mounted) {
      _showErrorDialog(context, "Erro ao adicionar evento");
    }
  }
}

// Dialog para escolher o calendário
void _showCalendarPickerDialog(BuildContext context,
    List<device_calendar.Calendar> calendars, Event event) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Selecione o calendário"),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: calendars.length,
            itemBuilder: (context, index) {
              final calendar = calendars[index];
              return ListTile(
                leading: Icon(
                  Icons.calendar_today,
                  color: calendar.color != null
                      ? Color(calendar.color!)
                      : FlutterFlowTheme.of(context).primary,
                ),
                title: Text(calendar.name ?? 'Calendário ${index + 1}'),
                subtitle: Text(calendar.accountName ?? ''),
                onTap: () {
                  Navigator.pop(context);
                  _addEventToCalendar(context, calendar, event);
                },
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancelar"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

// Dialog de permissão negada
void _showPermissionDeniedDialog(
    BuildContext context, bool isPermanentlyDenied) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Permissão necessária"),
        content: Text(isPermanentlyDenied
            ? "Para adicionar eventos ao calendário, é necessário conceder permissão. "
                "Vá em Configurações > Privacidade e Segurança > Calendários e habilite para Revoluna."
            : "Para adicionar eventos ao calendário, é necessário conceder permissão de acesso aos calendários."),
        actions: <Widget>[
          if (isPermanentlyDenied)
            TextButton(
              child: const Text("Configurações"),
              onPressed: () {
                Navigator.pop(context);
                openAppSettings();
              },
            ),
          TextButton(
            child: const Text("Cancelar"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

// Dialog de sucesso
void _showSuccessDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Sucesso"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

// Dialog de erro
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
          ),
        ],
      );
    },
  );
}
