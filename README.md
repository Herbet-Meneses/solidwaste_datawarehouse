![image](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/e246d313-205e-4505-816c-3e24675083f1)


Análise de requisitos

Uma empresa de gerenciamento de resíduos sólidos coleta e recicla resíduos em algumas cidades do Brasil. Essa empresa opera centenas de caminhões para coletar e transportar os resíduos gerados. A empresa gostaria de criar um data warehouse  e a partir dele poder gerar relatórios, visualizações e portanto analisar informações relacionadas a operação do negócio.

Objetivos

1. Projetar e implementar um Data Warehouse;
2. Carregar dados no Data Warehouse;
3. Escrever querys de agregação e views;
4. Criar dashboard;

O Projeto

O objetivo desse projeto é a criação de um sistema de armazenamento de dados modelado para armazenar, consultar e processar grandes volumes de dados.
Tomando como referência uma base de dados fornecida pela empresa como exemplo dos dados que deseja manipular.
O projeto é otimizado para suportar consultas analíticas e relatórios, permitindo que a organização analise seus dados para tomar decisões informadas.

Step1 – Analisar base de dados

Começamos analisando o dataset fornecido como modelo para o DW pretendido e identificando as colunas para as várias tabelas de dimensão e fato no esquema.
![image](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/077c4845-ea68-427f-9558-9edffe8eabd8)

Step 2 – Definir modelo

A solução proposta não necessita de complexidade nem normalização além do necessário portanto foi adotado o Star Schema para esse data warehouse que é uma solução simples em comparação ao Snowflake Schema, é eficaz para consultas rápidas e melhor para situações onde o desempenho é crucial e a simplicidade é preferível.

Step3 - Definir tabelas fato e dimensão

A empresa está buscando uma granularidade diária, o que significa que eles gostariam de ter a capacidade de gerar relatórios com base em anos, meses, dias e dias da semana.
![Screenshot 2023-10-30 093745](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/9ed73cf5-9d87-4f59-93a8-6071dd21bf26)

Step 4 – Iniciar RDBMS(PostgresSQL) e Criar Database

Via terminal ou PgAdmin.

    start_postgres
    
    createdb -h localhost -U postgres -p 5432 solidwasteDW

Step 5 – Criar Diagrama Entidade Relacionamento (ERD)

Via PgAdmin -  solidwasteDW > Generate ERD

![image](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/19372f9f-3f19-493c-8502-f9dddc22b104)

Step 6 – Gerar modelo físico

Generate SQL > Run script > refresh

Step 7 – ETL para carregar DW

Processo ETL pode ser realizado de diversas maneiras, poderia ser utilizando código python e suas bibliotecas como pandas para segmentar os dados em arquivos a fim de atender ao esquema do DW. Ou mesmo Pyspark dependendo do volume de processamento. O ETL não é objeto desse projeto.

Step 8 – Popular DW

Via PgAdmin Importar dados transformados e checar carregamento no DW
![9-DimDate](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/2f86cd76-af06-4621-b5e4-df88a5d10634)
![10-DimTruck](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/314059a4-ddd3-44e4-b87a-59451e46b752)
![11-DimStation](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/565c4e39-085d-45c2-911e-953e79322bf7)
![12-FactTrips](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/c5472c03-2e6e-4243-81b0-f4fa8c060602)

Step 9 – Elaborar algumas querys de agrupamento(grouping sets, rollup, cube) e materialized views

![13-groupingsets](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/e14017f4-606a-49f1-b4c9-75e2213a017c)
![14-rollup](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/58b306f3-df3d-4919-99bc-da25f91ba538)
![15-cube](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/571b0014-e21f-407c-a1f8-9f35e13673eb)
![16-mqt](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/e9385380-e6a0-4891-a3cf-283f21840af7)

Step 10 – Criar dashborard interativo para visualização de dados

![Screenshot 2023-10-30 091317](https://github.com/Herbet-Meneses/solidwaste_datawarehouse/assets/142064420/0d63368e-46ee-4bd7-a720-2b80edd52960)

