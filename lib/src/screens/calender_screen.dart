import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final EventController _eventController = EventController();

  @override
  void initState() {
    super.initState();
    // Adding sample events
    _eventController.addAll([
      CalendarEventData(
        title: "Team Meeting",
        date: DateTime(2025, 3, 10),
        description: "Discuss project updates",
      ),
      CalendarEventData(
        title: "Doctor Appointment",
        date: DateTime(2025, 3, 15),
        description: "Health checkup",
      ),
      CalendarEventData(
        title: "Conference",
        date: DateTime(2025, 3, 20),
        description: "Tech Conference 2025",
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Full Calendar View")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addEvent(context), // Call add event function
        child: const Icon(Icons.add),
      ),
      body: MonthView(
        controller: _eventController,
        minMonth: DateTime(2025, 1, 1),
        maxMonth: DateTime(2025, 12, 31),
        onCellTap: (events, date) {
          if (events.isNotEmpty) {
            _showEventDialog(context, events);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("No events on ${date.toLocal()}")),
            );
          }
        },
      ),
    );
  }

  // Show event details and provide edit/delete options
  void _showEventDialog(BuildContext context, List<CalendarEventData> events) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Events"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children:
                events.map((event) {
                  return ListTile(
                    title: Text(event.title),
                    subtitle: Text(event.description ?? "No description"),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                        _editEvent(context, event);
                      },
                    ),
                  );
                }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // Function to edit an event
  void _editEvent(BuildContext context, CalendarEventData event) {
    TextEditingController titleController = TextEditingController(
      text: event.title,
    );
    TextEditingController descriptionController = TextEditingController(
      text: event.description,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Event"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Event Title"),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: "Event Description",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _eventController.remove(event); // Remove old event
                  _eventController.add(
                    CalendarEventData(
                      title: titleController.text,
                      date: event.date,
                      description: descriptionController.text,
                    ),
                  ); // Add new updated event
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  // Function to add a new event
  void _addEvent(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Event"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Event Title"),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: "Event Description",
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (pickedDate != null) {
                    selectedDate = pickedDate;
                  }
                },
                child: const Text("Pick Date"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _eventController.add(
                    CalendarEventData(
                      title: titleController.text,
                      date: selectedDate,
                      description: descriptionController.text,
                    ),
                  );
                });
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
