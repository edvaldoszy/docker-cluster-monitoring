# docker-cluster-monitoring

Esta stack de aplicações tem como objetivo facilitar o monitoramento de um cluster [Docker](https://www.docker.com).

## Sumário

- [Portainer](#portainer)


## Portainer

Configure o arquivo `portainer.env` com as variáveis a seguir, substituindo `my-secret` por uma chave secreta de sua preferência.

```shell
AGENT_CLUSTER_ADDR=tasks.agent
AGENT_SECRET=my-secret
```

Crie agora a rede responsável pela conexão dos componentes do Portainer com o comando:

```shell
$ docker network create --scope swarm --driver overlay
```

No terminal do cluster, faça o deploy da stack com o comando:

```shell
$ docker strack deploy -f portainer-stack.yml portainer
```

Agora deve estar disponível na porta `9000` o acesso à interface do [Portainer](https://www.portainer.io).
