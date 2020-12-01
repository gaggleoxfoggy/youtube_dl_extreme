# Usage
```bash
$ ./run.command [options]

# Command-line args:
#     -encoding [ENCODING] (string)       Set encoding format.
#                                         e.g. "prores -profile:v 3"
#                                         Accepts any encoding format that your version
#                                         of ffmpeg is built with.
#
#     -fast, --skip-encoding              Download best quality video without letterboxing or
#                                         encoding as prores.
#                                         Still respects -res flag in that it attempts to download
#                                         the video in the desired resolution from YouTube.
#
#     -framerate [FRAMERATE] (float)      Set framerate of output video.
#                                         Not applicable if using -fast/--skip-encoding flag.
#
#     -res [720|1080|2160] (int)          Set desired resolution.
#                                         Will attempt to download video from YouTube
#                                         in this resolution.
#                                         Will letterbox/scale output video
#                                         in this resolution unless -fast/--skip-encoding is used.
#                                         720 is the default.
```

Using `run.command` will automatically install Homebrew (if on Mac) and configure a Python virtual environment for `youtube_dl_interactive.py` to use, then run youtube_dl_interactive.py using that virtualenv.

`run.command` will pass options on to `youtube_dl_interactive.py`.

# File-based args

You can also specify arguments in the options.txt file (created upon first run, or create
yourself).  The format is one argument on a line followed by its value on the next line.
Here is an example where you want the defaults to be 1080p resolution and the prores proxy
format (profile 0):

```
-res
1080
-encoding
prores -profile:v 0
```

You may still supply command-line arguments which supersede
the arguments defined in options.txt
