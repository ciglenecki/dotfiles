#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  Moves downloaded files to subdirectories.
#################################

mkdir -p $HOME/Downloads/{image,zip,docs,video};
mv --backup=numbered $HOME/Downloads/*.{jpg,png,jpeg,gif,tiff,svg,webp} $HOME/Downloads/image
mv --backup=numbered $HOME/Downloads/*.{zip,tar,gz,7zip,tar,rar} $HOME/Downloads/zip
mv --backup=numbered $HOME/Downloads/*.{pdf,odt,doc,docx,txt,md,rtf,pptx,xls,xlsx,ppt} $HOME/Downloads/docs
mv --backup=numbered $HOME/Downloads/*.{mkv,webm,flv,vob,ogg,ogv,drc,gifv,mng,avi,mov,qt,wmv,yuv,rm,rmvb,asf,amv,mp4,m4v,mp,m?v,svi,3gp,flv,f4v} $HOME/Downloads/video
