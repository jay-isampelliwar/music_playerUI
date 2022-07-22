import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicPlayerScreen(),
    ),
  );
}

class MusicPlayerScreen extends StatefulWidget {
  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  Color? primeColor = Colors.deepPurpleAccent[100];
  Color? secondColor = Colors.grey[400];

  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: const [0.8, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black26,
            Colors.deepPurpleAccent[100]!,
          ],
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: primeColor,
              size: 25,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://i.scdn.co/image/ab67616d0000b273a3eff72f62782fb589a492f9",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Blinding Lights",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: secondColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "The Weeknd",
                style: TextStyle(
                    color: secondColor!.withOpacity(0.7), fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _currentValue.toStringAsFixed(2),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: primeColor),
                    ),
                    Text(
                      "3.20",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: secondColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Slider(
                  min: 0,
                  max: 3.20,
                  value: _currentValue,
                  activeColor: primeColor,
                  inactiveColor: secondColor,
                  thumbColor: Colors.deepPurpleAccent,
                  onChanged: (value) {
                    setState(() {
                      _currentValue = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buttonContainer(
                    50,
                    50,
                    const Icon(
                      Icons.skip_previous_rounded,
                      size: 30,
                    ),
                  ),
                  _buttonContainer(
                    70,
                    70,
                    const Icon(
                      Icons.pause,
                      size: 40,
                    ),
                  ),
                  _buttonContainer(
                    50,
                    50,
                    const Icon(
                      Icons.skip_next_rounded,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.repeat,
                    size: 30,
                    color: secondColor,
                  ),
                  const Icon(
                    Icons.favorite,
                    size: 40,
                    color: Colors.red,
                  ),
                  Icon(
                    Icons.shuffle,
                    size: 30,
                    color: secondColor,
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Container _buttonContainer(double height, double width, Icon icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primeColor,
      ),
      height: height,
      width: width,
      child: Center(
        child: icon,
      ),
    );
  }
}
