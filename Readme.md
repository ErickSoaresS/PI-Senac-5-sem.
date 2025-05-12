# PROJETO INTEGRADOR: APOIO DECISÓRIO AOS NEGÓCIOS

## Objetivo

Desenvolver um fluxo de ETL em Python para coletar, transformar e armazenar dados socioeconômicos do IBGE em um banco de dados SQL Server, permitindo sua análise por ferramentas como Power BI.

---

## Tecnologias Utilizadas

- *Python*: Linguagem principal para o processo ETL
  - requests para chamadas HTTP à API do IBGE
  - pandas para manipulação e transformação dos dados
  - pyodbc para conexão com o SQL Server
- *SQL Server*: Banco de dados relacional para armazenar os dados
- *Power BI*: Ferramenta de BI utilizada para análise e visualização
- *GitHub Actions* (opcional): Para automatizar a execução do processo
- *Windows Task Scheduler / cron*: Agendamento local da coleta

---

## Fonte de Dados

Os dados são extraídos da API pública do IBGE (Instituto Brasileiro de Geografia e Estatística):

- Documentação: https://servicodados.ibge.gov.br/api/docs

---

## Detalhamento Técnico

### 1. Extração

Arquivo: scripts/extracao.py  
- Conecta à API do IBGE
- Extrai dados em formato JSON
- Salva como DataFrame para tratamento posterior

### 2. Transformação

Arquivo: scripts/transformacao.py  
- Remove dados inconsistentes
- Padroniza formatos de datas, números, strings
- Aplica regras de negócio específicas
- Salva dataset limpo

### 3. Carga

Arquivo: scripts/carga.py  
- Usa pyodbc para conectar ao SQL Server
- Executa comandos de inserção
- Estrutura de banco definida em sql/ddl_criacao_tabelas.sql


# Autores 

Caique Henrique Leite
Caio Cesar Leão Coelho
Erick Soares da Silva
