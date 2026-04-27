+++
title = "Merge audio and video files"
date = 2024-11-23
+++

Merging audio and video files can be done efficiently using the `ffmpeg` tool. This process is often used when video and audio streams are stored in separate files and need to be combined into a single file.

The following `ffmpeg` command demonstrates how to merge a video file with an audio file into a single output file:

```bash
$ ffmpeg -i input_video.mp4 -i input_audio.mp3 -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 output.mp4
```

The command contains multiple options:

- `-i input_video.mp4`: Specifies the input video file.
- `-i input_audio.mp3`: Specifies the input audio file.
- `-c:v copy`: Copies the video codec without re-encoding.
- `-c:a aac`: Encodes the audio to AAC format.
- `-map 0:v:0`: Maps the video stream from the first input file.
- `-map 1:a:0`: Maps the audio stream from the second input file.
- `output.mp4`: Name of the output file.

## Bibliography

Bellard, F. (2000). _FFmpeg Documentation_. FFmpeg Project. [https://ffmpeg.org/documentation.html](https://ffmpeg.org/documentation.html)