
#!/bin/bash

inotifywait -mr $HOME/Downloads -e close_write -e moved_to |
	while read file; do
	mkdir -p $HOME/Downloads/{pics,zips,docs,videos};
	mv --backup=numbered $HOME/Downloads/*.{jpg,png,jpeg,gif,tiff,svg,webp} $HOME/Downloads/pics &
	mv --backup=numbered $HOME/Downloads/*.{zip,tar,gz,7zip,tar,rar} $HOME/Downloads/zips &
	mv --backup=numbered $HOME/Downloads/*.{pdf,odt,doc,docx,txt,md,rtf,pptx,xls,xlsx,ppt} $HOME/Downloads/docs &
	mv --backup=numbered $HOME/Downloads/*.{mkv,webm,flv,vob,ogg,ogv,drc,*gifv,mng,avi$,mov,qt,wmv,yuv,rm,rmvb,asf,amv,mp4,m4v,mp,m?v,svi,3gp,flv,f4v} $HOME/Downloads/videos &
	done
