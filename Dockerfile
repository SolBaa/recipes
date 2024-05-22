# Usa la imagen oficial de Ruby como imagen base
FROM ruby:3.1.2

# Instala dependencias de sistema
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  yarn \
  postgresql-client \
  libpq-dev \
  build-essential

# Establece el directorio de trabajo en /rails
WORKDIR /rails

# Copia el archivo Gemfile y Gemfile.lock
COPY Gemfile /rails/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Instala las gemas
RUN bundle install

# Copia el resto del código de la aplicación
COPY . /rails

# Instala dependencias de JavaScript (si es necesario)
# RUN yarn install --check-files

# Precompila los assets (si es necesario)
RUN bundle exec rake assets:precompile

# Exponer el puerto 3000
EXPOSE 3000

# Comando para iniciar el servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
