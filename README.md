# ActivePython Docker image

ActiveState's official docker image for ActivePython 2.7.

## Usage

```
docker pull activestate/activepython:2.7
docker run -i -t activestate/activepython:2.7 python
...
docker run -i -t activestate/activepython:2.7 bash
> pypm install lxml readline ipython
> ipython ...
```
