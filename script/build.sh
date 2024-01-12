#!/bin/bash

DOCKER_TAG=vrc-dynamic-poster

tags() {
	cat asset/README | awk '{print $1}'
}
docker build -t ${DOCKER_TAG} .

for t in $(tags); do
	if ( ! ls asset/$t/*.png >/dev/null 2>&1 ); then
		echo "Skip $t"
		continue
	fi

	echo "Building $t"
	docker run -v ${PWD}/docs:/app/docs --rm ${DOCKER_TAG} \
		bash -c "dotnet run -- asset/$t docs/$t"
	sudo chmod -R 755 docs
	sudo chown -R $USER:$USER docs
	ffmpeg -loop 1 -i docs/$t/index.bmp -vcodec libx264 -crf 1 -pix_fmt yuv420p -t 2 -r 1 -y docs/$t/index.mp4
	ffmpeg -r 0.5 -i docs/$t/%d.png -vcodec libx264 -crf 1 -pix_fmt yuv420p -r 2 -y docs/$t/poster.mp4
done
