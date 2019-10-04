inspired by this:
https://jameshfisher.com/2017/02/20/macos-assembly-hello-world/


Johns-MacBook-Pro:~ johnmcgarey$ brew install nasm
Updating Homebrew...
==> Auto-updated Homebrew!
Updated 1 tap (homebrew/core).
==> Updated Formulae
kops

==> Downloading https://homebrew.bintray.com/bottles/nasm-2.14.02.mojave.bottle.
==> Downloading from https://akamai.bintray.com/77/77a183895137e0f95d897d3339923
######################################################################## 100.0%
==> Pouring nasm-2.14.02.mojave.bottle.tar.gz
🍺  /usr/local/Cellar/nasm/2.14.02: 30 files, 2.7MB
==> `brew cleanup` has not been run in 30 days, running now...
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/pcre-8.41.high_sierra.bottle.tar.gz... (1.7MB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/cairo-1.14.10.high_sierra.bottle.tar.gz... (1.6MB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/pkg-config-0.29.2.high_sierra.bottle.tar.gz... (235.8KB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/libtiff-4.0.8_5.high_sierra.bottle.tar.gz... (1MB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/fontconfig-2.12.6.high_sierra.bottle.tar.gz... (1.2MB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/libpng-1.6.34.high_sierra.bottle.tar.gz... (444.4KB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/libffi-3.2.1.high_sierra.bottle.tar.gz... (97.2KB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/little-cms2-2.9.high_sierra.bottle.tar.gz... (377.9KB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/freetype-2.8.1.high_sierra.bottle.tar.gz... (887.6KB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/gobject-introspection-1.54.1.high_sierra.bottle.tar.gz... (1.5MB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/poppler-0.61.1.high_sierra.bottle.tar.gz... (5.9MB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/gettext-0.19.8.1.high_sierra.bottle.tar.gz... (7.8MB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/pixman-0.34.0_1.high_sierra.bottle.tar.gz... (497.9KB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/glib-2.54.2.high_sierra.bottle.tar.gz... (6.9MB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/jpeg-9b.high_sierra.bottle.tar.gz... (296.8KB)
Removing: /Users/johnmcgarey/Library/Caches/Homebrew/openjpeg-2.3.0.high_sierra.bottle.tar.gz... (1.9MB)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/lame... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/pkg-config... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/libtiff... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/ffmpeg... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/xvid... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/little-cms2... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/libpng... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/pixman... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/freetype... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/openjpeg... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/glib... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/cairo... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/gobject-introspection... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/fontconfig... (927B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/libav... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/gettext... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/youtube-dl... (106B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/pcre... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/x264... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/faac... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/jpeg... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/poppler... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/openssl... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/libffi... (64B)
Removing: /Users/johnmcgarey/Library/Logs/Homebrew/httrack... (64B)
Pruned 0 symbolic links and 4 directories from /usr/local
Johns-MacBook-Pro:~ johnmcgarey$ 
Johns-MacBook-Pro:~ johnmcgarey$ nasm
nasm: fatal: no input file specified
type `nasm -h' for help
Johns-MacBook-Pro:~ johnmcgarey$ ls
Applications	Downloads	Movies		Projects	dwhelper
Desktop		Dropbox		Music		Public		git
Documents	Library		Pictures	Sites		orDrumbox
Johns-MacBook-Pro:~ johnmcgarey$ cd git
Johns-MacBook-Pro:git johnmcgarey$ ls
Clarity	Dev	HomeRun	Misc
Johns-MacBook-Pro:git johnmcgarey$ cd Dev
Johns-MacBook-Pro:Dev johnmcgarey$ ls
autotracker
Johns-MacBook-Pro:Dev johnmcgarey$ more autotracker/
autotracker/ is a directory
Johns-MacBook-Pro:Dev johnmcgarey$ cd autotracker/
Johns-MacBook-Pro:autotracker johnmcgarey$ ls
auto.py			bu-fish-of-the-tubes.it	bu-white-and-biased.it
Johns-MacBook-Pro:autotracker johnmcgarey$ cd ..
Johns-MacBook-Pro:Dev johnmcgarey$ mkdir nasm
Johns-MacBook-Pro:Dev johnmcgarey$ cd ..
Johns-MacBook-Pro:git johnmcgarey$ ls
Clarity	Dev	HomeRun	Misc
Johns-MacBook-Pro:git johnmcgarey$ cd Dev/
Johns-MacBook-Pro:Dev johnmcgarey$ ls
autotracker	nasm
Johns-MacBook-Pro:Dev johnmcgarey$ cd nams
-bash: cd: nams: No such file or directory
Johns-MacBook-Pro:Dev johnmcgarey$ cd nasm
Johns-MacBook-Pro:nasm johnmcgarey$ ls
Johns-MacBook-Pro:nasm johnmcgarey$ git init 
Initialized empty Git repository in /Users/johnmcgarey/git/Dev/nasm/.git/
Johns-MacBook-Pro:nasm johnmcgarey$ git status
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)
Johns-MacBook-Pro:nasm johnmcgarey$ mate hw.asm
Johns-MacBook-Pro:nasm johnmcgarey$ ls
hw.asm
Johns-MacBook-Pro:nasm johnmcgarey$ nasm -version
NASM version 2.14.02 compiled on Dec 27 2018
Johns-MacBook-Pro:nasm johnmcgarey$ nasm -f macho64 hello.asm
nasm: fatal: unable to open input file `hello.asm'
Johns-MacBook-Pro:nasm johnmcgarey$ nasm -f macho64 hw.asm
Johns-MacBook-Pro:nasm johnmcgarey$ ld -macosx_version_min 10.7.0 -lSystem -o hello hw.o
ld: warning: PIE disabled. Absolute addressing (perhaps -mdynamic-no-pic) not allowed in code signed PIE, but used in start from hw.o. To fix this warning, don't compile with -mdynamic-no-pic or link with -Wl,-no_pie
Johns-MacBook-Pro:nasm johnmcgarey$ ./hello
Hello, world!
Johns-MacBook-Pro:nasm johnmcgarey$ mate hw.transcript.txt
Johns-MacBook-Pro:nasm johnmcgarey$ 