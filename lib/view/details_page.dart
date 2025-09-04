import 'package:flutter/material.dart';
import 'package:movie/model/model.dart';
import 'package:movie/view/booking_page.dart';

class MyDetails extends StatelessWidget {
  const MyDetails({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Text("Title : ${movie.title}"),
          Text("Language : ${movie.originalLanguage}"),
          Text("Release Date : ${movie.releaseDate}"),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx)=> MyBooking(movie: movie))),
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12), 
              ),
              child: Center(
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}
