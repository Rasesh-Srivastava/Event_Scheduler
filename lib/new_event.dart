import 'package:flutter/material.dart';
// import 'package:event_scheduler/main.dart';
class NewEventScreen extends StatefulWidget {
  @override
  State<NewEventScreen> createState() => _NewEventScreenState();
}
class _NewEventScreenState extends State<NewEventScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingControllerDate = TextEditingController();
  final TextEditingController _textEditingControllerTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        title: const Text('New Event'),
        backgroundColor: Colors.deepPurple[700],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                Flexible(
                  child: SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _textEditingControllerDate,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.calendar_month_sharp),
                        prefixIconColor: Colors.black,
                        labelText: 'Date',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.deepPurple[700]??Colors.purple),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.deepPurple[700]??Colors.purple),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.deepPurple[700]??Colors.purple),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.deepPurple[700]??Colors.purple),
                        ),
                        focusColor:Colors.deepPurple[700],iconColor: Colors.white,
                        filled: true,
                        fillColor: Colors.deepPurple[700],
                        contentPadding: const EdgeInsets.symmetric(vertical: 30),
                      ),
                      style: const TextStyle(color: Colors.white,fontSize: 18),
                      maxLines: 5,
                      minLines: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Flexible(
                  child: SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _textEditingControllerTime,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.watch_later_rounded),
                        prefixIconColor: Colors.black,
                        labelText: 'Time',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.deepPurple[700]??Colors.purple),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.deepPurple[700]??Colors.purple),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.deepPurple[700]??Colors.purple),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.deepPurple[700]??Colors.purple),
                        ),
                        focusColor:Colors.deepPurple[700],iconColor: Colors.white,
                        filled: true,
                        fillColor: Colors.deepPurple[700],
                        contentPadding: const EdgeInsets.symmetric(vertical: 30),
                      ),
                      style: const TextStyle(color: Colors.white,fontSize: 18),
                      maxLines: 5,
                      minLines: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Flexible(
                  child: SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.edit),
                        prefixIconColor: Colors.black,
                        labelText: 'Event Description',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.deepPurple[700]??Colors.purple),
                      ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.deepPurple[700]??Colors.purple),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.deepPurple[700]??Colors.purple),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: Colors.deepPurple[700]??Colors.purple),
                        ),
                        focusColor:Colors.deepPurple[700],iconColor: Colors.white,
                        filled: true,
                        fillColor: Colors.deepPurple[700],
                        contentPadding: const EdgeInsets.symmetric(vertical: 30),
                    ),
                      style: const TextStyle(color: Colors.white,fontSize: 18),
                      maxLines: 5,
                      minLines: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Builder(
                  builder: (context) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.deepPurple[100],
                        minimumSize: const Size(360,38),
                        shape: const StadiumBorder(),
                      ),
                      //   style: ButtonStyle(
                      //     backgroundColor: Colors.deepPurple[100],
                      //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(18),
                      //     ))
                      //   ),
                        onPressed: () {
                      List<String> newEventText = [
                        _textEditingController.text,
                         _textEditingControllerDate.text,
                        _textEditingControllerTime.text,
                      ];
                      Navigator.of(context).pop(newEventText);
                    },
                        child: const Text('ADD',
                        style: TextStyle(color: Colors.white,fontSize: 20),
                        )
                    );
                  }
                )
              ],
        ),
      ),
    );
  }
}
