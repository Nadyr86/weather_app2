
import 'package:flutter/material.dart';

class CityPage extends StatelessWidget {
  CityPage({Key? key}) : super(key: key);

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Find by city'.toUpperCase()),
        centerTitle: true,
      ),
      body: Container(
        height: _size.height,
        width: _size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: textController,
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Write your city',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                OutlinedButton(
                  style: outlineButtonStyle,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context, textController.text);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 30.0),
                    child: const Text(
                      'Show weather',
                      style: TextStyle(color: Colors.black, fontSize: 35.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
