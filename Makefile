linux:
	CGO_ENABLED=0 GOOS=linux go build -o buildoutput/prom-forever
	docker build --no-cache -t behemphi/prom-server-config .

osx:
	go build -o buildoutput/prom-forever

