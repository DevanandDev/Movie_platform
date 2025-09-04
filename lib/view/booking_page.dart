import 'package:flutter/material.dart';
import 'package:movie/model/model.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key,required this.movie});
  final MovieModel movie;

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  
late  TextEditingController title =TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = TextEditingController(text: widget.movie.title);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Movie',style: TextStyle(fontWeight: FontWeight.bold),),
            TextField(
              controller: title,
              decoration: InputDecoration(
                border: OutlineInputBorder(            
                ),
              ),
            ),
             Text('Movie',style: TextStyle(fontWeight: FontWeight.bold),),
              TextField(
              controller: title,
              decoration: InputDecoration(
                border: OutlineInputBorder(            
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}