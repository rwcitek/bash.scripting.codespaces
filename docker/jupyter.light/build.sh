
# Remove existing image, if exists
docker image rm rwcitek/jupyter.light

# Build a new image
docker image build --tag rwcitek/jupyter.light ./.

## Push to Docker Hub
#docker image push rwcitek/jupyter.light
