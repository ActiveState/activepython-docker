# ActivePython Docker image

ActiveState's official docker image for ActivePython 2.7.

## Usage

```
docker pull activestate/activepython
docker run -i -t activestate/activepython python
...
docker run -i -t activestate/activepython bash
> pypm install lxml readline ipython
> ipython ...
```