#######################################################################################
# Dados abertos (Lei nº 15.610/2021)
#######################################################################################

library(tidyverse)
library(magrittr)

#https://ssp.rs.gov.br/dados-abertos

#######################################################################################
# ARTIGO 3°
#######################################################################################

dados2021_art3 <- read_excel("Dados/SSP_LEI15610/Mensal_Art3/25080213-dados-abertos-ocorrencias-2022-01-ajustado-publicacao.xls") %>% 
  
  janitor::clean_names() %>% 
  dplyr::select(sequencia:cor_vitima) %>% 
  dplyr::filter(str_detect(tipo_enquadramento,
                           "^HOMICIDIO CULPOSO|^HOMICIDIO DOLOSO|^IMPORTUNACAO|^HOMOFOBIA|^ABUSO|^AMEACA|^ASSEDIO|^CONDUTO|^CONSTRANGIMENTO|^DIFAMACAO|^ESTUPRO|^EXPLORACAO|^FEMINICIDIO|^INJURIA|^LESAO CORPORAL GRAVE|^LESAO CORPORAL GRAVISSIMA|^LESAO CORPORAL LEVE|^LESAO CORPORAL SEGUIDA DE MORTE|^OUTROS CRIMES CONTRA A FAMILIA|^PERSEGUICAO|^SEQUESTRO|^VIOLACAO SEXUAL|^VIOLENCIA PSICOLOGICA"))


dados2022_art3 <- read_excel("Dados/SSP_LEI15610/Mensal_Art3/SPJ_DADOS_ABERTOS_OCORRENCIAS_JAN_DEZ_2022.xls") %>% 
  
  janitor::clean_names() %>% 
  dplyr::select(sequencia:cor_vitima) %>% 
  dplyr::filter(str_detect(tipo_enquadramento,
                           "^HOMICIDIO CULPOSO|^HOMICIDIO DOLOSO|^IMPORTUNACAO|^HOMOFOBIA|^ABUSO|^AMEACA|^ASSEDIO|^CONDUTO|^CONSTRANGIMENTO|^DIFAMACAO|^ESTUPRO|^EXPLORACAO|^FEMINICIDIO|^INJURIA|^LESAO CORPORAL GRAVE|^LESAO CORPORAL GRAVISSIMA|^LESAO CORPORAL LEVE|^LESAO CORPORAL SEGUIDA DE MORTE|^OUTROS CRIMES CONTRA A FAMILIA|^PERSEGUICAO|^SEQUESTRO|^VIOLACAO SEXUAL|^VIOLENCIA PSICOLOGICA"))


dados2023_art3 <- read_excel("Dados/SSP_LEI15610/Mensal_Art3/SPJ_DADOS_ABERTOS_OCORRENCIAS_JAN_DEZ_2023_em 06.01.2025.xls") %>% 
  
  janitor::clean_names() %>% 
  dplyr::select(sequencia:cor_vitima) %>% 
  dplyr::filter(str_detect(tipo_enquadramento,
                           "^HOMICIDIO CULPOSO|^HOMICIDIO DOLOSO|^IMPORTUNACAO|^HOMOFOBIA|^ABUSO|^AMEACA|^ASSEDIO|^CONDUTO|^CONSTRANGIMENTO|^DIFAMACAO|^ESTUPRO|^EXPLORACAO|^FEMINICIDIO|^INJURIA|^LESAO CORPORAL GRAVE|^LESAO CORPORAL GRAVISSIMA|^LESAO CORPORAL LEVE|^LESAO CORPORAL SEGUIDA DE MORTE|^OUTROS CRIMES CONTRA A FAMILIA|^PERSEGUICAO|^SEQUESTRO|^VIOLACAO SEXUAL|^VIOLENCIA PSICOLOGICA"))


dados2024_art3 <- read_excel("Dados/SSP_LEI15610/Mensal_Art3/SPJ_DADOS_ABERTOS_OCORRENCIAS_JAN_DEZ_2024 - Em 05.05.2025.xls") %>% 
  
  janitor::clean_names() %>% 
  dplyr::select(sequencia:cor_vitima) %>% 
  dplyr::filter(str_detect(tipo_enquadramento,
                           "^HOMICIDIO CULPOSO|^HOMICIDIO DOLOSO|^IMPORTUNACAO|^HOMOFOBIA|^ABUSO|^AMEACA|^ASSEDIO|^CONDUTO|^CONSTRANGIMENTO|^DIFAMACAO|^ESTUPRO|^EXPLORACAO|^FEMINICIDIO|^INJURIA|^LESAO CORPORAL GRAVE|^LESAO CORPORAL GRAVISSIMA|^LESAO CORPORAL LEVE|^LESAO CORPORAL SEGUIDA DE MORTE|^OUTROS CRIMES CONTRA A FAMILIA|^PERSEGUICAO|^SEQUESTRO|^VIOLACAO SEXUAL|^VIOLENCIA PSICOLOGICA"))


dados2025_art3 <- read_excel("Dados/SSP_LEI15610/Mensal_Art3/SPJ_DADOS_ABERTOS_OCORRENCIAS_JAN_ABR_2025 - Em 05.05.2025.xls") %>% 
  
  janitor::clean_names() %>% 
  dplyr::select(sequencia:cor_vitima) %>% 
  dplyr::filter(str_detect(tipo_enquadramento,
                           "^HOMICIDIO CULPOSO|^HOMICIDIO DOLOSO|^IMPORTUNACAO|^HOMOFOBIA|^ABUSO|^AMEACA|^ASSEDIO|^CONDUTO|^CONSTRANGIMENTO|^DIFAMACAO|^ESTUPRO|^EXPLORACAO|^FEMINICIDIO|^INJURIA|^LESAO CORPORAL GRAVE|^LESAO CORPORAL GRAVISSIMA|^LESAO CORPORAL LEVE|^LESAO CORPORAL SEGUIDA DE MORTE|^OUTROS CRIMES CONTRA A FAMILIA|^PERSEGUICAO|^SEQUESTRO|^VIOLACAO SEXUAL|^VIOLENCIA PSICOLOGICA"))


#######################################################################################
# ARTIGO 6° - III
#######################################################################################

dados2021_2PC_art6 <- readr::read_delim("Dados/SSP_LEI15610/Semestral_Art6/PC - Art. 6 Inc. III - Vitimas Mulheres de Violencia Domestica e Familiar_2021_2.csv", 
                                                                                         delim = ";", escape_double = FALSE, trim_ws = TRUE)
######
#2022
#####

dados2022_1PC_art6 <- read_delim("Dados/SSP_LEI15610/Semestral_Art6/Art. 6 Inc. III - Vitimas Mulheres de Violencia Domestica e Familiar_2022_1.csv", 
                                                                                      delim = ";", escape_double = FALSE, trim_ws = TRUE)


dados2022_2PC_art6 <- read_delim("Dados/SSP_LEI15610/Semestral_Art6/Art. 6 Inc. III - Vitimas Mulheres de Violencia Domestica e Familiar_2022_2.csv", 
                                                                                      delim = ";", escape_double = FALSE, trim_ws = TRUE)

dados2022_PCart6III <- dados2022_1PC_art6 %>% 
  dplyr::bind_rows(dados2022_2PC_art6)

######
#2023
#####

dados2023_1PC_art6 <- read_csv("Dados/SSP_LEI15610/Semestral_Art6/Art. 6 Inc. III - Vitimas Mulheres de Violencia Domestica e Familiar -  1o sem 2023 - atualizado ago 2024.csv")


dados2023_2PC_art6 <- read_csv("Dados/SSP_LEI15610/Semestral_Art6/Art. 6 Inc. III - Vitimas Mulheres de Violencia Domestica e Familiar  2o sem 2023 - atualizado ago 2024.csv")

dados2023_PCart6III <- dados2023_1PC_art6 %>% 
  dplyr::bind_rows(dados2023_2PC_art6)



######
#2024
#####

dados2024_1PC_art6 <- read_delim("Dados/SSP_LEI15610/Semestral_Art6/16164348-1-semestre-2022/PC/Art. 6 Inc. III - Vitimas Mulheres de Violencia Domestica e Familiar.csv", 
                                                                               delim = ";", escape_double = FALSE, trim_ws = TRUE)

dados2024_2PC_art6 <- read_csv("Dados/SSP_LEI15610/Semestral_Art6/Art. 6 Inc. III - Vitimas Mulheres de Violencia Domestica e Familiar_2024_2.csv")


dados2024_PCart6III <- dados2024_1PC_art6 %>% 
  dplyr::bind_rows(dados2024_2PC_art6)


#######################################################################################
# ARTIGO 6° - XVIII
#######################################################################################

######
#2022
#####

dados2022_1PC_art6XIII <- read_delim("Dados/SSP_LEI15610/Semestral_Art6/16164348-1-semestre-2022/PC/Art. 6 Inc. XIII -Procedimentos Remetidos de Crimes Dolosos Consumados.csv", 
                                                                                  delim = ";", escape_double = FALSE, trim_ws = TRUE)

dados2022_2PC_art6XIII <- read_delim("Dados/SSP_LEI15610/Semestral_Art6/16164333-2-semestre-2022/PC/Art. 6 Inc. XIII -Procedimentos Remetidos de Crimes Dolosos Consumados .csv", 
                                                                                   delim = ";", escape_double = FALSE, trim_ws = TRUE)

dados2022_PCart6XIII <- dados2022_1PC_art6XIII %>% 
  dplyr::bind_rows(dados2022_2PC_art6XIII)


######
#2024
#####

dados2024_1PC_art6XIII <- read_excel("Dados/SSP_LEI15610/Semestral_Art6/20100111-1-semestre-2024/12024_xiii.xls")

dados2024_2PC_art6XIII <- read_excel("Dados/SSP_LEI15610/Semestral_Art6/17170826-2-semestre-2024/PC - Dados do 2º. Semestre de 2024/22024_xiii.xls")


dados2024_PCart6XIII <- dados2024_1PC_art6XIII %>% 
  dplyr::bind_rows(dados2024_2PC_art6XIII)












