import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopjoy/api/apiServices.dart';
class ResponseDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<FetchApi>(context);
    return Center(
        // padding: const EdgeInsets.all(16.0),
        child: appState.isFetching
            ? CircularProgressIndicator()
            : appState.getResJson != null
                ? Text(appState.getResJson.toString())
                : Text("insufficient funds")

        // ? ListView.builder(
        //     primary: false,
        //     shrinkWrap: true,
        //     itemCount: appState.getResponseJson().length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         leading: CircleAvatar(
        //           backgroundImage: NetworkImage(
        //               appState.getResponseJson()[index]['avatar']),
        //         ),
        //         title: Text(
        //           appState.getResponseJson()[index]["first_name"],
        //         ),
        //       );
        //     },
        //   )
        // : Text("Press Button above to fetch data"),
        );
  }
}
