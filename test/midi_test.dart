import 'dart:io';
import 'package:test/test.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  // test('parser and writer output matches', () {
  //   CounterStorage storage;
  //   var file = File("assets/arirang.mid");
  //   final parser = MidiParser();
  //   List<int> originalFileBuffer = file.readAsBytesSync();
  //   var parsedMidi = parser.parseMidiFromBuffer(originalFileBuffer);
  //   var enc = originalFileBuffer;

  //   for (var i = 0; i < originalFileBuffer.length; i++) {
  //     //storage.writeCounter(originalFileBuffer[i]);
  //     print(originalFileBuffer[i].toRadixString(16));
  //   }
  //   var writer = MidiWriter();
  //   List<int> writtenBuffer = writer.writeMidiToBuffer(parsedMidi);
  //   for (var i = 0; i < parsedMidi.tracks[0].length; i++) {
  //     if(parsedMidi.tracks[0][i] is NoteOnEvent) print(parsedMidi.tracks[0][i]);
  //   }
  //   expect(originalFileBuffer, writtenBuffer);
  // });

  // test('read from csv file', () async {
  //   var file = await File("assets/arirang.txt").readAsString();
  //   print(file);
  //   //print(file[0]);
  //   // for (var i = 0; i < file.length; i++) {
  //   //   print(file[i]);
  //   // }
  //   //print(file);
  //   //expect(true, true);
  // });
}
