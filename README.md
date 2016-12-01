Docker iPerf
------------

Docker iPerf service

### Usage

Simple usage as server (run as server and exposes port 5201):
```
$ docker run -d -p 5201:5201 bkmeneguello/iperf
```

Advanced usage as server (custom "extra-args"):
```
$ docker run -d -p 5201:5201 bkmeneguello/iperf --server --port 5201 [ --extra-args ]
```

As client:
```
$ docker run --rm -it bkmeneguello/iperf --client <server> --port 5201 [ --extra-args ]
```

