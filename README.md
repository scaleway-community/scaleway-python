# Official python image on Scaleway

[![Travis](https://img.shields.io/travis/scaleway-community/scaleway-python.svg)](https://travis-ci.org/scaleway-community/scaleway-python)
[![Scaleway ImageHub](https://img.shields.io/badge/ImageHub-view-ff69b4.svg)](https://hub.scaleway.com/python.html)
[![Run on Scaleway](https://img.shields.io/badge/Scaleway-run-69b4ff.svg)](https://cloud.scaleway.com/#/servers/new?image=d6a95608-0a09-4829-8b54-2bebed739f0b)

Scripts to build the official Python image on Scaleway

This image is built using [Image Tools](https://github.com/scaleway/image-tools) and depends on the official [Ubuntu](https://github.com/scaleway/image-ubuntu) image.

<img src="http://upload.wikimedia.org/wikipedia/commons/f/f8/Python_logo_and_wordmark.svg" width="400px" />


---

**This image is meant to be used on a Scaleway server.**

We use the Docker's building system and convert it at the end to a disk image that will boot on real servers without Docker. Note that the image is still runnable as a Docker container for debug or for inheritance.

[More info](https://github.com/scaleway/image-tools)


---

## How to hack

You can see the documentation to craft your own image with our [image-builder](https://github.com/scaleway/image-builder)

---

A project by [![Scaleway](https://avatars1.githubusercontent.com/u/5185491?v=3&s=42)](https://www.scaleway.com/)
