#!/bin/bash

set -e

info() {
  echo -e "\033[1;34m$1\033[0m"
}

warn() {
  echo "::warning :: $1"
}

error() {
  echo "::error :: $1"
  exit 1
}

source_file="${1}"

info "Rendering..."
manim "$source_file" -qm
if [ $? -ne 0 ]; then
  error "manim render error"
fi

info "Searching outputs..."
cnt=0
videos_path="/github/workspace/media/videos/"
for sce in $scene_names; do
  video=$(find ${videos_path} -name "${sce}.mp4" -o -name "${sce}.mov" -o -name "${sce}.png")
  output[$cnt]=$video
  cnt=$cnt+1
done

mkdir /github/workspace/outputs
for file in ${output[@]}; do
  cp $file "/github/workspace/outputs/"
done

echo "All ${#output[@]} outputs: ${output[@]}"
ls /github/workspace/outputs
echo "::set-output name=video_path::./outputs/*"
