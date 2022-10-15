// ffmpeg -y -re -i mp4/video01.mp4 \
//   -c:v libx264 -x264opts "keyint=24:min-keyint=24:no-scenecut" -r 24 \
//   -c:a aac -b:a 128k \
//   -bf 1 -b_strategy 0 -sc_threshold 0 -pix_fmt yuv420p \
//   -map 0:v:0 -map 0:a:0 -map 0:v:0 -map 0:a:0 -map 0:v:0 -map 0:a:0 \
//   -b:v:0 250k  -filter:v:0 "scale=-2:240" -profile:v:0 baseline \
//   -b:v:1 750k  -filter:v:1 "scale=-2:480" -profile:v:1 main \
//   -b:v:2 1500k -filter:v:2 "scale=-2:720" -profile:v:2 high \
//   -use_timeline 1 -use_template 1 -window_size 5 -adaptation_sets "id=0,streams=v id=1,streams=a" \
//   -init_seg_name init-video01-\$RepresentationID\$.m4s -media_seg_name video01-\$RepresentationID\$-\$Number\$.m4s \
//   -f dash dash/video01.mpd

final dataDashJson = {
  "page": 1,
  "per_page": 50,
  "images": [
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb01.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb02.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb03.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb04.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb05.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb06.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb07.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb08.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb09.png",
    //
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb10.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb11.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb12.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb13.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb14.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb15.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb16.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb17.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb18.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb19.png",
    //
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb20.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb21.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb22.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb23.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb24.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb25.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb26.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb27.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb28.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb29.png",
    //
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb30.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb31.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb32.png",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/thumb33.png",
  ],
  "videos": [
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video01.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video02.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video03.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video04.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video05.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video06.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video07.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video08.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video09.mpd",
    //
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video10.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video11.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video12.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video13.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video14.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video15.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video16.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video17.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video18.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video19.mpd",
    //
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video20.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video21.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video22.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video23.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video24.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video25.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video26.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video27.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video28.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video29.mpd",
    //
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video30.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video31.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video32.mpd",
    "https://raw.githubusercontent.com/duythien0912/sample_short_video/main/dash/video33.mpd",
  ],
  "total_results": 366723,
  "next_page":
      "https://api.pexels.com/v1/videos/popular/?page=2\u0026per_page=50",
  "url": "https://api-server.pexels.com/videos/",
};
