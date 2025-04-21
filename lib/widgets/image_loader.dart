import 'dart:async';

import 'package:flutter/material.dart';

class ImageLoader extends StatefulWidget {
  final VoidCallback? onLoaded;
  final String imageUrl;
  const ImageLoader({super.key, required this.imageUrl, this.onLoaded,});

  @override
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {

  int retryCount = 0;
  UniqueKey imageKey = UniqueKey();
  Timer? retryTimer;
  bool isDisposed = false;
  bool hasCalledOnLoaded = false;

  void retry() {
    if (!mounted || isDisposed) return; // an toàn hơn
    setState(() {
      retryCount++;
      imageKey = UniqueKey();
    });
  }
  @override
  void dispose() {
    isDisposed = true;
    retryTimer?.cancel(); // Hủy timer nếu còn tồn tại
    super.dispose();
  }

  void callOnLoadedOnce() {
    if (!hasCalledOnLoaded && widget.onLoaded != null) {
      hasCalledOnLoaded = true;
      widget.onLoaded!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.imageUrl,
      key: imageKey,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          callOnLoadedOnce();
          return child;
        }
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        retryTimer?.cancel();
        retryTimer = Timer(const Duration(seconds: 5), retry);
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
