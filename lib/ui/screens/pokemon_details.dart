import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/data/models/models.dart';

class Details extends StatelessWidget {

  final Pokemon pokemon;
  Details({ required this.pokemon });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 3,
        title: Text(
          '${pokemon.name}'
        ),
      ),
      extendBodyBehindAppBar: false,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: ClipRRect(
                  child: Hero(
                    tag: 'location-img-${pokemon.name}',
                    child: CachedNetworkImage(
                      imageUrl: pokemon.sprite!.frontDefault,
                      height: 300,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  )
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                '#${pokemon.id}\n${pokemon.name}',
                style: TextStyle(
                  color: Colors.grey[600],
                  height: 1.4
                )
              )
            ),
          ],
        ),
      )
    );
  }
}