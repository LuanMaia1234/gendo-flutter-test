import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gendofluttertest/stores/repository_store.dart';
import 'package:gendofluttertest/stores/starred_store.dart';
import 'package:gendofluttertest/stores/user_store.dart';
import 'package:gendofluttertest/widgets/custom_circle.dart';
import 'package:gendofluttertest/widgets/repository_tile.dart';
import 'package:gendofluttertest/widgets/starred_tile.dart';

//Tela principal
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  TabController _tabController;
  RepositoryStore _repositoryStore;
  UserStore _userStore;
  StarredStore _starredStore;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _repositoryStore = RepositoryStore();
    _userStore = UserStore();
    _starredStore = StarredStore();
    _repositoryStore.getRepositories();
    _userStore.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(children: [
          Image.asset('images/githublogo.png', height: 40, width: 40,color: Colors.white,),
          SizedBox(width: 8),
          Text('GitHub', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 3),
          Text('profiles', style: TextStyle(fontSize: 19,fontWeight: FontWeight.w300)),
        ]),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(
                  builder: (_) {
                    if (_userStore.user == null) {
                      return Container();
                    } else {
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                            NetworkImage('${_userStore.user.avatarUrl}'),
                          ),
                          SizedBox(width: 13),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('${_userStore.user.name}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 21)),
                              Text('${_userStore.user.bio}',
                                  style: TextStyle(fontSize: 15,color: Colors.grey[600])),
                            ],
                          )
                        ],
                      );
                    }
                  },
                ),

              ],
            ),
          ),
          SizedBox(height: 10),
          TabBar(
            indicatorWeight: 5,
            indicatorColor: Colors.deepOrange,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Repos',style: TextStyle(fontSize: 18)),
                    SizedBox(width: 6),
                    Observer(
                      builder: (_) => CustomCircle(
                          text: _userStore.user != null
                              ? '${_userStore.user.publicRepos}'
                              : '0'),
                    ),
                  ],
                ),
              ),
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Starred',style: TextStyle(fontSize: 18)),
                    SizedBox(width: 6),
                    Observer(
                      builder: (_) => _starredStore.starredFuture != null && _starredStore.starredFuture.result !=null
                          ? CustomCircle(text: '${_starredStore.starredFuture.result.length}')
                          : CustomCircle(text: '0'),
                    ),
                  ],
                ),
              )
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            onTap: (index){
              if(index == 1){
                _starredStore.getStarred();
              }
            },
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              child: TabBarView(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(2, 30, 2, 15),
                    child: Column(
                      children: [
                        TextField(
                          cursorColor: Colors.orange,
                          decoration: InputDecoration(
                            hintText: 'Filter by name',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                          onSubmitted: (text) {
                            _repositoryStore.getRepositories(name: text);
                          },
                        ),
                        SizedBox(height: 6),
                        Expanded(
                          child: Observer(
                            builder: (_) {
                              if (_repositoryStore.state ==
                                  RepositoryState.initial) {
                                return Container();
                              } else if (_repositoryStore.state ==
                                  RepositoryState.loading) {
                                return Center(
                                    child: CircularProgressIndicator(
                                        valueColor:
                                        AlwaysStoppedAnimation<Color>(
                                            Colors.deepOrange)));
                              } else {
                                _repositoryStore.listLength =
                                    _repositoryStore.repositoryList.length;
                                return _repositoryStore
                                    .repositoryFuture.result.length > 0
                                    ? ListView.separated(
                                    itemCount: _repositoryStore
                                        .repositoryList.length,
                                    itemBuilder: (context, index) {
                                      return RepositoryTile(_repositoryStore
                                          .repositoryList[index]);
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                          thickness: 2, height: 3);
                                    })
                                    : Center(
                                  child: Text(
                                      'Nenhum repositorio encontrado',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(2, 30, 2, 15),
                    child: Column(
                      children: [
                        TextField(
                          cursorColor: Colors.orange,
                          decoration: InputDecoration(
                            hintText: 'Filter by name',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                          onSubmitted: (text) {
                            _starredStore.getStarred(name: text);
                          },
                        ),
                        SizedBox(height: 6),
                        Expanded(
                          child: Observer(
                            builder: (_) {
                              if (_starredStore.state == StarredState.initial) {
                                return Container();
                              } else if (_starredStore.state ==
                                  StarredState.loading) {
                                return Center(
                                    child: CircularProgressIndicator(
                                        valueColor:
                                        AlwaysStoppedAnimation<Color>(
                                            Colors.deepOrange)));
                              } else {
                                _starredStore.listLength =
                                    _starredStore.starredList.length;
                                return _starredStore.starredFuture.result.length > 0
                                    ? ListView.separated(
                                    itemCount:
                                    _starredStore.starredList.length,
                                    itemBuilder: (context, index) {
                                      return StarredTile(
                                          _starredStore.starredList[index]);
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                          thickness: 2, height: 3);
                                    })
                                    : Center(
                                  child: Text(
                                      'Nenhum favorito encontrado',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
