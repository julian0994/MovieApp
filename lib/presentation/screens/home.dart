import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/data/providers/movies_provider.dart';
import 'package:movieapp/data/providers/search_provider.dart';
import 'package:movieapp/data/providers/theme_provider.dart';
import 'package:movieapp/presentation/widgets/movie_card.dart';


class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>{
  final ScrollController _scrollController=ScrollController();

  @override
  void initState(){
    super.initState();
    _scrollController.addListener(_onScroll);
    
    WidgetsBinding.instance.addPostFrameCallback((_){
      ref.read(moviesProvider.notifier).loadMovies();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll(){
    if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
      ref.read(moviesProvider.notifier).loadMovies();
    }
  }

  @override
  Widget build(BuildContext context) {


    final themeMode = ref.watch(themeProvider);
    final moviesState= ref.watch(moviesProvider);//1 Get the current state of moviesProvider and listen for changes
    final search=ref.watch(searchProvider);
    final searchvisible=ref.watch(searchVisibilityProvider);

    final filteredmovies=search.isEmpty
        ?moviesState.movies:
        moviesState.movies.where((movie){
          return movie.title.toLowerCase().contains(search.toLowerCase());
        }).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title:
        Row(children: [
          Image.asset('assets/images/IconMovieSF.png',height: 30,width: 30,),
          const Text(" Movie App"),

        ],),


      actions: [
        IconButton(onPressed: (){
          ref.read(searchProvider.notifier).state='';
          ref.read(searchVisibilityProvider.notifier).state=!searchvisible;
        }, icon: const Icon(Icons.search)),

        IconButton(onPressed: (){
          ref.read(themeProvider.notifier).changeTheme();
        }, icon:
        themeMode == ThemeMode.light ?
        const Icon(Icons.dark_mode):
        const Icon(Icons.light_mode))
      ],
      bottom:
      searchvisible?
      PreferredSize(preferredSize: Size.fromHeight(60), child:

        Padding(padding: EdgeInsets.all(10),
        child:
            TextField(
              decoration: InputDecoration(
                hintText: 'Search movies',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none
                )
              ),
              onChanged: (value){
                ref.read(searchProvider.notifier).state=value;
              },
            )

        )
    ):null,),
      body:

       ListView.builder(
         controller: _scrollController,
         itemCount: filteredmovies.length +1,
         itemBuilder: (context,index){
           if(index< filteredmovies.length){
             final movie=filteredmovies[index];
             return MovieCard(movie: movie);
           }else{
             return moviesState.isLoading?
                 const Column(
                   children: [
                     SizedBox(height: 25,),
                     Center(
                       child: CircularProgressIndicator(),
                     ),
                   ],
                 ):
                 const SizedBox.shrink();
           }
         },
       ),

    );
  }


}