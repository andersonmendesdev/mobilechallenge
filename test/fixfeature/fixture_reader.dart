import 'dart:io';

String fixture(String name) =>
    File('test/fixfeature/$name').readAsStringSync();
