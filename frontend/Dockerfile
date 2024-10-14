# Utiliser l'image de base officielle de Node.js
FROM node:22

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste de l'application
COPY . .

# Construire l'application pour la production
RUN npm run build

# Exposer le port sur lequel l'application va tourner
EXPOSE 5173

# Commande pour démarrer l'application
CMD ["npm", "run", "dev"]