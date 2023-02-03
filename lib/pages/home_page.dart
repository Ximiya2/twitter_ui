import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/pages/setting_page.dart';
import '../items/post_item.dart';
import '../states.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading:   Container(
          padding: const EdgeInsets.all(10),
          height: 20,
          width: 20,
          child: const CircleAvatar(
            radius: 5,
            backgroundImage: AssetImage("assets/image/photo_2023-01-25_19-56-17 (2).jpg"),
          ),
        ),
        title: Image.asset(
          "assets/image/photo_2023-01-25_19-56-18.jpg",
          height: 50,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              );
            },
            child: SvgPicture.asset('assets/icons/action.svg'),
          ),
          SizedBox(width: 21,),
        ],
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index){
            return postTweet(context,posts[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: SvgPicture.asset("assets/icons/add.svg"),
      ),
    );
  }




}