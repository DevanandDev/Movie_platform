import 'package:flutter/material.dart';
import 'package:movie/model/model.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key,required this.movie});
  final MovieModel movie;

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  
  TextEditingController title =TextEditingController();
  TextEditingController lang =TextEditingController();
  TextEditingController releas =TextEditingController();
  TextEditingController media =TextEditingController();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = TextEditingController(text: widget.movie.title);
    lang = TextEditingController(text: widget.movie.originalLanguage);
    releas = TextEditingController(text: widget.movie.releaseDate);
    media = TextEditingController(text: widget.movie.voteCount.toString());

  
  }
  void bookMovie() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Booking Successful!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
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
             Text('Language',style: TextStyle(fontWeight: FontWeight.bold),),
              TextField(
              controller: lang,
              decoration: InputDecoration(
                border: OutlineInputBorder(            
                ),
              ),
            ),
             Text('Released',style: TextStyle(fontWeight: FontWeight.bold),),
              TextField(
              controller: releas,
              decoration: InputDecoration(
                border: OutlineInputBorder(            
                ),
              ),
            ),
             Text('Popularity',style: TextStyle(fontWeight: FontWeight.bold),),
              TextField(
              controller: media,
              decoration: InputDecoration(
                border: OutlineInputBorder(            
                ),
              ),
            ),SizedBox(height: 20,),
             Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 GestureDetector(
                  onTap: () =>bookMovie() ,
                   child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12), 
                    ),
                    child: Center(
                      child: Text(
                        'Book Your Ticket',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                               ),
                 ),
               ],
             ),
          ],
        ),
      ),
    );
  }
}