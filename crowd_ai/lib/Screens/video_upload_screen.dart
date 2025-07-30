import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../navigation.dart';

class VideoUploadScreen extends StatefulWidget {
  const VideoUploadScreen({super.key});

  @override
  State<VideoUploadScreen> createState() => _VideoUploadScreenState();
}

class _VideoUploadScreenState extends State<VideoUploadScreen> {
  File? _selectedVideo;
  bool _isUploading = false;
  String _uploadStatus = '';
  int? _maxCount;
  int? _avgCount;
  int? _slotLimit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _slotLimit = ModalRoute.of(context)?.settings.arguments as int? ?? 10;
  }

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedVideo = File(pickedFile.path);
        _uploadStatus = '';
        _maxCount = null;
        _avgCount = null;
      });
    }
  }

  Future<void> _uploadVideo() async {
    if (_selectedVideo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a video first')),
      );
      return;
    }

    setState(() {
      _isUploading = true;
      _uploadStatus = '';
    });

    // ✅ Replace this with your PC’s actual IP address
    var uri = Uri.parse('http://192.168.29.161:5000/analyze');

    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('video', _selectedVideo!.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var respStr = await response.stream.bytesToString();
        var data = json.decode(respStr);
        setState(() {
          _maxCount = data['max_count'];
          _avgCount = data['avg_count'];
          _uploadStatus = 'Analysis complete!';
        });
      } else {
        setState(() {
          _uploadStatus = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _uploadStatus = 'Error: $e';
      });
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SafeCrowd AI - Upload Video'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _pickVideo,
              icon: const Icon(Icons.video_library),
              label: const Text('Select Video'),
            ),
            if (_selectedVideo != null) ...[
              const SizedBox(height: 20),
              Text('Selected: ${_selectedVideo!.path.split('/').last}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isUploading ? null : _uploadVideo,
                child: _isUploading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Upload & Analyze'),
              ),
            ],
            if (_uploadStatus.isNotEmpty) ...[
              const SizedBox(height: 30),
              Text(_uploadStatus, style: const TextStyle(color: Colors.green)),
            ],
            if (_maxCount != null && _avgCount != null) ...[
              const SizedBox(height: 20),
              Text('Max Crowd Count: $_maxCount', style: const TextStyle(fontSize: 18)),
              Text('Average Crowd Count: $_avgCount', style: const TextStyle(fontSize: 18)),
              if (_slotLimit != null && _maxCount! > _slotLimit!)
                const Text(
                  'ALERT: Overcrowding Detected!',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              if (_slotLimit != null && _maxCount! <= _slotLimit!)
                const Text(
                  'Safe: Within Limit',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
