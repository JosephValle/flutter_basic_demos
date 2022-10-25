import 'package:demo/bloc/download/download_bloc.dart';
import 'package:demo/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadBloc, DownloadState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Demo App"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreen()));
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: Center(child: buildBody(context, state)),
      );
    });
  }

  buildBody(BuildContext context, DownloadState state) {
    // Placeholder Urls
    String imageUrl =
        "https://samplelib.com/lib/preview/png/sample-hut-400x300.png";
    String userUrl = "https://reqres.in/api/users/2";

    // Different Cases for Different States
    if (state is DownloadInitial) {
      return ElevatedButton(
          onPressed: () {
            // Call Bloc to Download File
            context.read<DownloadBloc>().add(DownloadAssets(imageUrl, userUrl));
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ))),
          child: const Text("Download Data"));
    } else if (state is DownloadLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Download in Progress",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      );
    } else if (state is DownloadLoaded) {
      User user = context.read<DownloadBloc>().user!;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Image:",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.file(context.read<DownloadBloc>().file!),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "User Data:",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${user.last}, ${user.first}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<DownloadBloc>().add(ResetDownload());
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
              child: const Text("Reset")),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Error Downloading!"),
          ),
          state is DownloadError
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    state.error,
                    softWrap: true,
                  ),
              )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  context
                      .read<DownloadBloc>()
                      .add(DownloadAssets(imageUrl, userUrl));
                },
                child: const Text("Try Again")),
          ),
        ],
      );
    }
  }
}
