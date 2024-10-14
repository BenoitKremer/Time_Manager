# Utiliser l'image de base Elixir
FROM elixir:1.17

# Installer les dépendances du système
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev && \
    mix local.hex --force && \
    mix local.rebar --force

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier mix.exs et mix.lock
COPY mix.exs mix.lock ./

# Installer les dépendances
RUN mix deps.get && \
    mix deps.compile

# Copier le reste de l'application
COPY . .

# Compiler l'application
RUN mix compile

# Exposer le port par défaut de Phoenix
EXPOSE 4000

# Lancer l'application Phoenix
CMD ["mix", "phx.server"]
