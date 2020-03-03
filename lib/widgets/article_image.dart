import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AtomicImage extends StatelessWidget {
  final String imageSrc;
  final Map<String, String> imageHeaders;

  AtomicImage({
    this.imageSrc,
    this.imageHeaders,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      height: 102,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: CachedNetworkImage(
          imageUrl: imageSrc,
          httpHeaders: imageHeaders,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Color(0x000000).withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          placeholder: (context, url) => buildPlaceholder(context),
          errorWidget: (context, url, error) => buildPlaceholder(context),
        ),
      ),
    );
  }

  Container buildPlaceholder(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Icon(
        Icons.image,
        color: Colors.grey[300],
        size: 32,
      ),
    );
  }
}
