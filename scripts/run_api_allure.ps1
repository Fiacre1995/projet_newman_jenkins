Write-Host "Nettoyage des anciens rapports..."
Remove-Item -Recurse -Force allure-results, allure-report -ErrorAction SilentlyContinue

Write-Host "Exécution Newman..."
newman run collections/Users.postman_collection.json `
 -e environnements/Dev.postman_environment.json `
 -r allure

# Afficher le code de sortie de Newman pour info
Write-Host "Code retour Newman: $LASTEXITCODE"

if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠️ Newman a échoué, mais on continue quand même pour générer le rapport" -ForegroundColor Yellow
}

Write-Host "Génération du rapport Allure..."
allure generate .\allure-results\ -o allure-report

Write-Host "Ouverture du rapport..."
allure open allure-report
