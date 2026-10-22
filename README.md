# Protheus Docker Baselight 26.x.y.z (Arara Azul)

Imagem Docker base para execução do **TOTVS Protheus 12** (AppServer) em ambiente containerizado.

## Descrição

Este projeto monta uma imagem base Docker para rodar o AppServer do Protheus 12 sobre [Oracle Linux 9](https://tdn.totvs.com/display/tec/Application+Server+Protheus+-+Sistemas+operacionais), distribuição homologada pela TOTVS para o Application Server. A imagem é útil para ambientes de desenvolvimento, testes ou orquestração (Kubernetes, Docker Compose, etc.).

Em produção, o host que executa o container deve usar um kernel suportado (Red Hat Compatible Kernel — RHCK; o Unbreakable Enterprise Kernel — UEK — não é homologado). Dentro do container vale o userspace do Oracle Linux 9.

A imagem gerada é `feliperaposo/protheus-docker-baselight:26`. O [protheus-docker-base:26](https://github.com/Felipe-Raposo/protheus-docker-base-26) parte dela, e o Protheus 12.1.2610 parte dessa base.

Se estiver buscando um ambiente completo com Protheus + License + dbAccess + Postgres, acesse esse [projeto](https://github.com/Felipe-Raposo/protheus-docker-compose).

### Características

- **Base:** Oracle Linux 9 Slim (`oraclelinux:9-slim`)
- **Protheus:** AppServer 26.3.0.0, extraído de `appserver.tar.xz` para `/protheus12/bin/appserver` durante o build
- **Pacotes:** `tar`, `xz` e `dmidecode`

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

## Licença

Este projeto está sob a [GNU General Public License v3.0](LICENSE).

## Mantenedor

Felipe Raposo — [feliperaposo@gmail.com](mailto:feliperaposo@gmail.com)
