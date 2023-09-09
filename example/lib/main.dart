import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/media/cubit/media_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter example permissions',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MediaCubit(),
          ),
        ],
        child: const MyHomePage(title: 'Test permissions'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<MediaCubit, MediaState>(
      listener: (_, state) {
        if (state.isPhotoPermissionsDenied) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Permissions denied'),
              content: const Text(
                  'You have to accept the permissions to access the gallery'),
              actions: [
                TextButton(
                  onPressed: () => context.read<MediaCubit>().openSettings(),
                  child: const Text('Open settings'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          );
        } else if (state.isCameraPermissionsDenied) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Permissions denied'),
              content: const Text(
                  'You have to accept the permissions to access the camera'),
              actions: [
                TextButton(
                  onPressed: () => context.read<MediaCubit>().openSettings(),
                  child: const Text('Open settings'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Permissions for media library',
              ),
              TextButton(
                  onPressed: () =>
                      context.read<MediaCubit>().pickImageFromLibrary(),
                  child: const Text('Pick image from gallery')),
              BlocBuilder<MediaCubit, MediaState>(
                  buildWhen: (previous, current) =>
                      previous.localPathPhoto != current.localPathPhoto,
                  builder: (context, state) => state.localPathPhoto.isEmpty
                      ? Container(
                          color: Colors.purple.shade100,
                          width: 200,
                          height: 200,
                          child: const Icon(Icons.select_all))
                      : _LocalImage(state.localPathPhoto)),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Permissions for camera',
              ),
              TextButton(
                  onPressed: () =>
                      context.read<MediaCubit>().pickImageFromCamera(),
                  child: const Text('Pick image from camera')),
              BlocBuilder<MediaCubit, MediaState>(
                  buildWhen: (previous, current) =>
                      previous.localPathCamera != current.localPathCamera,
                  builder: (context, state) => state.localPathCamera.isEmpty
                      ? Container(
                          color: Colors.purple.shade100,
                          width: 200,
                          height: 200,
                          child: const Icon(Icons.select_all))
                      : _LocalImage(state.localPathCamera)),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocalImage extends StatelessWidget {
  const _LocalImage(this.localPath);

  final String localPath;

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(localPath),
      fit: BoxFit.cover,
      width: 200,
      height: 200,
    );
  }
}
