import 'package:flutter/material.dart';
import 'package:movie/controller/provider.dart';
import 'package:movie/view/details_page.dart';
import 'package:provider/provider.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search movies...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (query) {
                provider.searchMovies(query);
              },
            ),
          ),SizedBox(height: 15,),
          Text(
            "All Movies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),SizedBox(height: 15,),
          Expanded(
            child:
                provider.isload
                    ? Center(child: CircularProgressIndicator())
                    : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: provider.searchedMovies.length,
                      itemBuilder: (context, index) {
                        final movie = provider.searchedMovies[index];
                        return Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: GestureDetector(
                                  onTap:
                                      () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (ctx) => MyDetails(movie: movie),
                                        ),
                                      ),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Text(movie.title)),
                          ],
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
