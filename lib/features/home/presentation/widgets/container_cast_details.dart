import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movie_details_response.dart' show Cast;

class ContainerCastDetails extends StatelessWidget {
  final Cast castMember;

  const ContainerCastDetails({super.key, required this.castMember});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff282A28),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: EdgeInsets.all(15),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: castMember.urlSmallImage!,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),

        title: Text(
          castMember.name ?? 'Unknown Actor',
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          castMember.characterName ?? '',
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class CastMember {}
