FROM hashicorp/http-echo:latest

WORKDIR /app

ENTRYPOINT ["/http-echo"]

CMD ["-text", "Hello from the my technical assessment!", "-listen", ":5678"]
