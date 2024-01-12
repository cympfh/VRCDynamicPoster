.DEFAULT_GOAL := add
DOCKER_TAG := vrc-dynamic-poster
ID :=
TAG :=

add:
	bash script/add.sh $(ID) $(TAG)

clean:
	rm -rf dst
	mkdir dst

build:
	docker build -t $(DOCKER_TAG) .
	docker run -v $(PWD)/dst:/app/dst --rm $(TAG) bash -c "dotnet restore && dotnet run"
	sudo chmod -R 755 dst
	sudo chown -R $(USER):$(USER) dst
	ffmpeg -loop 1 -i dst/index.bmp -vcodec libx264 -crf 1 -pix_fmt yuv420p -t 2 -r 1 -y dst/index.mp4
	ffmpeg -r 0.5 -i dst/%d.png -vcodec libx264 -crf 1 -pix_fmt yuv420p -r 2 -y dst/poster.mp4
