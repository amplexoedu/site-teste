# Publica a nova página inicial (branch novo-site) no site oficial amplexoedu.com.
# Copia SOMENTE os arquivos da nova home para o branch main.
# Nunca leva CNAME nem robots.txt do ambiente de teste (isso derrubaria o site oficial).
# Uso (na raiz do repositório):  powershell -File scripts/publicar-novo-site.ps1

$ErrorActionPreference = 'Stop'
$arquivos = @('index.html', 'css/home-v2.css', 'js/home-v2.js', 'assets/images/v2')

if (git status --porcelain) { throw 'Existem alterações não salvas. Faça commit ou descarte antes de publicar.' }

git fetch origin
git switch main
git pull --ff-only origin main
git checkout novo-site -- $arquivos
git commit -m "Publica a nova página inicial"

Write-Host ''
Write-Host 'Pronto! O commit foi criado no branch main (ainda não está no ar).'
Write-Host 'Confira com:  git show --stat'
Write-Host 'Publique com: git push origin main'
