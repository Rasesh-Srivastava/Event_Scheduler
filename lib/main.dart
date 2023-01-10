import 'package:event_scheduler/new_event.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(const MyApp());
List<String> _list = [];
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[300],
        appBar: AppBar(
        title: const Text('Event Scheduler'),
        backgroundColor: Colors.green[800],
        centerTitle: true,
        ),
        body: TODOApp(),
        floatingActionButton: Builder(
            builder: (context) {
              return FloatingActionButton(
                onPressed: () async{
                  final newText = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewEventScreen())) as List<String>;
                  setState(() {
                    _list.add('Date: ${newText[1]} \nTime: ${newText[2]} \nEvent: ${newText[0]}');
                  });
                },
                backgroundColor: Colors.green[800],
                child: const Icon(Icons.add),
              );
            }
        ),
      ),
    );
  }
}
class TODOApp extends StatefulWidget {
  const TODOApp({Key? key}) : super(key: key);

  @override
  _TODOAppState createState() => _TODOAppState();
}

class _TODOAppState extends State<TODOApp> {

  bool _isLoading = false;

  _saveList(list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList("key", list);

    return true;
  }
  _getSavedList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("key") != null) {
      _list = prefs.getStringList("key")!;
    }
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    _getSavedList();

    setState(() {
      _isLoading = false;
    });
  }
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Are you sure?',style: TextStyle(fontWeight: FontWeight.bold),),
            content: const Text('Do you want to exit the App?'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[300],
                  foregroundColor: Colors.green[800],
                ),
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  _saveList(_list);
                  Navigator.of(context).pop(true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[300],
                  foregroundColor: Colors.red.shade800,
                ),
                child: const Text('Yes'),
              ),
            ],
          ),
    )) ??
        false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: _list.length,
          separatorBuilder: (context, index) => const SizedBox(height: 30),
          itemBuilder: (context, index) {
            final text = _list[index];
            return Dismissible(key: UniqueKey(),
              onDismissed: (direction) {
                setState(() {
                  _list.removeAt(index);
                });
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                  content: Text('Event deleted'),
                )
                );
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: const Icon(Icons.delete),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: const Icon(Icons.delete),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(text,
                    style: const TextStyle(color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
