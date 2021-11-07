import 'package:flutter/material.dart';
import 'package:http_post_request_api/model/user_model.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
///Function used to call the API in order to get a response back THEN
/// we store the response body to the "UserModel" object:
/// To return a created user, we send a request that have a body of the "name" AND "jobTitle":
Future<UserModel?> signUpUser(String name, String jobTitle) async{
  ///Define the URI of the API:
  const String apiUri = "https://reqres.in/api/users";
  final response = await http.post(Uri.parse(apiUri), body: {
    "name": name,
    "job": jobTitle
  });
  ///Verify the success of the http respons:
  if(response.statusCode==201){
    final String responseBody = response.body;
    return userModelFromJson(responseBody);
  }else{
    return null;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  ///In order to make the data returned FROM the API stored in the 'UserModel' field accessible inside
  ///  the widget in build(...), THEN we can set the field '_user' to the response returned from the API inside
  ///  the Button below BY the "setState({});", so that we can display them in the app screen:
  UserModel? _user;

  ///We will make a post request to a 'URI' of the API BY filling the body of the request with
  /// two fields 'name' AND 'job', THEN will get a RESPONSE from the API in the body of it:
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.person_pin),
                hintText: 'Enter your name'
              ),
            ),
            const SizedBox(height: 12,),
            TextField(
              controller: jobController,
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.work),
                  hintText: 'Enter your job'
              ),
            ),
            const SizedBox(height: 50,),
            ///Displaying the API response if the user returned is not null:
            _user ==null ? Container() : Text("The user ${_user!.name}, id ${_user!.id} with job as ${_user!.job} is created successfully! at the time ${_user!.createdAt}")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          ///Extract the text input entered by the user:
          final String name = nameController.text;
          final String jobTitle = jobController.text;
          ///Send the text input entered inside a Function "signUpUser" that willbe called:
          final UserModel? user = await signUpUser(name, jobTitle);
          ///Then we set the state of the 'user' returned from the function that calls the API TO the '_user' field:
          setState(() {
            _user = user;
          });
          print("${_user!.id}");
          print("${_user!.name}");
          print("${_user!.job}");
          print("${_user!.createdAt}");
        },
        tooltip: '',
        child: const Icon(Icons.send_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );

  }

}