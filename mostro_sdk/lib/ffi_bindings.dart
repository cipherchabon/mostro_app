import 'dart:ffi';
import 'dart:io';

import 'mostro_sdk_bindings_generated.dart';

const String _libName = 'libffi_plugin';

/// The bindings to the native functions in [_dylib].
final bindings = MostroSdkBindings(_dylib);

/// The dynamic library in which the symbols for [DashFfiPluginBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS) {
    final currentPath = Directory.current.path;

    if (currentPath.contains('mostro_sdk')) {
      return DynamicLibrary.open('$currentPath/macos/$_libName.dylib');
    }

    return DynamicLibrary.open('$_libName.dylib');
  } else if (Platform.isAndroid) {
    return DynamicLibrary.open('$_libName.so');
  } else {
    throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
  }
}();
