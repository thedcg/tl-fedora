# Makefile: Generate Dockerfile's

.PHONY: all
.PHONY: dockerfiles


all: dockerfiles


TAGS = \
       fedora-37 \
       fedora-38 \
       fedora-39 \
       fedora-latest \
       fedora-rawhide \


dockerfiles:
	for TAG in $(TAGS); do \
	  mkdir -p $${TAG}; \
	  cat "Dockerfile.base.$${TAG}" \
	      "Dockerfile.common" \
	      > $${TAG}/Dockerfile; \
	done
