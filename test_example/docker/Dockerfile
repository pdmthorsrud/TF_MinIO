FROM hashicorpnomad/counter-api:v1

# Allow buildtime config
ARG TEST_DOWNLOAD_BUILD_ARGUMENT

RUN apk --no-cache add curl=~7
# Test download TODO: Add certificate trust
RUN curl -s -I -o /dev/null $TEST_DOWNLOAD_BUILD_ARGUMENT || true