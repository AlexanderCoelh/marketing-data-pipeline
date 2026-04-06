# 📊 Marketing Data Pipeline & Dashboard de Análise de Clientes

## 📌 Visão Geral
Este projeto tem como objetivo construir um **pipeline de dados completo para análise de campanhas de marketing e comportamento dos clientes**, utilizando **SQL Server e Power BI**.

O processo cobre desde a **extração dos dados em CSV**, passando pela **limpeza, modelagem e criação de views no SQL Server**, até a **construção de dashboards interativos no Power BI**, permitindo gerar insights sobre perfil dos clientes, receita, comportamento de compra e performance de campanhas.

![Preview do Dashboard](./powerbi/dashboard-preview.png)

---

## 🛠️ Tecnologias Utilizadas
- SQL Server (modelagem de dados, views e transformações)
- Power BI (dashboard e visualização de dados)
- Git / GitHub (versionamento e portfólio)
- CSV (fonte de dados original)

---

## ⚙️ Estrutura do Projeto

### 1. Fonte de Dados
- Dataset de marketing em formato CSV

### 2. Camadas do Pipeline
O projeto foi estruturado em camadas para garantir organização e qualidade dos dados:

- **RAW:** dados brutos importados diretamente do arquivo CSV
- **STAGING:** camada intermediária para limpeza, padronização e tratamento dos dados
- **VIEWS:** camada analítica com tabelas prontas para consumo no dashboard

Fluxo do pipeline:

```text
CSV → RAW → STAGING → VIEWS → POWER BI
```

---

## 🗂️ Estrutura dos Scripts SQL
Os scripts SQL foram organizados em etapas para representar todo o pipeline de dados, desde a criação do banco até a modelagem final das views utilizadas no dashboard.

- `01_create_database.sql` → criação do banco de dados
- `02_create_raw_table.sql` → criação da tabela bruta
- `03_import_csv.sql` → importação dos dados do arquivo CSV
- `04_backup_table.sql` → backup da tabela original
- `05_stg_table.sql` → criação da camada de staging
- `06_clean_stg_table.sql` → limpeza e padronização dos dados
- `07_create_views.sql` → criação das views analíticas utilizadas no Power BI

---

## 🧱 Modelagem de Dados
Criação de views estruturadas para análise:

- `vw_customer_profile`
- `vw_customer_activity`
- `vw_customer_spending`
- `vw_campaign_performance`
- `vw_products_revenue`
- `vw_campaign_conversion`

---

## 📊 Dashboard
O dashboard foi desenvolvido no Power BI com foco em análise de negócio e storytelling de dados.

**Principais indicadores:**
- Total de clientes
- Receita total
- Total de compras
- Taxa de resposta às campanhas
- Total de reclamações

**Visualizações:**
- Distribuição de renda dos clientes
- Produtos com maior faturamento
- Perfil familiar dos clientes
- Status dos clientes
- Conversão entre campanhas anteriores e campanha atual

---

## 📈 Principais Insights
- Vinhos representam a categoria com maior faturamento, com receita superior a R$ 680 mil
- Clientes de renda média representam a maior parcela da base
- Clientes com filhos representam a maior parcela do público analisado
- Campaign 2 apresentou a maior taxa de resposta, com 66,67%

---

## 🎯 Objetivos do Projeto
- Entender o comportamento dos clientes  
- Identificar campanhas mais eficientes  
- Analisar padrões de consumo  
- Criar uma base estruturada para Business Intelligence  
- Desenvolver visualizações interativas para tomada de decisão  

---

## 🚀 Próximas Melhorias
- Adicionar análise temporal das campanhas
- Criar segmentação de clientes
- Aplicar análise preditiva
- Expandir os KPIs de performance

---

## 📎 Sobre
Este projeto foi desenvolvido como parte do meu aprendizado em **Análise de Dados e Business Intelligence**, com foco em **SQL, modelagem de dados, visualização de dados e construção de dashboards no Power BI**.
