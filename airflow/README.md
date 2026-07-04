# Apache Airflow - Pipeline de Dados para Aprendizado de Máquina

## Sobre o projeto

Este repositório disponibiliza um ambiente completo do **Apache
Airflow** utilizando **Docker** para apoiar o desenvolvimento do projeto
de mestrado.

O objetivo é fornecer uma plataforma para orquestrar o processo de **ETL
(Extract, Transform and Load)** dos dados utilizados na disciplina de
**Aprendizado de Máquina**, permitindo automatizar todas as etapas de
preparação dos dados antes da construção dos modelos.

Durante o desenvolvimento do projeto será implementado um exemplo
completo de **Pipeline de Dados**, demonstrando como ferramentas de
Engenharia de Dados podem ser utilizadas para alimentar aplicações de
Machine Learning de forma organizada, reproduzível e escalável.

------------------------------------------------------------------------

## O que é o Apache Airflow?

O **Apache Airflow** é uma plataforma Open Source criada para
**orquestrar, agendar e monitorar fluxos de trabalho (workflows)**.

Entre suas principais funcionalidades estão:

-   Agendamento automático de tarefas;
-   Execução de pipelines ETL;
-   Controle de dependências entre tarefas;
-   Monitoramento da execução;
-   Registro de logs;
-   Reexecução de tarefas com falha;
-   Interface Web para acompanhamento das DAGs.

Neste projeto, o Airflow será responsável por automatizar o pipeline de
ingestão e preparação dos dados utilizados nas atividades de Aprendizado
de Máquina.

------------------------------------------------------------------------

## Arquitetura

O ambiente Docker é composto por:

-   Apache Airflow Webserver
-   Apache Airflow Scheduler
-   Apache Airflow Worker (Celery)
-   Apache Airflow Triggerer
-   PostgreSQL
-   Redis

Toda a infraestrutura é criada automaticamente utilizando Docker
Compose.

------------------------------------------------------------------------

## Estrutura do projeto

``` text
.
├── dags/
├── plugins/
├── logs/
├── config/
├── scripts/
├── requirements.txt
├── Dockerfile
├── docker-compose.yaml
├── executavel_mac.sh
└── .env
```

------------------------------------------------------------------------

## Pré-requisitos

-   Docker Desktop
-   Docker Compose

Verifique a instalação:

``` bash
docker --version
docker compose version
```

------------------------------------------------------------------------

## Configuração

Clone o repositório:

``` bash
git clone <url-do-repositorio>
cd <repositorio>
```

Crie um arquivo `.env`:

``` env
AIRFLOW_UID=50000
_AIRFLOW_WWW_USER_USERNAME=admin
_AIRFLOW_WWW_USER_PASSWORD=admin123
```

------------------------------------------------------------------------

## Instalação no macOS/Linux

Conceda permissão ao script:

``` bash
chmod +x executavel_mac.sh
```

Execute:

``` bash
./executavel_mac.sh
```

O script realiza automaticamente:

-   criação da rede Docker `MESTRADO` (caso não exista);
-   criação das pastas necessárias;
-   build da imagem Docker;
-   inicialização dos containers.

------------------------------------------------------------------------

## Instalação manual

Criar a rede:

``` bash
docker network create MESTRADO
```

Criar diretórios:

``` bash
mkdir -p dags logs plugins config
```

Construir a imagem:

``` bash
docker compose build
```

Subir os containers:

``` bash
docker compose up -d
```

------------------------------------------------------------------------

## Acesso ao Airflow

Após a inicialização:

**URL**

http://localhost:8080

Utilize o usuário e senha definidos no arquivo `.env`.

------------------------------------------------------------------------

## Pipeline de Dados

O Airflow será utilizado para orquestrar o seguinte fluxo:

``` text
Extração dos Dados
        │
        ▼
Transformação
        │
        ▼
Validação
        │
        ▼
Carga
        │
        ▼
Preparação para Machine Learning
        │
        ▼
Treinamento dos Modelos
```

Cada etapa será implementada por meio de uma DAG (Directed Acyclic
Graph).

------------------------------------------------------------------------

## Objetivo no Projeto de Mestrado

Este ambiente faz parte do projeto de mestrado e será utilizado como
apoio à disciplina de **Aprendizado de Máquina**.

O objetivo é demonstrar, na prática, a construção de um pipeline
completo de Engenharia de Dados utilizando o Apache Airflow para
automatizar processos de ETL, desde a ingestão dos arquivos até a
disponibilização dos dados para algoritmos de Machine Learning.

Ao longo do desenvolvimento serão abordados:

-   Ingestão de dados;
-   Transformação e padronização;
-   Validação da qualidade dos dados;
-   Carga dos dados processados;
-   Automação de pipelines;
-   Monitoramento das execuções;
-   Integração entre Engenharia de Dados e Aprendizado de Máquina.

Este projeto busca aproximar os conceitos estudados em sala de aula das
práticas adotadas em ambientes reais de dados.