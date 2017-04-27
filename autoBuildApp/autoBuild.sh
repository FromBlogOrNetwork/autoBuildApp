#!/bin/sh
#如果打包的是xcodeproj的项目名称
PROJECT_NAME="ClshUser"
#如果打包的是xcworkspace的项目名称
WORKSPACE_NAME="ClshUser"
#Xcode8之后需要配置exportOptionsPlist
EXPORTOPTIONPLIST="/Users/kobe/Desktop/autoBuildApp/exportOptions.plist"
#归档存储的文件路径
SAVEPATH="/Users/kobe/Desktop/autoBuildApp/bin"

#删除bin文件下的目录
rm -rf ${SAVEPATH}

#如果是打包xcodeproj编译方法 build archive
#xcodebuild archive -project ${PROJECT_NAME}.xcodeproj -scheme ${PROJECT_NAME} -configuration Release -sdk iphoneos -archivePath ${SAVEPATH}/${PROJECT_NAME}.xcarchive
#export ipa
#xcodebuild -exportArchive -archivePath ${SAVEPATH}/${WORKSPACE_NAME}.xcarchive -exportPath ${SAVEPATH}/${WORKSPACE_NAME}.ipa -exportOptionsPlist ${EXPORTOPTIONPLIST}

# 如果是打包xcworkspace编译方法
xcodebuild archive -workspace ${WORKSPACE_NAME}.xcworkspace -scheme ${WORKSPACE_NAME} -configuration Release -sdk iphoneos -archivePath ${SAVEPATH}/${WORKSPACE_NAME}.xcarchive
#export ipa
xcodebuild -exportArchive -archivePath ${SAVEPATH}/${WORKSPACE_NAME}.xcarchive -exportPath ${SAVEPATH}/${WORKSPACE_NAME}.ipa -exportOptionsPlist ${EXPORTOPTIONPLIST}

#上传Fir
FirApiToken="162c99e18005b9f1639b4fe129d536b4"
IPAPath="${SAVEPATH}/${WORKSPACE_NAME}.ipa/${WORKSPACE_NAME}.ipa"
fir publish "${IPAPath}" -T "${FirApiToken}"
