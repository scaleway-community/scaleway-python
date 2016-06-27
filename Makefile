NAME =			python
VERSION =		latest
VERSION_ALIASES =
TITLE =			Python
DESCRIPTION =		Python
SOURCE_URL =		https://github.com/scaleway-community/scaleway-python
VENDOR_URL =		https://www.python.org/
DEFAULT_IMAGE_ARCH =	x86_64


IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT =	stable
IMAGE_NAME =		Python


# Forward ports
SHELL_DOCKER_OPTS ?=    -p 80 -p 443 -p 8000


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - https://j.mp/scw-builder | bash
-include docker-rules.mk
