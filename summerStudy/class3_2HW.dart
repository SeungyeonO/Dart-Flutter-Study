import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String imageSrc =
      'https://images.unsplash.com/photo-1519501025264-65ba15a82390?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Dhttps://cdn.lifeofpix.com/152493/_w1800/309103/lifeofpix-clementmerouan4471-309103.';

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageSrc),
            fit: BoxFit.cover,
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              vertical: 40,
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    '오승연',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Oh Seungyeon',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                InfoCard(
                    givenIcon: Icons.location_on, title: '국적', content: '대한민국'),
                SizedBox(
                  height: 40,
                ),
                InfoCard(
                  givenIcon: Icons.book_rounded,
                  title: '학력',
                  content: '경희대학교 컴퓨터공학과 재학중',
                ),
                SizedBox(
                  height: 40,
                ),
                InfoCard(
                  givenIcon: Icons.mail,
                  title: '이메일',
                  content: 'seungyeon_oh@khu.ac.kr',
                ),
                SizedBox(
                  height: 40,
                ),
                InfoCard(
                  givenIcon: Icons.looks_one_rounded,
                  title: '관심분야',
                  content: 'Mobile 앱 개발',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData givenIcon;
  final String title;
  final String content;

  const InfoCard({
    super.key,
    required this.givenIcon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 5.0,
            offset: const Offset(0, 10),
          ),
        ],
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(givenIcon),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(content),
        ],
      ),
    );
  }
}
