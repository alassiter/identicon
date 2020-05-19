FROM elixir:1.10.3

COPY lib ./lib
COPY mix.exs .
COPY mix.lock .

RUN mix local.rebar --force \
    && mix local.hex --force \
    && mix deps.get \
    && mix release

RUN apk add --no-cach --update bash openssl

CMD ["_build/prod/rel/my-app/bin/my-app", "start"]