import 'package:flutter/material.dart';
import 'package:github_assignment/Model/GitHubModel.dart';
import 'package:github_assignment/Services/Services.dart';
import 'package:github_assignment/Screens/UserDetails.dart';

class AllGitHubUsers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllGitHubUsersState();
  }
}

class AllGitHubUsersState extends State<AllGitHubUsers> {
  List<GitHubModel> _allGitHubUsers;
  bool _circular;
  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData() {
    _circular = true;
    Services.getAllGitHubUsers().then((allGitHubUsers) {
      setState(() {
        _allGitHubUsers = allGitHubUsers;
        print(allGitHubUsers);
        _circular = false;
      });
    });
  }

  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            _circular
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : buildAllGitHubUsersList(),
          ],
        ),
      ),
    );
  }

  Widget buildAllGitHubUsersList() {
    return Expanded(
        child: Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: ListView.builder(
          itemCount: _allGitHubUsers == null ? 0 : _allGitHubUsers.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      leading:
                          /*Container(
                        height: 30,
                        width: 30,
                        child: Center(
                          child:
                              Image.network(_allGitHubUsers[index].owner.avatarUrl),
                        ),
                      ),*/
                          CircleAvatar(
                        radius: 30.0,
                        backgroundImage: _allGitHubUsers[index]
                                    .owner
                                    .avatarUrl ==
                                null
                            ? NetworkImage(
                                "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg")
                            : NetworkImage(
                                _allGitHubUsers[index].owner.avatarUrl),
                      ),
                      title: Text(
                        _allGitHubUsers[index].name ?? "",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_allGitHubUsers[index].fullName ?? "",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.keyboard_arrow_right,
                          color: Colors.black, size: 30.0),
                      onTap: () {
                        print("tap");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDetails(
                                    _allGitHubUsers[index].fullName)));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, bottom: 20, right: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                                _allGitHubUsers[index].description ?? "",
                                style: TextStyle(color: Colors.black87)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );

            // return Text(_allGitHubUsers[index].fullName);
          }),
    ));
  }
}
