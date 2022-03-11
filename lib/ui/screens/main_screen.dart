import 'package:flutter/material.dart';
import 'package:pokemon/data/Pokemon_repository.dart';
import 'package:pokemon/data/models/models.dart';
import 'package:pokemon/ui/screens/pokemon_details.dart';
import 'package:pokemon/ui/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 3,
        title: Text(
            'Pokemon App'
        ),
      ),
      extendBodyBehindAppBar: false,
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: double.infinity,
            child: _buildPokemonLoader(context),
          ),
        ),
      ),
    );
  }

  Widget _buildPokemonLoader(BuildContext context) {
    final repository = Provider.of<PokemonRepository>(context, listen: false);
    repository.firstFecth();
    return StreamBuilder<List<Pokemon>>(
        stream: repository.watchAllPokemon(),
        builder: (context, AsyncSnapshot<List<Pokemon>> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final pokemons = snapshot.data ?? [];
            return _buildRecipeList(context, pokemons);
          } else {
            return Container(
              height: 40.0,
              child: Center(
                child: Text('Loading Data', style: TextStyle(
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,

                ),),
              ),
            );
          }
        });
  }

  Widget _buildRecipeList(BuildContext recipeListContext, List<Pokemon> pokemons) {
    final size = MediaQuery.of(context).size;
    const itemHeight = 310;
    final itemWidth = size.width / 2;
    return Flexible(
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemCount: pokemons.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildPokemonCard(recipeListContext, pokemons, index);
        },
      ),
    );
  }

  Widget _buildPokemonCard(
      BuildContext topLevelContext, List<Pokemon> pokemons, int index) {
    final pokemon = pokemons[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(topLevelContext, MaterialPageRoute(
          builder: (context) {
            return Details(pokemon: pokemon);
          },
        ));
      },
      child: PokemonCard(pokemon),
    );
  }
}
