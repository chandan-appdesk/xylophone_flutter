import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    final player = AudioPlayer();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(child:
        Column(children:
        [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: buildOneByOneButton(Colors.white54, 'xmusic3.wav', 'Music', player),
                ),
                Expanded(
                  flex: 1,
                  child: buildOneByOneButton(Colors.orange, 'x5.wav', 'Music', player),
                ),
                Expanded(
                  flex: 1,
                  child: buildOneByOneButton(Colors.indigoAccent, 'xmusic1.wav', 'Music', player),
                ),
                Expanded(
                  flex: 1,
                  child: buildOneByOneButton(Colors.pinkAccent, 'xmusic2.wav', 'Music', player),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: buildOneByOneButton(Colors.blue, 'ABCD_SONGS.wav', 'ABCD', player),
                ),
                Expanded(
                  flex: 1,
                  child: buildOneByOneButton(Colors.brown, 'baby_shark.wav', 'Baby Shark', player),
                ),
                Expanded(
                  flex: 1,
                  child: buildOneByOneButton(Colors.cyanAccent, 'Chipi_Chipi_Chapa_Chapa_.wav', 'Chipi Chapa', player),
                ),
                Expanded(
                  flex: 1,
                  child: buildOneByOneButton(Colors.amber, 'DoraemonTone.wav', 'Doraemon', player),
                ),
                Expanded(
                  flex: 1,
                  child: buildOneByOneButton(Colors.lightGreen, 'merry_christmus.wav', 'Merry Christmas', player),
                ),
              ],
            ),
          ),

          // MARK: - Third Row {Don't Touch}
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: buildButton(Colors.red, 'note1.wav', ' C\nDo', player),
                  ),
                  Expanded(
                    flex: 1,
                    child: buildButton(Colors.orange, 'note2.wav', ' D\nRe', player),
                  ),
                  Expanded(
                    flex: 1,
                    child: buildButton(Colors.purpleAccent, 'note3.wav', ' E\nMi', player),
                  ),
                  Expanded(
                    flex: 1,
                    child: buildButton(Colors.green, 'note4.wav', ' F\nFa', player),
                  ),
                  Expanded(
                    flex: 1,
                    child: buildButton(Colors.teal, 'note5.wav', ' G\nSol', player),
                  ),
                  Expanded(
                    flex: 1,
                    child: buildButton(Colors.blue, 'note6.wav', ' A\nLa', player),
                  ),
                  Expanded(
                    flex: 1,
                    child: buildButton(Colors.purple, 'note7.wav', ' B\nTi', player),
                  ),
                ],
              )
          ),
        ])),
      ),
    );
  }
}

Widget buildButton(Color color, String soundFile, String buttonName, AudioPlayer oldPlayer) {
  return TextButton(
    onPressed: () {
      oldPlayer.stop();
      final player = AudioPlayer();
      player.play(AssetSource(soundFile));
    },
    onFocusChange: (hasFocus) {
      oldPlayer.stop();
      final player = AudioPlayer();
      player.play(AssetSource(soundFile));
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero, // Minimize padding
      tapTargetSize:
          MaterialTapTargetSize.shrinkWrap, // Minimize the tap target size
    ),
    child: Container(
      color: color,
      width: double.infinity, // Ensure it fills the width
      height: double.infinity, // Ensure it fills the height
      child: Center(
        child: Text(
          buttonName,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    ),
  );
}



Widget buildOneByOneButton(Color color, String soundFile, String buttonName, AudioPlayer player) {
  return TextButton(
    onPressed: () {
      player.stop();
      player.play(AssetSource(soundFile));
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero, // Minimize padding
      tapTargetSize:
      MaterialTapTargetSize.shrinkWrap, // Minimize the tap target size
    ),
    child: Container(
      color: color,
      width: double.infinity, // Ensure it fills the width
      height: double.infinity, // Ensure it fills the height
      child: Center(
        child: Text(
          buttonName,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    ),
  );
}
