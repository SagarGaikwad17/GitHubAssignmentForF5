import 'package:flutter/material.dart';
import 'package:github_assignment/Model/GitHubUserModel.dart';
import 'package:github_assignment/Services/Services.dart';

class UserDetails extends StatefulWidget {
  String repoName;
  UserDetails(this.repoName);
  @override
  State<StatefulWidget> createState() {
    return UserDetailsState();
  }
}

class UserDetailsState extends State<UserDetails> {
  GitHubUserModel _gitHubUser;
  bool _circular = true;
  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData() {
    _circular = true;
    Services.getGitHubUsers(widget.repoName).then((gitHubUser) {
      setState(() {
        _gitHubUser = gitHubUser;
        print(gitHubUser);
        _circular = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _circular
          ? Container(child: Center(child: CircularProgressIndicator()))
          : ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Center(
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: _gitHubUser.owner.avatarUrl == null
                        ? NetworkImage(
                            "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg")
                        : NetworkImage(_gitHubUser.owner.avatarUrl),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    _gitHubUser.name ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Center(
                  child: Text(
                    _gitHubUser.fullName ?? "",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 20, right: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(_gitHubUser.description ?? "",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  _gitHubUser.forksCount.toString() ?? 0,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  "Forks",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Column(
                            children: <Widget>[
                              Text(
                                _gitHubUser.stargazersCount.toString() ?? 0,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Text(
                                "Stargazers",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 5,
                          child: Column(
                            children: <Widget>[
                              Text(
                                _gitHubUser.watchersCount.toString() ?? 0,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Text(
                                "Watchers",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: <Widget>[
                              Text(
                                _gitHubUser.size.toString() ?? 0,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Text(
                                "Size",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 6,
                          child: Column(
                            children: <Widget>[
                              Text(
                                _gitHubUser.openIssuesCount.toString() ?? 0,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Text(
                                "Open Issues",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
