Para esse projeto eu escolhi explorar tanto a base da dados [120 years of Olympic history: athletes and results](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results), que compreende dados dos Jogos Olímpicos de 1896 a 2016, quanto algumas funções em SQL. Já para a montagem da visualização usando Tableau, eu escolhi focar na disparidade de gênero ao longo das edições dos jogos.

**Dashboard:** [Gender differences in the Olympic Games](https://public.tableau.com/views/Olympics_17172774920210/Dashboard1?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)

### Conjunto de dados

O aquivo athlete_events.csv contém 271116 linhas e 15 colunas, onde cada linha corresponde a um atleta competindo em uma modalidade olímpica.

### Dicionário das variáveis

``ID`` - Número exclusivo de cada atleta

``Name`` - Nome do atleta

``Sex`` - M or F (masculino ou feminino)

``Age`` - Idade

``Height`` - Altura em centímetros

``Weight`` - Peso em quilogramas

``Team`` - Tome da equipe

``NOC`` - National Olympic Committee (código de três letras que identifica os comitês olímpicos de cada país)

``Games`` - Ano e Estação (Verão ou Inverno)

``Year`` - Ano

``Season`` - Verão ou inverno

``City`` - Cidade sede

``Sport`` - Esporte

``Event`` - Modalidade

``Medal`` - Ouro, Prata, Bronze ou NA

### Conclusões

Para além das informações encontradas, explorar esse conjunto de dados também foi um mergulho na história e na geografia mundial. Algumas das curiosidades encontradas foram:
* A edição dos jogos olímpicos com maior paritipação percentual de atletas femininas foi a dos jogos de verão de 2016, no Rio de Janeiro, com cerca de 45% de mulheres.
* Na primeira edição dos jogos modernos, em 1896, nenhuma mulher competiu. Na edição seguinte elas representaram 1,7% do total de atletas.
* O escultor estadunidense John Quincy Adams Ward foi pessoa mais velha a competir, com 97 anos. Outra curiosidade foi descobrir que, entre 1912 e 1948, o jogos olímpicos de verão premiaram obras de arte inspiradas pelo esporte nas áreas de arquitetura, literatura, música, pintura e escultura. 
* Já a pessoa mais nova a competir foi o ginasta grego Dimitrios Loundras, que nos jogos de 1896 tinha apenas 10 anos.
* Na primeira edição dos jogos de verão foram disputadas 43 modalidades diferentes, enquanto nos jogos de 2016 esse número foi 306. Já nos jogos de inverno, entre primeira a última edições analisadas (1924 a 2014) o salto foi de 17 a 98 modalidades.
