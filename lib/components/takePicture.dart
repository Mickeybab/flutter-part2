import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class TakePicturePage extends StatefulWidget {
  final CameraDescription camera;
  TakePicturePage({@required this.camera});

  @override
  _TakePicturePageState createState() => _TakePicturePageState();
}

class _TakePicturePageState extends State<TakePicturePage> {
  CameraController _cameraController;
  Future<void> _initializeCameraControllerFuture;

  @override
  void initState() {
    super.initState();

    _cameraController =
        CameraController(widget.camera, ResolutionPreset.ultraHigh);

    _initializeCameraControllerFuture = _cameraController.initialize();
  }

  void _takePicture(BuildContext context) async {
    try {
      await _initializeCameraControllerFuture;

      final image = await _cameraController.takePicture();
      final path = image?.path;

      Navigator.pop(context, path);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      FutureBuilder(
        future: _initializeCameraControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return CameraPreview(_cameraController);
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              child: TextButton(
                child: Text("Take picture"),
                onPressed: () {
                  _takePicture(context);
                },
              ),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12.0))))
    ]);
  }
}
