import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children:
              List.generate(10, (index) => UserStory(userName: "user $index", randomImage: "https://picsum.photos/8$index"))),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;
  final String randomImage;

  const UserStory(
      {required this.userName, required this.randomImage, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                  randomImage,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
              ),
            )
          ),
          Text(userName)
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final String userImage;
  final String feedImage;
  final int likeCount;
  final String content;

  FeedData(
      {required this.userName, required this.userImage, required this.feedImage, required this.likeCount, required this.content});
}

final feedDataList = List.generate(
    20,
    (index) => FeedData(
        userName: "user$index",
        userImage: "https://picsum.photos/8$index",
        feedImage: "https://picsum.photos/280$index",
        likeCount: Random().nextInt(100),
        content: "content $index"));

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      feedData.userImage,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(feedData.userName),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Image.network(
          feedData.feedImage,
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_outline,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.chat_bubble,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.paperplane,
                      )),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.bookmark,
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "좋아요 ${feedData.likeCount}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: feedData.userName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(text: "  "),
              TextSpan(text: feedData.content),
            ], style: const TextStyle(color: Colors.black)),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) {
        return FeedItem(feedData: feedDataList[index]);
      },
    );
  }
}
