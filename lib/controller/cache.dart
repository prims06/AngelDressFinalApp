import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NumberInputWithIncrementDecrement extends StatefulWidget {
  @override
  _NumberInputWithIncrementDecrementState createState() =>
      _NumberInputWithIncrementDecrementState();
}

class _NumberInputWithIncrementDecrementState
    extends State<NumberInputWithIncrementDecrement> {
  // TextEditingController _controller = TextEditingController();
int _controller;

  @override
  void initState() {
    super.initState();
    _controller = 0; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Field increment decrement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            width: 40.0,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Colors.blueGrey,
                width: 2.0,
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 20,
                  // flex: 1,
                  child: Text(_controller.toString(), textAlign: TextAlign.center,),
                ),
                Container(
                  height: 38.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 18.0,
                          ),
                          onTap: () {
                            setState(() {
                              _controller++;
                            });
                          },
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 18.0,
                        ),
                        onTap: () {
                          setState(() {
                                _controller > 0 ? _controller-- : _controller; // decrementing value
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// git init
// git add .
// git commit -m "Depot initial"
// git branch -M main
// git remote add origin https://github.com/prims06/AngelDressFinalApp.git
// git push -u origin main

//  git config --global user.email "primsidriss@gmail.com"
//   git config --global user.name "prims06"
