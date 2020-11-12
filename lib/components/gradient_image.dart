import 'package:cached_network_image/cached_network_image.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';

class GradientImage extends StatelessWidget {
  final String imageUrl;

  const GradientImage({Key key, @required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.00,
      decoration: BoxDecoration(
        color: AppColors.shark,
      ),
      child: ClipRRect(
        child: CachedNetworkImage(
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          imageUrl: this.imageUrl,
          fit: BoxFit.cover,
          width: 1000.0,
        ),
      ),
      /* child: TransitionToImage(
        image: AdvancedNetworkImage(
          this.imageUrl,
          loadedCallback: () {
            print('It works!');
          },
          loadFailedCallback: () {
            print('Oh, no!');
          },
        ),
        loadingWidgetBuilder: (_, double progress, __) =>
            Text(progress.toString()),
        fit: BoxFit.contain,
        placeholder: const Icon(Icons.refresh),
        width: 400.0,
        height: 300.0,
        enableRefresh: true,
      ), */
    );
    /* return Container(
      height: 180.00,
      decoration: BoxDecoration(
        color: AppColors.shark,
      ),
      child: ClipRRect(
        child: CachedNetworkImage(
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          imageUrl: this.imageUrl,
          fit: BoxFit.cover,
          width: 1000.0,
        ),
      ),
    ); */
  }
}
