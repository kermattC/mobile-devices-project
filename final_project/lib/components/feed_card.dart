import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';

// Is a card that will appear in a feed

/**
 * Will display a feed card with 
 * - owner profile pic
 * - owner name
 * - post name
 * - post content
 * - post image
 * - reactions(TBD)
 */
class FeedCard extends StatefulWidget {
  // owner variables
  final String ownerName;
  final String ownerProfileImageData;

  // post variables
  final String imageData;
  final String postTitle;
  final String postContent;
  final String streetName;

  FeedCard(
    {this.imageData,
    this.ownerProfileImageData,
    this.ownerName,
    this.postTitle,
    this.postContent,
    this.streetName
    });

  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    // Get the data from the db
    CircleAvatar profileImage;
    Widget postImage;
    Widget location;

    if (!widget.ownerProfileImageData.isEmpty) {
      Uint8List _bytesOwnerImage =
          Base64Codec().decode(widget.ownerProfileImageData);
      profileImage = CircleAvatar(
        backgroundImage: MemoryImage(_bytesOwnerImage),
      );
    } else {
      profileImage = CircleAvatar(child: Icon(Icons.person));
    }
    if (!widget.imageData.isEmpty) {
      Uint8List _bytesPostImage = Base64Codec().decode(widget.imageData);
      postImage = Container(
        child: Image.memory(_bytesPostImage),
      );
    } else {
      postImage = Container();
    }
    if (widget.streetName != null){  
      location = Row(
        children: <Widget> [
          Icon(
            Icons.location_on,
            ),
            Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                widget.streetName,
            )
          ),
        ),
      ]
    );
  } else {
    location = Row();
  }

    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: profileImage,
              title: Text(widget.ownerName),
            ),
            Container(
              child: Text(widget.postTitle),
            ),
            location,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.postContent,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            postImage
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey[400], spreadRadius: 3, blurRadius: 10),
        ],
      ),
    );
  }
}
