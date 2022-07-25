// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import './utils.dart';

class TableEventsExample extends StatefulWidget {
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  final _now = DateTime.now();
  late DateTime _focusedDay; // 마우스 포커스
  late DateTime? _selectedDay; // 현재일

  @override
  void initState() {
    super.initState();

    _focusedDay = DateTime(_now.year, _now.month, _now.day); // 현재일자
    _selectedDay = _focusedDay;

    print('init _selectedDay $_selectedDay');
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));

    // EventSource 출력
    kEvents.forEach((key, value) {
      print('[KEY] $key, [VALUE] $value');
    });

    //kEvents.toString();
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    bool _issmame = isSameDay(_selectedDay, selectedDay);
    print(
        '_selectedDay:$_selectedDay, selectedDay:$selectedDay, _issmae:$_issmame');
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      DateTime _tmp = DateTime(
          selectedDay.year, selectedDay.month, selectedDay.day); // 현재일자
      _selectedEvents.value = _getEventsForDay(_tmp);
      print(_selectedEvents.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            //rangeStartDay: _rangeStart,
            //rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            //rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
