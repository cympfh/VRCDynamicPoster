.DEFAULT_GOAL := add
ID :=
TAG :=

add:
	bash script/add.sh $(ID) $(TAG)

clean:
	rm -rf dst
	mkdir dst

build:
	bash script/build.sh
