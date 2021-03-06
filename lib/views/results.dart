import "package:flutter/material.dart";
import 'package:quizapp/helpers/constants.dart';
import 'package:quizapp/views/seasons_list.dart';
import 'package:quizapp/widgets/widgets.dart';

class Results extends StatefulWidget {
  final int correct, incorrect, total;
  final String message;

  const Results({
    Key key,
    @required this.correct,
    @required this.incorrect,
    @required this.total,
    @required this.message,
  }) : super(key: key);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: MAIN_COLOR,
        onPressed: () async {
          await Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SeasonsList()));
        },
        child: const Icon(
          Icons.arrow_back,
          color: SECONDARY_COLOR,
        ),
      ),
      backgroundColor: SECONDARY_COLOR,
      appBar: AppBar(
          title: appBar(context),
          centerTitle: true,
          backgroundColor: MAIN_COLOR,
          elevation: 0,
          brightness: Brightness.light),
      // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text("You got: ${widget.correct}/${widget.total}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "You answered ${widget.correct} answers correctly and ${widget.incorrect} answers incorrectly. \n${widget.total - (widget.correct + widget.incorrect)} questions left unanswered.",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.message,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Image(
              image: AssetImage(
                'assets/naruto_young.png',
              ),
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}
