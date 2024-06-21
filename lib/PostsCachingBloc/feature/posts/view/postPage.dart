import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/config/constant.dart';
import '../../../core/config/hive_config.dart';
import '../Widgets/CiracleImage.dart';
import '../Widgets/srachCustom.dart';
import '../bloc/postBloc.dart';
import '../bloc/postEvents.dart';
import '../bloc/postStates.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc()..add(GetPostsEvent()),
      child: Builder(
          builder: (context) {
            return Scaffold(
              body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: Constant.primaryColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 90,
                      width: double.infinity,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 34.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.camera_alt_outlined,color: Constant.secondColor,),
                              Container(height: 30,width: 290,child: TextFiledSrarchCustom('Search',Icons.search,(value){})),
                              Icon(Icons.favorite_border,color: Constant.secondColor,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 136,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,top: 4),
                            child: Text("MOMENTS",style: TextStyle(color: Constant.darkgrey,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CircleImage('images/pro6.jpeg','You'),
                                CircleImage('images/pro1.jpeg','Ella Potter'),
                                CircleImage('images/pro2.jpeg','Harry Potter'),
                                CircleImage('images/pro5.jpeg','Elian Potter'),
                                CircleImage('images/pro3.jpeg','Ahmed Potter'),
                                CircleImage('images/pro4.jpeg','Eva Potter'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child:
                      Container(
                        color: Constant.grey,
                        child: BlocBuilder<PostsBloc,PostStates>(
                          builder: (context, state) {
                            if(state is GetAllPostState){
                              return ListView.builder(
                                controller: context.read<PostsBloc>().scrollController,
                                itemCount:state.postsAll.length+1,
                                itemBuilder: (context, index) {
                                  // print("index"+"${index}");print("postsAll length"+"${state.postsAll.length}");
                                  if((index) == state.postsAll.length ){
                                    if(state.postsAll.length==100  ){
                                      return SizedBox(height: 0,width: 0,);
                                    }else if(connectivityResult == ConnectivityResult.none){
                                      return SizedBox(height: 0,width: 0,);
                                    }else{
                                      return Container(height:80,child: Center(child: CircularProgressIndicator(color: Constant.secondColor,),));
                                    }
                                  }else{
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0,left: 10,right: 10),
                                      child: Container(
                                        height: 200,
                                        width: 800,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Constant.primaryColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(state.postsAll[index].title,style: TextStyle(fontSize: 20),),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(left: 8),
                                                    height: 110,
                                                    width: 3.2,
                                                    color: Constant.secondColor,
                                                  ),
                                                  Container(width:360,height:98,padding: EdgeInsets.only(left: 8,top: 6),margin: EdgeInsets.only(top: 6),
                                                      decoration: BoxDecoration(
                                                        color: Constant.secondhColor,
                                                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                                                      ),
                                                      child: Text(state.postsAll[index].body,textAlign: TextAlign.start,style: TextStyle(color: Constant.darkgrey,fontWeight: FontWeight.bold,fontSize: 16),)),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.favorite_border,color: Constant.secondColor,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 28.0),
                                                    child: Icon(Icons.chat_bubble_outline,color: Constant.secondColor,),
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    height: 36,
                                                      width: 36,
                                                      margin: EdgeInsets.only(right: 10),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(50),
                                                          color: Constant.secondColor
                                                      ),
                                                      child: Icon(Icons.bookmarks,color: Constant.primaryColor,size: 18,)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    );
                                  }
                                },
                              );
                            }else if(state is ErrorToGetPost){
                              return Center(child: Text("Error State",style: TextStyle(color: Constant.secondColor,fontSize: 14),),);
                            }else if(state is LoadingToGetPost ){
                              return Center(child: CircularProgressIndicator(color: Constant.secondColor,));
                            }else{
                              return Container(color: Colors.cyan,);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
