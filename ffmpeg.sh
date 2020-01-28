#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

runPath="/root"

Install_yasm()
{
	cd ${runPath}
	wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
	tar -xzvf yasm-1.3.0.tar.gz
	cd yasm-1.3.0
	./configure
	make
	make install
	cd ..
	rm -rf yasm*
}
Install_lame()
{
	cd ${runPath}
	wget http://jaist.dl.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
	tar -xzvf lame-3.99.5.tar.gz
	cd lame-3.99.5
	./configure
	make
	make install
	cd ..
	rm -rf lame*
}
Install_amr()
{
	cd ${runPath}
	wget http://downloads.sourceforge.net/project/opencore-amr/opencore-amr/opencore-amr-0.1.3.tar.gz
	tar -xzvf opencore-amr-0.1.3.tar.gz
	cd opencore-amr-0.1.3
	./configure
	make
	make install
	cd ..
	rm -rf opencore-amr*
}

Install_amrnb()
{
	cd ${runPath}
	wget http://www.penguin.cz/~utx/ftp/amr/amrnb-11.0.0.0.tar.bz2
	tar -xjvf amrnb-11.0.0.0.tar.bz2
	cd amrnb-11.0.0.0
	./configure
	make
	make install
	cd .. 
	rm -rf amrnb*
}
Install_amrwb()
{
	cd ${runPath}
	wget http://www.penguin.cz/~utx/ftp/amr/amrwb-11.0.0.0.tar.bz2
	tar -xjvf amrwb-11.0.0.0.tar.bz2
	cd amrwb-11.0.0.0
	./configure
	make
	make install
	cd ..
	rm -rf amrwb*
}
Install_nasm()
{
	wget -O nasm-2.13.03.tar.xz https://cdn.jsdelivr.net/gh/Moe-XW/CDN/nasm-2.13.03.tar.xz
	tar xvJf nasm-2.13.03.tar.xz
	rm -rf nasm-2.13.03.tar.xz
	cd nasm-2.13.03
	sed -e '/seg_init/d'                      \
    -e 's/pure_func seg_alloc/seg_alloc/' \
    -i include/nasmlib.h
	./configure --prefix=/usr &&
	make
	sudo make install
	cd ..
	rm -rf nasm-2.13.03
}
Install_x264()
{
	wget https://cdn.jsdelivr.net/gh/Moe-XW/CDN/x264.zip
	unzip x264.zip
	cd x264
	./configure --enable-static --enable-share
	make && make install
}
Install_ffmpeg()
{
	cd ${runPath}
	wget https://ffmpeg.org/releases/ffmpeg-4.2.1.tar.bz2
	tar -xjvf ffmpeg-4.2.1.tar.bz2
	cd ffmpeg-4.2.1
	./configure --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-version3 --enable-shared --enable-libx264 --enable-gpl
	make
	make install
	
	
	ldconfig
}

Install_yasm
Install_lame
Install_amr
Install_amrnb
Install_amrwb
Install_nasm
Install_x264
Install_ffmpeg