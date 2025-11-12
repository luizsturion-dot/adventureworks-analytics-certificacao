# adventureworks-analytics-certificacao
Repositório para o desafio da CEA da Indicium Academy

# 🚴 Adventure Works - Desafio de Certificação em Engenharia de Analytics (CEA)

Este repositório contém a solução completa para o Desafio de Certificação em Engenharia de Analytics da Indicium, baseado no contexto da empresa **Adventure Works**.

O projeto visa construir um Modern Analytics Stack (ELT) utilizando dbt, para modelar dados de vendas da empresa e fornecer insights estratégicos através de um dashboard de Self-Service BI.

## 🎯 Objetivo do Projeto

Transformar os dados transacionais (OLTP) da Adventure Works em um Data Warehouse (DW) otimizado, seguindo o modelo dimensional, a fim de responder às principais perguntas de negócio da diretoria, garantindo a qualidade e a veracidade das informações (Data Quality).

## 📊 Arquitetura do Modern Analytics Stack

| Componente | Ferramenta Escolhida | Finalidade |
| :--- | :--- | :--- |
| **Ingestão (EL)** | Dados fornecidos no schema `raw_adventure_works` | Fonte de dados brutos (PostgreSQL/Cloud DW). |
| **Data Warehouse (DW)** | [Snowflake] | Destino e armazenamento dos dados transformados. |
| **Transformação (T)** | **dbt Cloud** | Modelagem dimensional e aplicação das regras de negócio e testes. |
| **Visualização (BI)** | [[NOME DA FERRAMENTA] BI - Ex: Google Data Studio/Power BI] | Criação de dashboards interativos para Self-Service BI. |

---
***[AJUSTAR] 

## 💻 Estrutura do Repositório (Projeto dbt)

O projeto dbt segue a metodologia de camadas para garantir modularidade e reusabilidade:

adventureworks-analytics-certificacao/
├── models/
│   ├── staging/        # Camada de Staging (STG): Limpeza e seleção de colunas das tabelas RAW.
│   │   ├── stg_salesorderheader.sql
│   │   └── ...
│   ├── intermediate/   # Camada Intermediária (INT): Lógica complexa de JOINs antes do Mart. (Ex: int_customer_person_consolidated.sql)
│   │   └── ...
│   └── marts/          # Camada de Marts (DIM/FCT): Modelos finais prontos para consumo do BI.
│       ├── core/       # Modelos Fato e Dimensão Principais.
│       │   ├── dim_customer.sql
│       │   ├── dim_product.sql
│       │   └── fct_sales.sql
│       └── util/       # Dimensões de apoio. (Ex: dim_date.sql)
├── tests/              # Testes customizados (incluindo o teste de veracidade do CEO).
└── dbt_project.yml     # Configurações do projeto.

## ✅ Demonstração e Validações Chave

Este projeto foi validado conforme os requisitos da certificação:

1.  **Garantia de Qualidade:** Todos os testes de veracidade e integridade de dados foram implementados e passam com sucesso.
2.  **Modelagem Dimensional:** O modelo foi desenhado para atender às consultas do Item 4, com foco na Fato de Vendas e suas dimensões conformes.

### Comandos de Validação (Rodados no Vídeo):

| Comando | Propósito |
| :--- | :--- |
| `dbt run` | Execução bem-sucedida de todos os modelos (STG, INT, DIM, FCT). |
| `dbt test --select source:*` | Sucesso nos testes de integridade das fontes de dados brutos (RAW). |
| `dbt test` | Sucesso em todos os testes de modelo (PKs de Fato/Dimensão e Testes de Dados Customizados). |

---

[AJUSTAR]
## 🔗 Links de Entrega

| Item | Status | Link para Acesso |
| :--- | :--- | :--- |
| **Modelo Conceitual (PDF)** | **CONCLUÍDO** | [Disponibilizado na entrega final em arquivo ZIP/RAR] |
| **Dashboard de BI** | **CONCLUÍDO** | [INSERIR LINK DO DASHBOARD AQUI - Ex: Data Studio/Power BI File] |
| **Vídeo de Apresentação** | **CONCLUÍDO** | [INSERIR LINK DO VÍDEO AQUI - YouTube/Drive/Dropbox] |

---
[AJUSTAR]
*Desenvolvido por: [Seu Nome Completo]*
*Data de Conclusão: [Data]*