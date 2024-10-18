import 'dart:collection';
import 'dart:developer';

import 'package:device_calendar/device_calendar.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/services/prefs.dart';

class DeviceCalendarService {
  static final DeviceCalendarPlugin _deviceCalendarPlugin =
      DeviceCalendarPlugin();

  // Request Permissions
  static Future<void> requestPermissions() async {
    final permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
    if (permissionsGranted.isSuccess && permissionsGranted.data == true) {
      log('Permissions granted');
    }
  }

  // Retrieve calendars
  static Future<void> retrieveCalendars() async {
    final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
    if (calendarsResult.isSuccess) {
      UnmodifiableListView<Calendar>? calendars = calendarsResult.data;
      if (calendars?.isEmpty ?? false) {
        log('No calendars available');
      } else {
        calendars!.toList().forEach((calendar) {
          log('Calendar ID: ${calendar.id}, Name: ${calendar.name}');
        });
      }
    } else {
      log('Failed to retrieve calendars');
    }
  }

// Retrieve First Calendar
  static Future<void> retrieveFirstCalendar() async {
    final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
    if (calendarsResult.isSuccess) {
      UnmodifiableListView<Calendar>? calendars = calendarsResult.data;
      if (calendars?.isEmpty ?? false) {
        print('No calendars available');
      } else {
        String calendarId = calendars!.first.id!;
        log('Calendar ID: $calendarId');
        Prefs.setString(kCalendarId, calendarId);
      }
    } else {
      print('Failed to retrieve calendars');
    }
  }

// Create Event in Calendar
  static Future<void> createEvent({
    required String title,
    required String description,
    required DateTime endDate,
  }) async {
    final String calendarId = Prefs.getString(kCalendarId).isEmpty
        ? '1'
        : Prefs.getString(kCalendarId);

    final event = Event(
      calendarId,
      title: title,
      description: description,
      start: tz.TZDateTime.from(endDate, tz.local)
          .subtract(const Duration(minutes: 1)),
      end: tz.TZDateTime.from(endDate, tz.local),
    );
    final createEventResult =
        await _deviceCalendarPlugin.createOrUpdateEvent(event);
    if (createEventResult?.isSuccess ?? false) {
      log('Event created: ${createEventResult!.data}');
    } else {
      log(createEventResult!.errors.first.errorMessage);
    }
  }
}
