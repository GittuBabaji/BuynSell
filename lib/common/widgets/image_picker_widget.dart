import 'package:flutter/material.dart';

class ImagePickerWidget extends StatefulWidget {
  final int maxImages;
  final List<String> initialImagePaths;
  final Function(List<String>)? onImagesSelected;

  const ImagePickerWidget({
    super.key,
    this.maxImages = 5,
    this.initialImagePaths = const [],
    this.onImagesSelected,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  late List<String> _imagePaths;

  @override
  void initState() {
    super.initState();
    _imagePaths = List.from(widget.initialImagePaths);
  }

  void _pickImage() {
    // TODO: Integrate image_picker package for camera/gallery selection
  }

  void _removeImage(int index) {
    setState(() {
      _imagePaths.removeAt(index);
    });
    if (widget.onImagesSelected != null) {
      widget.onImagesSelected!(_imagePaths);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _imagePaths.length + (_imagePaths.length < widget.maxImages ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _imagePaths.length) {
            return GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 100,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[400]!),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo, color: Colors.grey),
                    SizedBox(height: 4),
                    Text(
                      'Add Photo',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          }

          return Stack(
            children: [
              Container(
                width: 100,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: const Center(
                    child: Icon(Icons.image, size: 40, color: Colors.grey),
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 12,
                child: GestureDetector(
                  onTap: () => _removeImage(index),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
