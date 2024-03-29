import 'package:flutter/material.dart';
import 'package:fitness_homework/home_page.dart';
import 'package:fitness_homework/model_class.dart';
import 'package:fitness_homework/third_page.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SecondPage extends StatefulWidget {
 const SecondPage({Key? key, this.exercise}) : super(key: key);

 final Exercise? exercise;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int second = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fitness App"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.network(
            "${widget.exercise!.thumbnail}",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SleekCircularSlider(
                  min: 0,
                  max: 20,
                  initialValue: second.toDouble(),
                  onChange: (double value) {
                    setState(() {
                      second = value.toInt();
                    });
                  },
                  innerWidget: (double value) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(second.toStringAsFixed(0),
                              style: myStyle(35, Colors.orange, FontWeight.w700),),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ThirdPage(
                                    exercise: widget.exercise,
                                    second: second ,
                                  )));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink),
                            child: Column(
                              children: [
                                Text("Start", style: myStyle(14, Colors.white),),
                                Text("Workout",style: myStyle(14, Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );

                  },
                ),
              ],
            ),
          ),
          Center(
            child: Positioned(

                child: Text("${widget.exercise!.title}", style: myStyle(25, Colors.white, FontWeight.w700),)),
          ),
        ],
      ),
    );
  }
}
