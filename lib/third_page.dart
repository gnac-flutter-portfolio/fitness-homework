import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fitness_homework/home_page.dart';
import 'package:fitness_homework/model_class.dart';
import 'package:fitness_homework/widget.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key, this.exercise,this.second});

  final Exercise? exercise;
  final int? second;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late Timer timer;
  int startSound = 0;
  @override
  initState() {
    // TO DO: implement initState
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //var dec = widget.second !-1;
      if (timer.tick == widget.second) {
        timer.cancel();
        setState(() {

          showToast("Workout Successfully Completed");
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pop();
          });
        });
      }
      setState(() {
        startSound = timer.tick;
      });
    });

    super.initState();
  }
  
  @override
  void dispose() {
    // TO DO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0C23).withOpacity(0.7),
      appBar: AppBar(
        title: const Text("Fitness App"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          //Image.network("${widget.exercise!.gif}", height: double.infinity,),
          CachedNetworkImage(
            width: double.infinity,
            imageUrl: "${widget.exercise!.gif}",
            //fit: BoxFit.cover,
            height: double.infinity,
            placeholder: (context, url) => spinkit,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Positioned(
              top: 60,
              left: 20,
              right: 20,
              child: Center(child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange,
                     boxShadow: [BoxShadow(
                        offset: Offset.fromDirection(2.0, 4.0),
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.6),
                      ),],),
                    child: Text("$startSound",style: myStyle(40, Colors.white, FontWeight.w600)),
                  ),
                  Text("Timer On", style: myStyle(25, Colors.white, FontWeight.w600)),
                ],
              ),
              //Text("$startSound"),
    )),
          Positioned(
            left: 0,
              right: 0,
              bottom: 100,
              child: Center(child: Text("${widget.exercise!.title}",style: myStyle(25, Colors.white, FontWeight.w700)))),
        ],
      ),
    );
  }
}
