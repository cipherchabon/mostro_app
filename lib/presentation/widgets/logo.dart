import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'config/image_paths.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(logo);
  }
}
