FROM rocksolidknowledge/adminui:5.6.2

USER root

# https://github.com/dotnet/SqlClient/issues/220
RUN apk add --no-cache icu-libs
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

COPY ./certs/localhost.crt /usr/local/share/ca-certificates/localhost.crt
RUN update-ca-certificates

USER identityexpress
