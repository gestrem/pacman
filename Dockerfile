FROM quay-registry-quay-quay-enterprise.apps.cluster-15ad.15ad.sandbox422.opentlc.com/goldenimages/nodejs:latest
# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
USER 0
ADD . /tmp/src
RUN chown -R 1001:0 /tmp/src
USER 1001

# Install the dependencies
RUN /usr/libexec/s2i/assemble

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run



