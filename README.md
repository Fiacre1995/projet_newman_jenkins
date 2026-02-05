# Installer newman 
npm install -g newman

# Installer Reporter json (Pour le rapport)
npm install -g newman-reporter-json

# Installer newman Allure Report
npm install -g newman-reporter-allure

# Exécuté mes tests avec newman
newman run collections/Users.postman_collection.json \ -e environnements/Dev.postman_environment.json

# Générer un rapport avec Allure report
Pré-requis (Supprimer ce qui existait) : Remove-Item -Recurse -Force allure-results, allure-report

1- newman run collections/Users.postman_collection.json \ -e environnements/Dev.postman_environment.json \ -r allure
2- allure generate .\allure-results\ -o allure-report 
3- allure open allure-report

# Générer en une ligne de commande avec allure report
Remove-Item -Recurse -Force allure-results, allure-report; newman run collections/Users.postman_collection.json -e environnements/Dev.postman_environment.json -r allure; allure generate .\allure-results\ -o allure-report; allure open allure-report
