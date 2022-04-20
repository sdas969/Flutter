import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:local_notification/objectbox.dart';
import 'package:local_notification/schema.dart';

class Add30MinNote extends StatefulWidget {
  const Add30MinNote({Key? key}) : super(key: key);

  @override
  State<Add30MinNote> createState() => _Add30MinNoteState();
}

class _Add30MinNoteState extends State<Add30MinNote> {
  late TextEditingController _textEditingController;
  late TextEditingController _numberEditingController;
  String value = 'Seconds';
  DateTime? date;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _numberEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _numberEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Material(
                          elevation: 20,
                          borderRadius: BorderRadius.circular(20),
                          child: TextField(
                            controller: _textEditingController,
                            maxLength: 140,
                            maxLines: 8,
                            decoration: InputDecoration(
                                hintText:
                                    'Enter Text to be shown in notification.',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                                filled: true,
                                fillColor: Colors.grey.shade900,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                            minWidth: double.infinity,
                            child: date == null
                                ? const Text(
                                    'Choose Date',
                                    style: TextStyle(fontSize: 20),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        date!.toString().split(' ')[0],
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(Icons.edit)
                                    ],
                                  ),
                            padding: const EdgeInsets.all(16),
                            elevation: 20,
                            color: Colors.blueGrey.shade900,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () async {
                              var recievedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                initialDate: DateTime.now(),
                                lastDate: DateTime(2025),
                              );
                              if (recievedDate != null) {
                                setState(() {
                                  date = recievedDate;
                                });
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                            minWidth: double.infinity,
                            child: startTime == null
                                ? const Text(
                                    'Choose Start Time',
                                    style: TextStyle(fontSize: 20),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        startTime!.format(context),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(Icons.edit)
                                    ],
                                  ),
                            padding: const EdgeInsets.all(16),
                            elevation: 20,
                            color: Colors.blueGrey.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () async {
                              var recievedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );

                              if (recievedTime != null) {
                                setState(() {
                                  startTime = recievedTime;
                                });
                                print(recievedTime);
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                            minWidth: double.infinity,
                            child: endTime == null
                                ? const Text(
                                    'Choose End Time',
                                    style: TextStyle(fontSize: 20),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        endTime!.format(context),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(Icons.edit)
                                    ],
                                  ),
                            padding: const EdgeInsets.all(16),
                            elevation: 20,
                            color: Colors.blueGrey.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () async {
                              var recievedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );

                              if (recievedTime != null) {
                                setState(() {
                                  endTime = recievedTime;
                                });
                                print(recievedTime);
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MaterialButton(
                  elevation: 20,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.all(16),
                  onPressed: () {
                    objectbox.store.box<Note>().put(Note(
                        text: _textEditingController.text,
                        unit: value,
                        endTime: endTime!.format(context),
                        startTime: startTime!.format(context),
                        date: date!,
                        interval: int.parse(_numberEditingController.text)));
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.indigo.shade900,
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
