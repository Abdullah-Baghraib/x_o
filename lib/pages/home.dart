import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool Xtrue = true; // first plyer is X
  int XScore = 0;
  int OScore = 0;
  int drow = 0;
  int filedBoxs = 0;

  static var myNewFont = GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.black , letterSpacing: 3)) ;
  static var myNewFontWhite = GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.white , letterSpacing: 3 , fontSize: 10)) ;

  List<String> x_o = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  void _Tapped(int i) 
  {

    setState(() 
    {
      if (Xtrue && x_o[i] == "") 
      {
        x_o[i] = "X";
        filedBoxs++;
      } 
      else if (!Xtrue && x_o[i] == "") 
      {
        x_o[i] = "O";
        filedBoxs++;
      }

      Xtrue = !Xtrue;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if ((x_o[0] == x_o[1]) && (x_o[0] == x_o[2]) && (x_o[0] != "")) {
      _showWinDialog(x_o[0]);
    }

    if ((x_o[3] == x_o[4]) && (x_o[3] == x_o[5]) && (x_o[3] != "")) {
      _showWinDialog(x_o[3]);
    }

    if ((x_o[6] == x_o[7]) && (x_o[6] == x_o[8]) && (x_o[6] != "")) {
      _showWinDialog(x_o[6]);
    }

    if ((x_o[0] == x_o[3]) && (x_o[0] == x_o[6]) && (x_o[0] != "")) {
      _showWinDialog(x_o[0]);
    }

    if ((x_o[1] == x_o[4]) && (x_o[1] == x_o[7]) && (x_o[1] != "")) {
      _showWinDialog(x_o[1]);
    }

    if ((x_o[2] == x_o[5]) && (x_o[2] == x_o[8]) && (x_o[2] != "")) {
      _showWinDialog(x_o[2]);
    }

    if ((x_o[6] == x_o[4]) && (x_o[6] == x_o[2]) && (x_o[6] != "")) {
      _showWinDialog(x_o[6]);
    }

    if ((x_o[0] == x_o[4]) && (x_o[0] == x_o[8]) && (x_o[0] != "")) {
      _showWinDialog(x_o[0]);
    }

    else if (filedBoxs == 9)
    {
      _showDrowDialog();
      setState(() {
        drow++;
      });
    }
  }

  void _showWinDialog(String winner) 
  {
    showDialog
    (
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog
        (
          
          title: const Text('Game Over'),
          content: Text('Player ${winner} wins!'),
          actions: <Widget>[
            TextButton(
              onPressed: () 
              {
                _clearBoored();
                Navigator.pop(context);
              } ,
              child: const Text('Play Again'),
            )
          ],
        );
      },
    );

    if(winner == "X")
    {
      XScore++;
    }
    else if (winner == "O")
    {
      OScore++;
    }
  }

  void _clearBoored()
  {
    setState(() {
      for(int i =  0 ; i<9 ; i++)
      {
        x_o[i]="";
      }
    });
    filedBoxs = 0;
  }

  void _showDrowDialog()
  {
    showDialog
    (
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog
        (
          
          title: const Text('Game Over'),
          content: const Text('Draw'),
          actions: <Widget>[
            TextButton(
              onPressed: () 
              {
                _clearBoored();
                Navigator.pop(context);
              } ,
              child: const Text('Play Again'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 28),
                      child: Text
                      (
                        "S C O R E B O A R D",
                        style: myNewFontWhite
                      )
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Player X",
                              style: myNewFontWhite),
                          const SizedBox(height: 10),
                          Text("${XScore.toString()}",
                              style: myNewFontWhite),
                        ],
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Player O",
                            style: myNewFontWhite),
                          const SizedBox(height: 10),
                          Text("${OScore.toString()}",
                              style: myNewFontWhite)
                        ],
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Draw",
                              style: myNewFontWhite),
                          const SizedBox(height: 10),
                          Text("${drow.toString()}",
                              style: myNewFontWhite
                                  ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _Tapped(index);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[700]!)),
                          child: Center(
                            child: Text(
                              "${x_o[index]}",
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          )),
                    );
                  },
                ),
              ),
            ),
            Expanded
            (
                child: Container
                (
                )
            ),
          ],
        ));
  }
}
