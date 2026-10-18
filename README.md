# Protheus Docker Baselight 26.x.y.z

Imagem Docker base para execução do **TOTVS Protheus 12** (AppServer) em ambiente containerizado.

## Descrição

Este projeto monta uma imagem base Docker para rodar o AppServer do Protheus 12 sobre [Oracle Linux 9](https://tdn.totvs.com/display/tec/Application+Server+Protheus+-+Sistemas+operacionais), distribuição homologada pela TOTVS para o Application Server. A imagem é útil para ambientes de desenvolvimento, testes ou orquestração (Kubernetes, Docker Compose, etc.).

Em produção, o host que executa o container deve usar um kernel suportado (Red Hat Compatible Kernel — RHCK; o Unbreakable Enterprise Kernel — UEK — não é homologado). Dentro do container vale o userspace do Oracle Linux 9.

Esse projeto gera imagem base para a construção de imagens de AppServer para License e para Protheus 12.1.2410 ou 12.1.2510.

### Características

- **Base:** Oracle Linux 9 Slim
- **Protheus:** AppServer (porta TCP 1234)
- **REST API:** Habilitada na porta 8080 (`/api`)
- **HTTP Server:** Porta 9995 para conteúdo estático (`/rest`)
- **Configuração dinâmica:** Banco de dados definido via variável de ambiente `APPSERVER_DATABASE`

## Pré-requisitos

- Docker (com BuildKit habilitado para build)
- Host de build/execução `linux/amd64`

## Build

```bash
# Build local das tags de versão
make build
```

## Publicação da imagem

```bash
# Build e push das tags de versão
make release

# Incluir também a tag latest
make release_latest
```

Gera as tags:

- `feliperaposo/protheus-docker-baselight:26`
- `feliperaposo/protheus-docker-baselight:26.3.0.0`
- `feliperaposo/protheus-docker-baselight:latest`

## Estrutura interna (referência)

- **Entrypoint:** `/protheus.sh`
- **APO:** `/protheus12/apo/`
- **AppServer:** Descompactação automática de `appserver.tar.xz` em `/protheus12/bin/appserver` na primeira inicialização
- **Configuração:** `appserver.ini` (parâmetro `{{APPSERVER_DATABASE}}` substituído em runtime)
- **Protheus Data:** `/protheus12/protheus_data/`
- **SystemLoad:** Descompactação automática de `systemload.tar.xz` em `/protheus12/protheus_data/systemload` na primeira inicialização

## Licença

Este projeto está sob a [GNU General Public License v3.0](LICENSE).

## Mantenedor

Felipe Raposo — [feliperaposo@gmail.com](mailto:feliperaposo@gmail.com)
