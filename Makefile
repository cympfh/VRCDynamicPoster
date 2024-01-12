.DEFAULT_GOAL := add
ID :=
TAG :=

add:
	bash script/add.sh $(ID) $(TAG)

clean:
	rm -rf docs
	mkdir docs

build:
	bash script/build.sh
