import 'package:http/http.dart' as http;
import 'package:github_assignment/Model/GitHubModel.dart';
import 'package:github_assignment/Model/GitHubUserModel.dart';

class Services {
  static Future<List<GitHubModel>> getAllGitHubUsers() async {
    print("Inside Get Hub");
    try {
      final response = await http.get("https://api.github.com/repositories");

      if (response.statusCode == 200) {
        print(response.body);

        final List<GitHubModel> githubPublicUsers =
            gitHubModelFromJson(response.body);
        print("===== githubPublicUsers ok ========");
        //  print(githubPublicUsers);
        return githubPublicUsers;
      } else {
        print('==github Public Users Api Fail ${response.statusCode}====');
        return null; //Product();
      }
    } catch (e) {
      print('== githu bPublic Users fail Exception==== $e.m');
      return null; //Product();
    }
  }

  static Future<GitHubUserModel> getGitHubUsers(String repoName) async {
    print("Inside Get Hub");
    try {
      final response = await http.get("https://api.github.com/repos/$repoName");
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);

        final GitHubUserModel githubPublicUser =
            gitHubUserModelFromJson(response.body);
        print("===== git hub User ok ========");
        //  print(githubPublicUser);
        return githubPublicUser;
      } else {
        print('==github  User Api Fail ${response.body}====');
        print('==github  User Api Fail ${response.statusCode}====');
        print('==github  User Api Fail ${response.body}====');
        return null; //Product();
      }
    } catch (e) {
      print('== github User fail Exception==== $e.m');
      return null; //Product();
    }
  }
}
