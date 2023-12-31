import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_news/news_data_provider.dart';
import 'package:provider/provider.dart';

import 'news_screen.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {


  AppExit(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text("Warning!", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
            content: Text("Do you want to exit?", style: TextStyle(color: Colors.white, fontSize: 18),),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.red,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                  onPressed: (){Navigator.of(context).pop();}, child: Text("No")),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.green,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                  onPressed: (){SystemNavigator.pop();}, child: Text("Yes")),
            ],

          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final NewsData=Provider.of<NewsDataProvider>(context);
    return WillPopScope(
      onWillPop: (){
        return AppExit();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.newspaper),),
          backgroundColor: Colors.black,
          elevation: 0,
          toolbarHeight: 80,
          centerTitle: true,
          title: Text("আমার নি উ জ",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5
            ),
            itemCount: NewsData.newsList.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>News_Screen(newsLink: NewsData.newsList[index]['url'])));
                  },
                    child: Container(
                        height: 250,
                        width: 250,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)
                      ),
                     child: Image.asset(NewsData.newsList[index]['news_img']!, fit: BoxFit.fill,),
                     // child: Center(child: Text(NewsData.newsList[index]['name']!, style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),),
                      ),
                ),
              );
            }
        ),
      ),
    );
  }
}
