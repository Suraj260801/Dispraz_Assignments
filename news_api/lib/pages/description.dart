import 'package:flutter/material.dart';
import 'package:news_api/models/news_model.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';


class Description extends StatefulWidget {

  const Description({Key? key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  ValueNotifier<IconData> isBookMarkedIcon=ValueNotifier(Icons.bookmark_outline_sharp);
  @override
  Widget build(BuildContext context) {
    final Article article =
        ModalRoute.of(context)!.settings.arguments as Article;
    isBookMarkedIcon=article.isBookMarked?ValueNotifier(Icons.bookmark):ValueNotifier(Icons.bookmark_outline_sharp);
    final Size size = MediaQuery.of(context).size;
    final formattedDate = DateFormat.yMd().add_jm().format(article.publishedAt);
    List<String> contentList=[article.title,article.author??"Times Of India",formattedDate,article.description,article.content];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.blueGrey],
                begin: Alignment.topCenter)),
        padding: const EdgeInsets.fromLTRB(5, 30, 5, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Stack(
                children: [
                  SizedBox(
                    height: size.height * 0.3,
                    width: size.width,
                    child: ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (bounds) {
                        return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(1.0),
                              Colors.blueGrey.withOpacity(0.0)
                            ],
                            stops: const [
                              0.0,
                              0.2
                            ]).createShader(bounds);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          article.urlToImage??"",
                          fit: BoxFit.cover,
                          errorBuilder: (_,__,___){
                            return const Center(
                              child: Icon(Icons.image_not_supported_outlined,color: Colors.white,size: 70,),
                            );

                          }
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ))),
                  Positioned(
                      top: 0,
                      right: 5,
                      child: IconButton(
                        onPressed: () {
                          Share.share(article.url);
                        },
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      )),
                  Positioned(
                      top: 0,
                      right: 50,
                      child: ValueListenableBuilder<IconData>(
                        valueListenable: isBookMarkedIcon,
                        builder: (BuildContext context, dynamic value, Widget? child) {
                          return  IconButton(
                            onPressed: () {
                              article.isBookMarked=!article.isBookMarked;
                              article.isBookMarked?isBookMarkedIcon.value=Icons.bookmark:isBookMarkedIcon.value=Icons.bookmark_outline_sharp;
                            },
                            icon: Icon(
                              value,
                              color: Colors.white,
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
            SizedBox(
              height: size.height*0.65,
              child: ListView.builder(
                itemCount: contentList.length,
                  itemBuilder: (context,index){
                return DescriptionContent(data: contentList[index]);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
class DescriptionContent extends StatelessWidget {
  final String data;
  const DescriptionContent({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: 5,bottom: 5),
      child: Text(
        data,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlayfairDisplay'),
      ),
    );
  }
}

