// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    super.key,
    this.width,
    this.height,
    this.events,
    this.weekViewEnabled = false,
    this.openVagas,
    this.announcedVagas,
    this.callback,
  });

  final double? width;
  final double? height;
  final List<DateTime>? events;
  final bool weekViewEnabled;
  final List<DateTime>? openVagas;
  final List<DateTime>? announcedVagas;
  final Future Function()? callback;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();

  // Static method to access widget state from outside
  static DateTime? getSelectedDate(BuildContext context) {
    final state = context.findAncestorStateOfType<_CustomCalendarState>();
    return state?.selectedDate;
  }
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Set<DateTime>? _cachedOpenVagasDates;
  Set<DateTime>? _cachedAnnouncedVagasDates;

  @override
  void initState() {
    super.initState();
    // Initialize selectedDay to now()
    _selectedDay = DateTime.now();
  }

  // Getter to expose selected date
  DateTime get selectedDate => _selectedDay ?? DateTime.now();

  // Function to update app state
  void _updatePageState(DateTime selectedDate) {
    // Remove timezone info and normalize to local midnight
    final normalizedDate =
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day);

    // Update FFAppState with forced rebuild
    FFAppState().update(() {
      FFAppState().selectedDay = normalizedDate;
    });
  }

  // Process events to create a set of dates with approved events
  Set<DateTime> _getEventsForDay() {
    Set<DateTime> eventDates = {};

    if (widget.events != null) {
      for (var date in widget.events!) {
        // Normalize to midnight for consistent comparison
        final normalizedDate = DateTime(date.year, date.month, date.day);
        eventDates.add(normalizedDate);
      }
    }

    return eventDates;
  }

  // Get events for a specific day (returns empty list for TableCalendar compatibility)
  List<DateTime> _getEventsForDate(DateTime day) {
    final eventDates = _getEventsForDay();
    final normalizedDay = DateTime(day.year, day.month, day.day);
    return eventDates.contains(normalizedDay) ? [normalizedDay] : [];
  }

  // Get set of dates with open vagas (cached)
  Set<DateTime> _getOpenVagasDates() {
    if (_cachedOpenVagasDates != null) {
      return _cachedOpenVagasDates!;
    }

    Set<DateTime> openDates = {};
    if (widget.openVagas != null) {
      for (var date in widget.openVagas!) {
        // Normalize to midnight for consistent comparison
        final normalizedDate = DateTime(date.year, date.month, date.day);
        openDates.add(normalizedDate);
      }
    }

    _cachedOpenVagasDates = openDates;
    return openDates;
  }

  // Get set of dates with announced vagas (cached)
  Set<DateTime> _getAnnouncedVagasDates() {
    if (_cachedAnnouncedVagasDates != null) {
      return _cachedAnnouncedVagasDates!;
    }

    Set<DateTime> announcedDates = {};
    if (widget.announcedVagas != null) {
      for (var date in widget.announcedVagas!) {
        // Normalize to midnight for consistent comparison
        final normalizedDate = DateTime(date.year, date.month, date.day);
        announcedDates.add(normalizedDate);
      }
    }

    _cachedAnnouncedVagasDates = announcedDates;
    return announcedDates;
  }

  @override
  Widget build(BuildContext context) {
    // Clear cache when widget rebuilds with new data
    _cachedOpenVagasDates = null;
    _cachedAnnouncedVagasDates = null;

    return SizedBox(
      width: widget.width ?? double.infinity,
      child: TableCalendar<DateTime>(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat:
            widget.weekViewEnabled ? CalendarFormat.week : CalendarFormat.month,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        eventLoader: _getEventsForDate,
        startingDayOfWeek: StartingDayOfWeek.monday,
        locale: 'pt_BR',
        availableCalendarFormats: widget.weekViewEnabled
            ? const {
                CalendarFormat.week: 'Week',
              }
            : const {
                CalendarFormat.month: 'Month',
              },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });

          // Try to update page state if it exists
          _updatePageState(selectedDay);

          // Call the callback if provided
          if (widget.callback != null) {
            widget.callback!();
          }
        },
        onPageChanged: (focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
        },
        // Custom marker builder for event indicators
        calendarBuilders: CalendarBuilders<DateTime>(
          markerBuilder: (context, day, events) {
            final openVagasDates = _getOpenVagasDates();
            final announcedVagasDates = _getAnnouncedVagasDates();
            final normalizedDay = DateTime(day.year, day.month, day.day);

            List<Widget> markers = [];

            // Check for approved events (primary color - existing marker)
            if (events.isNotEmpty) {
              markers.add(
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }

            // Check for open vagas (9feb0f - green marker)
            if (openVagasDates.contains(normalizedDay)) {
              markers.add(
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF9feb0f),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }

            // Check for announced vagas (F0D24B - yellow marker)
            if (announcedVagasDates.contains(normalizedDay)) {
              markers.add(
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF0D24B),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }

            if (markers.isEmpty) return null;

            return Positioned(
              bottom: 1,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: markers.asMap().entries.map((entry) {
                  final index = entry.key;
                  final marker = entry.value;
                  return Container(
                    margin: EdgeInsets.only(left: index > 0 ? 2 : 0),
                    child: marker,
                  );
                }).toList(),
              ),
            );
          },
        ),
        // Styling
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primary,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: FlutterFlowTheme.of(context).primary,
          ),
          titleTextStyle: FlutterFlowTheme.of(context).titleMedium,
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: FlutterFlowTheme.of(context).titleSmall.override(
                lineHeight: 1.0,
              ),
          weekendStyle: FlutterFlowTheme.of(context).titleSmall.override(
                lineHeight: 1.0,
              ),
        ),
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          outsideTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                color: FlutterFlowTheme.of(context).accent2,
              ),
          weekendTextStyle: FlutterFlowTheme.of(context).bodyMedium,
          holidayTextStyle: FlutterFlowTheme.of(context).bodyMedium,
          defaultTextStyle: FlutterFlowTheme.of(context).bodyMedium,
          selectedTextStyle: FlutterFlowTheme.of(context).titleSmall.override(
                color: Colors.white,
              ),
          todayTextStyle: FlutterFlowTheme.of(context).bodyMedium,
          disabledTextStyle: FlutterFlowTheme.of(context).bodyMedium,
          selectedDecoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary.withValues(alpha: 0.3),
            shape: BoxShape.circle,
          ),
          // Reduce circle sizes by adding margin around cells
          cellMargin: const EdgeInsets.all(10.0),
          markersMaxCount: 1,
          canMarkersOverflow: false,
        ),
      ),
    );
  }
}
