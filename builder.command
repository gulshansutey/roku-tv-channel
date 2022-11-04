cd ~/VisualStudioWorkspace/roku-tv-channel/builds
count=$(ls -1 | wc -l | tr -d " ")
cd ~/VisualStudioWorkspace/roku-tv-channel
filename=roku_build_${count}
echo $filename
zip -r builds/$filename components images manifest source