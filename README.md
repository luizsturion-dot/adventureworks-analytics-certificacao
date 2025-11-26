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
| **Visualização (BI)** | [Power BI] | Criação de dashboards interativos para Self-Service BI. |

---

## 💻 Estrutura do Repositório dbt

O projeto segue uma estrutura de camadas para garantir a modularidade, reusabilidade e clareza (STG → INT → Marts).

```text
adventureworks-analytics-certificacao/
├── models/
│   ├── staging/        # Camada de Staging (STG)
│   │   └──erp/
│   │       ├── erp.yml
│   │       ├── stg_erp__address.sql
│   │       ├── stg_erp__countryregion.sql
│   │       ├── stg_erp__creditcard.sql
│   │       ├── stg_erp__customer.sql
│   │       ├── stg_erp__person.sql
│   │       ├── stg_erp__personcreditcard.sql
│   │       ├── stg_erp__product.sql
│   │       ├── stg_erp__salesorderdetail.sql
│   │       ├── stg_erp__salesorderheader.sql
│   │       ├── stg_erp__salesorderheadersalesreason.sql
│   │       ├── stg_erp__salesreason.sql
│   │       ├── stg_erp__salesterritory.sql
│   │       ├── stg_erp__stateprovince.sql
│   │       └── stg_erp__store.sql
│   ├── intermediate/   # Camada Intermediária (INT)
│   │   ├── int_clientprofile.sql
│   │   ├── int_location.sql
│   │   ├── int_product.sql
│   │   ├── int_sales__metrics.sql
│   │   └── int_salesreason.sql
│   └── marts/          # Camada de Marts (DIM/FCT)
│       ├── dim_clientprofile.sql
│       ├── dim_clientprofile.yml
│       ├── dim_location.sql
│       ├── dim_location.yml
│       ├── dim_product.sql
│       ├── dim_product.yml
│       ├── dim_reasons.sql
│       ├── dim_reasons.yml
│       ├── fct_sales.sql
│       └── fct_sales.yml
├── tests/              # Testes customizados
│    └── tst_gross_total_sales_2011.sql 
├── dbt_project.yml
├── package-lock.yml
└── dbt_project.yml     # Configurações do projeto
```

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

## 🔗 Links de Entrega

| Item | Status | Link para Acesso |
| :--- | :--- | :--- |
| **Drive com entregas** | **CONCLUÍDO** | [https://drive.google.com/drive/folders/1UptzXqCB2qIKp6F72PpMhFUGUFxM5WL5?usp=sharing] |
| **Modelo Conceitual (PDF)** | **CONCLUÍDO** | [Disponibilizado na entrega final em arquivo ZIP/RAR] |
| **Dashboard de BI** | **CONCLUÍDO** | [Disponibilizado na entrega final em arquivo ZIP/RAR] |
| **Vídeo de Apresentação** | **CONCLUÍDO** | [INSERIR LINK DO VÍDEO AQUI - YouTube/Drive/Dropbox] |

---
*Desenvolvido por: Luiz Henrique Chueire Sturion*
*Data de Conclusão: [27/11/2025]*