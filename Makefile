build: build-worker build-server

build-worker:
	bazel run //worker:worker.container

build-server:
	bazel run //server:server.container