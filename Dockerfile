FROM curlimages/curl as builder

WORKDIR /home/curl_user

RUN curl -LO https://github.com/sethvargo/vault-secrets-gen/releases/download/v0.1.1/vault-secrets-gen_0.1.1_linux_amd64.zip
RUN unzip vault-secrets-gen_0.1.1_linux_amd64.zip

FROM vault:1.6.2

COPY --from=builder /home/curl_user/vault-secrets-gen_v0.1.1 /bin/vault-secrets-gen