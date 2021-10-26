import 'dart:io';
import 'package:test/test.dart';
import 'package:path_provider/path_provider.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('./counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // 파일 읽기
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // 에러가 발생할 경우 0을 반환
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // 파일 쓰기
    return file.writeAsString('$counter');
  }
}

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

  test('read from csv file and ', () {
    var file = File("assets/arirang.csv");
    
  });
}
