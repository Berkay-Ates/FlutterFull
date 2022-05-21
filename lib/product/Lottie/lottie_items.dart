enum LottieItems { changeTemeLottie }

extension LottieItemsPath on LottieItems {
  String _paths() {
    switch (this) {
      case LottieItems.changeTemeLottie:
        return 'theme_change';
    }
  }

  String get lottiePath => 'assets/lottie/lottie_${_paths()}.json';
}
