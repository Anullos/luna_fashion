import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../domain/models/page_model.dart';

class OnBoardingItemPage extends StatefulWidget {
  const OnBoardingItemPage({Key? key, required this.page, required this.index})
      : super(key: key);
  final PageModel page;
  final int index;

  @override
  State<OnBoardingItemPage> createState() => _OnBoardingItemPageState();
}

class _OnBoardingItemPageState extends State<OnBoardingItemPage> {
  late final Future<LottieComposition> _composition;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _composition = _loadComposition();
      setState(() {
        _isLoading = false;
      });
    });
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load(widget.page.pictureUrl);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
        children: <Widget>[
          _buildPicture(context, size.width * 0.7),
          const SizedBox(height: 24),
          _buildText(context),
          const SizedBox(height: 16),
          _buildDescription(context),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      widget.page.title,
      style: Theme.of(context).textTheme.headline3!.copyWith(
            color: widget.index == 1 ? Colors.white : Colors.black,
          ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      widget.page.description,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: widget.index == 1 ? Colors.white : Colors.black,
            fontSize: 18,
          ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPicture(BuildContext context, double size) {
    return Container(
      width: size,
      height: size * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(60.0)),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(
        top: 80,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _isLoading
              ? Container()
              : FutureBuilder<LottieComposition>(
                  future: _composition,
                  builder: (context, snapshot) {
                    var composition = snapshot.data;
                    if (composition != null) {
                      return Lottie(
                        composition: composition,
                      );
                    } else {
                      return Center(child: Container());
                    }
                  },
                ),
        ],
      ),
    );
  }
}
