#!/bin/sh
echo
echo
echo "*********ipa打包工具************"
echo
read -t 60 -p "请输入.app工程路径:" path
app=".app"
if [[ ! $path == *$app ]];then
echo "输入文件格式错误!"
exit 0
fi

str=$path;
str=${str//// };
arr=($str);
filename=${arr[@]: -1}
today=`date +%Y-%m-%d-%H-%M`
basepath=`dirname $0`
filePath=$basepath"/$today"
rm -rf $filePath
mkdir $filePath
loadPath=$filePath"/Payload"
mkdir $loadPath
cp -r $path $loadPath
cp Icon.png iOS/iTunesArtwork
cd $filePath
zip -r iOS.ipa Payload iTunesArtwork
rm -rf $loadPath
exit 0
