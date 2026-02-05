#######################################################################################
# Dados abertos (Lei nº 15.610/2021)
#######################################################################################
options(scipen = 999)

library(tidyverse)
library(magrittr)
library(readxl)
library(here)
setwd("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/MVIOL/dados_completos/Dados")
here::set_here("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/MVIOL/dados_completos/Dados")

#https://ssp.rs.gov.br/dados-abertos

#######################################################################################
# ARTIGO 3°
#######################################################################################

###########################
# ANO: 2021
###########################

dados2021_art3 <- read_excel(here("SSP_LEI15610","Mensal_Art3", "25080213-dados-abertos-ocorrencias-2022-01-ajustado-publicacao.xlsx")) %>% 
  
  janitor::clean_names() %>% 
  dplyr::select(sequencia:cor_vitima) %>% 
  dplyr::filter(str_detect(tipo_enquadramento,
                           "^HOMICIDIO CULPOSO|^HOMICIDIO DOLOSO|^IMPORTUNACAO|^HOMOFOBIA|^ABUSO|^AMEACA|^ASSEDIO|^CONDUTO|^CONSTRANGIMENTO|^DIFAMACAO|^ESTUPRO|^EXPLORACAO|^FEMINICIDIO|^INJURIA|^LESAO CORPORAL GRAVE|^LESAO CORPORAL GRAVISSIMA|^LESAO CORPORAL LEVE|^LESAO CORPORAL SEGUIDA DE MORTE|^OUTROS CRIMES CONTRA A FAMILIA|^PERSEGUICAO|^SEQUESTRO|^VIOLACAO SEXUAL|^VIOLENCIA PSICOLOGICA"))

###########################
# ANO: 2022
###########################

dados2022_art3 <- read_excel(here("SSP_LEI15610/Mensal_Art3/SPJ_DADOS_ABERTOS_OCORRENCIAS_JAN_DEZ_2022.xls")) %>% 
  
  janitor::clean_names() %>% 
  dplyr::select(sequencia:cor_vitima) %>% 
  dplyr::filter(str_detect(tipo_enquadramento,
                           "^HOMICIDIO CULPOSO|^HOMICIDIO DOLOSO|^IMPORTUNACAO|^HOMOFOBIA|^ABUSO|^AMEACA|^ASSEDIO|^CONDUTO|^CONSTRANGIMENTO|^DIFAMACAO|^ESTUPRO|^EXPLORACAO|^FEMINICIDIO|^INJURIA|^LESAO CORPORAL GRAVE|^LESAO CORPORAL GRAVISSIMA|^LESAO CORPORAL LEVE|^LESAO CORPORAL SEGUIDA DE MORTE|^OUTROS CRIMES CONTRA A FAMILIA|^PERSEGUICAO|^SEQUESTRO|^VIOLACAO SEXUAL|^VIOLENCIA PSICOLOGICA"))

###########################
# ANO: 2023
###########################

dados2023_art3 <- read_excel(here("SSP_LEI15610/Mensal_Art3/SPJ_DADOS_ABERTOS_OCORRENCIAS_JAN_DEZ_2023_em 06.01.2025.xls")) %>% 
  
  janitor::clean_names() %>% 
  dplyr::select(sequencia:cor_vitima) %>% 
  dplyr::filter(str_detect(tipo_enquadramento,
                           "^HOMICIDIO CULPOSO|^HOMICIDIO DOLOSO|^IMPORTUNACAO|^HOMOFOBIA|^ABUSO|^AMEACA|^ASSEDIO|^CONDUTO|^CONSTRANGIMENTO|^DIFAMACAO|^ESTUPRO|^EXPLORACAO|^FEMINICIDIO|^INJURIA|^LESAO CORPORAL GRAVE|^LESAO CORPORAL GRAVISSIMA|^LESAO CORPORAL LEVE|^LESAO CORPORAL SEGUIDA DE MORTE|^OUTROS CRIMES CONTRA A FAMILIA|^PERSEGUICAO|^SEQUESTRO|^VIOLACAO SEXUAL|^VIOLENCIA PSICOLOGICA"))

###########################
# ANO: 2024
###########################

dados2024_art3 <- read_excel(here("SSP_LEI15610/Mensal_Art3/SPJ_DADOS_ABERTOS_OCORRENCIAS_JAN_DEZ_2024 - Em 05.05.2025.xlsx"))  
dados2024_art3 <- dados2024_art3 %>% 
  janitor::clean_names() 
# %>% 
#   dplyr::select(sequencia:cor_vitima) %>% 
#   dplyr::filter(str_detect(tipo_enquadramento,
#                            "^HOMICIDIO CULPOSO|^HOMICIDIO DOLOSO|^IMPORTUNACAO|^HOMOFOBIA|^ABUSO|^AMEACA|^ASSEDIO|^CONDUTO|^CONSTRANGIMENTO|^DIFAMACAO|^ESTUPRO|^EXPLORACAO|^FEMINICIDIO|^INJURIA|^LESAO CORPORAL GRAVE|^LESAO CORPORAL GRAVISSIMA|^LESAO CORPORAL LEVE|^LESAO CORPORAL SEGUIDA DE MORTE|^OUTROS CRIMES CONTRA A FAMILIA|^PERSEGUICAO|^SEQUESTRO|^VIOLACAO SEXUAL|^VIOLENCIA PSICOLOGICA"))


library(dplyr)
library(stringr)

dados_enquadramento <- table(dados2024_art3$tipo_enquadramento)
dados_enquadramento <- base::as.data.frame(dados_enquadramento)

dados_classificados <- dados2024_art3 %>%
  dplyr::mutate(
    classificacao = case_when(
      
      # ===============================
      # 1. CRIMES CONTRA A MULHER
      # ===============================
      tipo_enquadramento %in% c(
        "VIOLENCIA PSICOLOGICA CONTRA MULHER ART 147B",
        "DESCUMPRIMENTO DE MEDIDA PROTETIVA DE URGENCIA",
        "FEMINICIDIO ART 121 PAR 2 VI",
        "IMPORTUNACAO SEXUAL",
        "ESTUPRO",
        "VIOLACAO SEXUAL MEDIANTE FRAUDE"
      ) ~ "Crimes contra a mulher",
      
      # ===============================
      # 2. CRIMES CONTRA A DIGNIDADE SEXUAL
      # ===============================
      tipo_enquadramento %in% c(
        "ASSEDIO SEXUAL",
        "EXPLORACAO SEXUAL INFANTO-JUVENIL",
        "CASA DE PROSTITUICAO",
        "CONDUTAS RELACIONADAS À PEDOFILIA NA INTERNET",
        "RUFIANISMO",
        "PORNOGRAFIA INFANTO-JUVENIL",
        "SATISFACAO DE LASCIVIA MEDIANTE PRESENCA DE CRIANCA OU ADOLESCENTE"
      ) ~ "Crimes contra a dignidade sexual",
      
      # ===============================
      # 3. CRIMES CONTRA A PESSOA
      # ===============================
      tipo_enquadramento %in% c(
        "AMEACA",
        "LESAO CORPORAL",
        "LESAO CORPORAL LEVE",
        "LESAO CORPORAL GRAVE",
        "LESAO CORPORAL GRAVISSIMA",
        "LESAO CORPORAL SEGUIDA DE MORTE",
        "LESAO CORPORAL CULPOSA",
        "LESAO CORPORAL CULPOSA DIRECAO VEIC AUTOMOTOR",
        "VIAS DE FATO",
        "HOMICIDIO DOLOSO",
        "HOMICIDIO CULPOSO",
        "HOMICIDIO CULPOSO DIRECAO VEIC AUTOMOTOR",
        "HOMICIDIO DECORRENTE DE OPOSICAO A INTERVENCAO POLICIAL",
        "SEQUESTRO E CARCERE PRIVADO",
        "SEQUESTRO RELAMPAGO",
        "PERSEGUICAO",
        "MAUS TRATOS",
        "VIOLACAO DE DOMICILIO",
        "VIOLACAO DE SEPULTURA",
        "VILIPENDIO A CADAVER",
        "RIXA",
        "PERIGO A VIDA/SAUDE DE OUTREM",
        "INCENDIO DOLOSO",
        "INCENDIO CULPOSO",
        "INFANTICIDIO",
        "INDUZIMENTO INSTIGAO AUXILIO AO SUICIDIO OU A AUTOMULTILAO"
      ) ~ "Crimes contra a pessoa",
      
      # ===============================
      # 4. CRIMES CONTRA O PATRIMÔNIO
      # ===============================
      tipo_enquadramento %in% c(
        "ESBULHO POSSESSORIO",
        "FURTO SIMPLES",
        "FURTO QUALIFICADO",
        "FURTO DE VEICULO",
        "FURTO EM VEICULO",
        "FURTO DE TELEFONE CELULAR",
        "FURTO DE DOCUMENTO",
        "FURTO DE FIOS E CABOS",
        "FURTO ABIGEATO",
        "FURTO DE ARMA",
        "FURTO DE CARGA EM CAMINHAO",
        "FURTO DE COISA COMUM ART 156  SUBTRAIR O CONDOMINO COHERDEIRO OU SOCIO PARA SI OU PARA OUTREM A QUEM LEGITIMAMENTE A DETEM A COISA COMUM",
        "FURTO DE DEFENSIVO AGRICOLA",
        "FURTO QUALIFICADO EM VEICULO",
        "FURTO SIMPLES EM RESIDENCIA",
        "FURTO VEICULO AUTOMOTOR TRANSPORTE OUTRO ESTADO",
        "FURTO/ARROMBAMENTO",
        "FURTO/ARROMBAMENTO A CAIXA ELETRONICO",
        "FURTO/ARROMBAMENTO A ESTABELECIMENTO DE ENSINO",
        "FURTO/ARROMBAMENTO DE RESIDENCIA",
        "FURTO/ARROMBAMENTO ESTABELECIMENTO BANCARIO",
        "FURTO/ARROMBAMENTO ESTABELECIMENTO COMERCIAL",
        "OUTROS FURTOS",
        "ROUBO A PEDESTRE",
        "ROUBO DE VEICULO",
        "ROUBO DE TELEFONE CELULAR",
        "ROUBO A RESIDENCIA",
        "ROUBO COM LESOES",
        "ROUBO COM MORTE",
        "OUTROS ROUBOS",
        "EXTORSAO",
        "EXTORSAO MEDIANTE SEQUESTRO",
        "ESTELIONATO",
        "ESTELIONATO  FRAUDE ELETRONICA",
        "ESTELIONATO  FRAUDE COM A UTILIZACAO DE ATIVOS VIRTUAIS VALORES MOBILIARIOS OU ATIVOS FINANCEIROS",
        "DANO",
        "RECEPTACAO",
        "RECEPTACAO CULPOSA",
        "RECEPTACAO QUALIFICADA",
        "RECEPTACAO DE VEICULO",
        "RECEPTACAO DE ANIMAL",
        "OUTRAS FRAUDES",
        "APROPRIACAO INDEBITA",
        "FRAUDE A CREDORES",
        "FRAUDE NO COMERCIO",
        "FRAUDE NO PAGAMENTO POR MEIO DE CHEQUE"
      ) ~ "Crimes contra o patrimônio",
      
      # ===============================
      # 5. CRIMES CONTRA A HONRA
      # ===============================
      tipo_enquadramento %in% c(
        "CALUNIA",
        "DIFAMACAO",
        "INJURIA",
        
        "DENUNCIACAO CALUNIOSA"
      ) ~ "Crimes contra a honra",
      
      # ===============================
      # 6. CRIMES CONTRA A ADMINISTRAÇÃO PÚBLICA
      # ===============================
      tipo_enquadramento %in% c(
        "CORRUPCAO ATIVA",
        "CONCUSSAO",
        "PECULATO",
        "TRAFICO DE INFLUENCIA",
        "FAVORECIMENTO REAL",
        "FAVORECIMENTO PESSOAL",
        "PREVARICACAO",
        "EXERCICIO ARBITRARIO OU ABUSO DE PODER",
        "EXERCICIO ARBITRARIO PROPRIAS RAZOES",
        "USURPACAO DE FUNCAO PUBLICA",
        "ORGANIZACAO CRIMINOSA ART 2 DA LEI 12850 DE 2013",
        "VIOLACAO DE SIGILO FUNCIONAL",
        "RESISTENCIA"
      ) ~ "Crimes contra a administração pública",
      
      # ===============================
      # 7. CRIMES CONTRA A FÉ PÚBLICA
      # ===============================
      tipo_enquadramento %in% c(
        "FALSIDADE IDEOLOGICA",
        "FALSIFICACAO DE DOCUMENTOS PARTICULARES",
        "FALSIFICACAO DE PAPEIS/DOCUMENTOS PUBLICOS",
        "FALSO TESTEMUNHO OU FALSA PERICIA",
        "USO DE DOCUMENTO FALSO",
        "FALSA IDENTIDADE",
        "SIMULACAO QUALIDADE DE FUNCIONARIO",
        "USO ILEGITIMO DE UNIFORME OU DISTINTIVO",
        "EXTRAVIO SONEGACAO OU INUTILIZACAO DE LIVRO OU DOCUMENTO",
        "SUBTRACAO OU INUTILIZACAO DE LIVRO OU DOCUMENTO",
        "VIOLACAO DE CORRESPONDENCIA"
      ) ~ "Crimes contra a fé pública",
      
      # ===============================
      # 8. CRIMES RELACIONADOS A ARMAS
      # ===============================
      tipo_enquadramento %in% c(
        "DISPARO DE ARMA DE FOGO",
        "PORTE ILEGAL DE ARMA DE FOGO DE USO PERMITIDO",
        "POSSE IRREGULAR DE ARMA DE FOGO DE USO PERMITIDO",
        "POSSE OU PORTE ILEGAL DE ARMA DE FOGO DE USO PROIBIDO",
        "POSSE OU PORTE ILEGAL DE ARMA DE FOGO DE USO RESTRITO",
        "PORTE ARMA BRANCA",
        "FABRICO COMERCIO OU DENTENCAO DE ARMA BRANCA OU MUNICAO",
        "FORNECER ARMA, MUNICAO, EXPLOSIVO A CRIANCA/ADOLESCENTE",
        "COMERCIO ILEGAL DE ARMA DE FOGO",
        "TRAFICO INTERNACIONAL DE ARMA DE FOGO"
      ) ~ "Crimes relacionados a armas",
      
      # ===============================
      # 9. CRIMES DE TRÂNSITO
      # ===============================
      tipo_enquadramento %in% c(
        "EMBRIAGUEZ ART 306",
        "EMBRIAGUEZ - ART. 306",
        "DIRECAO PERIGOSA (RACHA) ART 308",
        "DIRIGIR SEM HABILITACAO GERANDO PERIGO DE DANO ART. 309",
        "FUGA DE LOCAL DE ACIDENTE - ART. 305",
        "VIOLAR A SUSPENSAO OU PROIBICAO DE DIRIGIR VEICULO ART.307",
        "TRAFEGAR COM VELOCIDADE INCOMPATIVEL COM A SEGURANCA ART.311",
        "INOVAR ARTIFICIOSAMENTE,EM CASO DE ACIDENTE TRANSITO ART.312",
        "PERMITIR,CONFIAR,OU ENTREG. DIRECAO A PESSOA S/HABIL.ART 310"
      ) ~ "Crimes de trânsito",
      
      # ===============================
      # 10. CRIMES RELACIONADOS A DROGAS
      # ===============================
      tipo_enquadramento %in% c(
        "ENTORPECENTES - TRAFICO",
        "ENTORPECENTE  ASSOCIACAO",
        "ENTORPECENTES  POSSE"
      ) ~ "Crimes relacionados a drogas",
      
      # ===============================
      # 11. CRIMES CONTRA CRIANÇAS E ADOLESCENTES
      # ===============================
      tipo_enquadramento %in% c(
        "ABANDONO DE INCAPAZ",
        "SUBTRACAO DE INCAPAZ",
        "ESTUPRO DE VULNERAVEL",
        "SERVIR BEBIDA ALCOOLICA A VULNERAVEIS",
        "FORNECER PRODUTOS CRIANCA/ADOLESCENTE QUE CAUSAM DEPENDENCIA",
        "OUTROS CRIMES CONTRA A CRIANCA/ADOLESCENTE"
      ) ~ "Crimes contra crianças e adolescentes",
      
      # ===============================
      # 12. CRIMES DE DISCRIMINAÇÃO
      # ===============================
      tipo_enquadramento %in% c(
        "HOMOFOBIA TRANSFOBIA",
        "PRECONCEITO RACA COR",
        "PRECONCEITO DE RACA E COR",
        "PRECONCEITO DEFICIENCIA",
        "PRECONCEITO ETNIA PROCEDENCIA NACIONAL",
        "PRECONCEITO RELIGIAO",
        "INJURIA DISCRIMINATORIA",
        "APOLOGIA AO NAZISMO",
        "INJURIA QUALIFICADA  RACA COR ETNIA RELIGIAO OU ORIGEM"
      ) ~ "Crimes de discriminação",
      
      # ===============================
      # 13. CRIMES CONTRA GRUPOS VULNERÁVEIS
      # ===============================
      tipo_enquadramento %in% c(
        "ABANDONO DE PESSOA COM DEFICIENCIA",
        "OUTROS CRIMES CONTRA O IDOSO",
        "DISCRIMINACAO CONTRA O IDOSO",
        "ABANDONO DE IDOSO",
        "DISCRIMINACAO A PESSOA COM DEFICIENCIA",
        "OMISSAO DE SOCORRO CONTRA O IDOSO",
        "MAUS TRATOS CONTRA O IDOSO",
        "APROPRIACAO INDEBITA DE BEM DE IDOSO",
        "RETENCAO DO CARTAO DE PESSOA COM DEFICIENCIA"
      ) ~ "Crimes contra grupos vulneráveis",
      
      # ===============================
      # 14. CRIMES AMBIENTAIS E CONTRA ANIMAIS
      # ===============================
      tipo_enquadramento %in% c(
        "CRIME DE POLUICAO E OUTROS CRIMES AMBIENTAIS",
        "CRIMES CONTRA A FAUNA",
        "CRIMES CONTRA A FLORA",
        "OUTROS CRIMES CONTRA MEIO AMBIENTE",
        "CRUELDADE CONTRA ANIMAIS",
        "OMISSAO DE CAUTELA NA GUARDA OU CONDUCAO DE ANIMAIS",
        "SUPRESSAO OU ALTERACAO DE MARCA EM ANIMAIS",
        "USURPACAO DE AGUAS"
      ) ~ "Crimes ambientais e contra animais",
      
      # ===============================
      # 15. OUTROS
      # ===============================
      TRUE ~ "Outros crimes"
    )
  )



library(ggplot2)
dados_classificados %>% 
  dplyr::group_by(classificacao) %>% 
  dplyr::count() %>% 
ggplot() +
 aes(x = classificacao, y = n) +
 geom_bar(stat = "summary", fun = "sum", 
 fill = "#1513B9") +
 labs(x = "Crimes", y = "Número absoluto") +
 coord_flip() +
 theme_gray() +
 theme(axis.text.y = element_text(face = "bold"))


##################################

dados_classificados %>% 
  janitor::tabyl(classificacao, sexo_vitima, show_na = FALSE) %>% 
  janitor::adorn_percentages()

##################################

##################################
# SEXO: FEMININO
##################################

dados_enquadramento_M <- dados2024_art3 %>% 
  dplyr::filter(sexo_vitima == "Feminino") %>% 
  mutate(
    classificacao = case_when(
      
      # ===============================
      # 1. CRIMES CONTRA A MULHER
      # ===============================
      tipo_enquadramento %in% c(
        "VIOLENCIA PSICOLOGICA CONTRA MULHER ART 147B",
        "DESCUMPRIMENTO DE MEDIDA PROTETIVA DE URGENCIA",
        "FEMINICIDIO ART 121 PAR 2 VI",
        "IMPORTUNACAO SEXUAL",
        "ESTUPRO",
        "VIOLACAO SEXUAL MEDIANTE FRAUDE"
      ) ~ "Crimes contra a mulher",
      
      # ===============================
      # 2. CRIMES CONTRA A DIGNIDADE SEXUAL
      # ===============================
      tipo_enquadramento %in% c(
        "ASSEDIO SEXUAL",
        "EXPLORACAO SEXUAL INFANTO-JUVENIL",
        "CASA DE PROSTITUICAO",
        "CONDUTAS RELACIONADAS À PEDOFILIA NA INTERNET",
        "RUFIANISMO",
        "PORNOGRAFIA INFANTO-JUVENIL",
        "SATISFACAO DE LASCIVIA MEDIANTE PRESENCA DE CRIANCA OU ADOLESCENTE"
      ) ~ "Crimes contra a dignidade sexual",
      
      # ===============================
      # 3. CRIMES CONTRA A PESSOA
      # ===============================
      tipo_enquadramento %in% c(
        "AMEACA",
        "LESAO CORPORAL",
        "LESAO CORPORAL LEVE",
        "LESAO CORPORAL GRAVE",
        "LESAO CORPORAL GRAVISSIMA",
        "LESAO CORPORAL SEGUIDA DE MORTE",
        "LESAO CORPORAL CULPOSA",
        "LESAO CORPORAL CULPOSA DIRECAO VEIC AUTOMOTOR",
        "VIAS DE FATO",
        "HOMICIDIO DOLOSO",
        "HOMICIDIO CULPOSO",
        "HOMICIDIO CULPOSO DIRECAO VEIC AUTOMOTOR",
        "HOMICIDIO DECORRENTE DE OPOSICAO A INTERVENCAO POLICIAL",
        "SEQUESTRO E CARCERE PRIVADO",
        "SEQUESTRO RELAMPAGO",
        "PERSEGUICAO",
        "MAUS TRATOS",
        "VIOLACAO DE DOMICILIO",
        "VIOLACAO DE SEPULTURA",
        "VILIPENDIO A CADAVER",
        "RIXA",
        "PERIGO A VIDA/SAUDE DE OUTREM",
        "INCENDIO DOLOSO",
        "INCENDIO CULPOSO",
        "INFANTICIDIO",
        "INDUZIMENTO INSTIGAO AUXILIO AO SUICIDIO OU A AUTOMULTILAO"
      ) ~ "Crimes contra a pessoa",
      
      # ===============================
      # 4. CRIMES CONTRA O PATRIMÔNIO
      # ===============================
      tipo_enquadramento %in% c(
        "ESBULHO POSSESSORIO",
        "FURTO SIMPLES",
        "FURTO QUALIFICADO",
        "FURTO DE VEICULO",
        "FURTO EM VEICULO",
        "FURTO DE TELEFONE CELULAR",
        "FURTO DE DOCUMENTO",
        "FURTO DE FIOS E CABOS",
        "FURTO ABIGEATO",
        "FURTO DE ARMA",
        "FURTO DE CARGA EM CAMINHAO",
        "FURTO DE COISA COMUM ART 156  SUBTRAIR O CONDOMINO COHERDEIRO OU SOCIO PARA SI OU PARA OUTREM A QUEM LEGITIMAMENTE A DETEM A COISA COMUM",
        "FURTO DE DEFENSIVO AGRICOLA",
        "FURTO QUALIFICADO EM VEICULO",
        "FURTO SIMPLES EM RESIDENCIA",
        "FURTO VEICULO AUTOMOTOR TRANSPORTE OUTRO ESTADO",
        "FURTO/ARROMBAMENTO",
        "FURTO/ARROMBAMENTO A CAIXA ELETRONICO",
        "FURTO/ARROMBAMENTO A ESTABELECIMENTO DE ENSINO",
        "FURTO/ARROMBAMENTO DE RESIDENCIA",
        "FURTO/ARROMBAMENTO ESTABELECIMENTO BANCARIO",
        "FURTO/ARROMBAMENTO ESTABELECIMENTO COMERCIAL",
        "OUTROS FURTOS",
        "ROUBO A PEDESTRE",
        "ROUBO DE VEICULO",
        "ROUBO DE TELEFONE CELULAR",
        "ROUBO A RESIDENCIA",
        "ROUBO COM LESOES",
        "ROUBO COM MORTE",
        "OUTROS ROUBOS",
        "EXTORSAO",
        "EXTORSAO MEDIANTE SEQUESTRO",
        "ESTELIONATO",
        "ESTELIONATO  FRAUDE ELETRONICA",
        "ESTELIONATO  FRAUDE COM A UTILIZACAO DE ATIVOS VIRTUAIS VALORES MOBILIARIOS OU ATIVOS FINANCEIROS",
        "DANO",
        "RECEPTACAO",
        "RECEPTACAO CULPOSA",
        "RECEPTACAO QUALIFICADA",
        "RECEPTACAO DE VEICULO",
        "RECEPTACAO DE ANIMAL",
        "OUTRAS FRAUDES",
        "APROPRIACAO INDEBITA",
        "FRAUDE A CREDORES",
        "FRAUDE NO COMERCIO",
        "FRAUDE NO PAGAMENTO POR MEIO DE CHEQUE"
      ) ~ "Crimes contra o patrimônio",
      
      # ===============================
      # 5. CRIMES CONTRA A HONRA
      # ===============================
      tipo_enquadramento %in% c(
        "CALUNIA",
        "DIFAMACAO",
        "INJURIA",
        
        "DENUNCIACAO CALUNIOSA"
      ) ~ "Crimes contra a honra",
      
      # ===============================
      # 6. CRIMES CONTRA A ADMINISTRAÇÃO PÚBLICA
      # ===============================
      tipo_enquadramento %in% c(
        "CORRUPCAO ATIVA",
        "CONCUSSAO",
        "PECULATO",
        "TRAFICO DE INFLUENCIA",
        "FAVORECIMENTO REAL",
        "FAVORECIMENTO PESSOAL",
        "PREVARICACAO",
        "EXERCICIO ARBITRARIO OU ABUSO DE PODER",
        "EXERCICIO ARBITRARIO PROPRIAS RAZOES",
        "USURPACAO DE FUNCAO PUBLICA",
        "ORGANIZACAO CRIMINOSA ART 2 DA LEI 12850 DE 2013",
        "VIOLACAO DE SIGILO FUNCIONAL",
        "RESISTENCIA"
      ) ~ "Crimes contra a administração pública",
      
      # ===============================
      # 7. CRIMES CONTRA A FÉ PÚBLICA
      # ===============================
      tipo_enquadramento %in% c(
        "FALSIDADE IDEOLOGICA",
        "FALSIFICACAO DE DOCUMENTOS PARTICULARES",
        "FALSIFICACAO DE PAPEIS/DOCUMENTOS PUBLICOS",
        "FALSO TESTEMUNHO OU FALSA PERICIA",
        "USO DE DOCUMENTO FALSO",
        "FALSA IDENTIDADE",
        "SIMULACAO QUALIDADE DE FUNCIONARIO",
        "USO ILEGITIMO DE UNIFORME OU DISTINTIVO",
        "EXTRAVIO SONEGACAO OU INUTILIZACAO DE LIVRO OU DOCUMENTO",
        "SUBTRACAO OU INUTILIZACAO DE LIVRO OU DOCUMENTO",
        "VIOLACAO DE CORRESPONDENCIA"
      ) ~ "Crimes contra a fé pública",
      
      # ===============================
      # 8. CRIMES RELACIONADOS A ARMAS
      # ===============================
      tipo_enquadramento %in% c(
        "DISPARO DE ARMA DE FOGO",
        "PORTE ILEGAL DE ARMA DE FOGO DE USO PERMITIDO",
        "POSSE IRREGULAR DE ARMA DE FOGO DE USO PERMITIDO",
        "POSSE OU PORTE ILEGAL DE ARMA DE FOGO DE USO PROIBIDO",
        "POSSE OU PORTE ILEGAL DE ARMA DE FOGO DE USO RESTRITO",
        "PORTE ARMA BRANCA",
        "FABRICO COMERCIO OU DENTENCAO DE ARMA BRANCA OU MUNICAO",
        "FORNECER ARMA, MUNICAO, EXPLOSIVO A CRIANCA/ADOLESCENTE",
        "COMERCIO ILEGAL DE ARMA DE FOGO",
        "TRAFICO INTERNACIONAL DE ARMA DE FOGO"
      ) ~ "Crimes relacionados a armas",
      
      # ===============================
      # 9. CRIMES DE TRÂNSITO
      # ===============================
      tipo_enquadramento %in% c(
        "EMBRIAGUEZ ART 306",
        "EMBRIAGUEZ - ART. 306",
        "DIRECAO PERIGOSA (RACHA) ART 308",
        "DIRIGIR SEM HABILITACAO GERANDO PERIGO DE DANO ART. 309",
        "FUGA DE LOCAL DE ACIDENTE - ART. 305",
        "VIOLAR A SUSPENSAO OU PROIBICAO DE DIRIGIR VEICULO ART.307",
        "TRAFEGAR COM VELOCIDADE INCOMPATIVEL COM A SEGURANCA ART.311",
        "INOVAR ARTIFICIOSAMENTE,EM CASO DE ACIDENTE TRANSITO ART.312",
        "PERMITIR,CONFIAR,OU ENTREG. DIRECAO A PESSOA S/HABIL.ART 310"
      ) ~ "Crimes de trânsito",
      
      # ===============================
      # 10. CRIMES RELACIONADOS A DROGAS
      # ===============================
      tipo_enquadramento %in% c(
        "ENTORPECENTES - TRAFICO",
        "ENTORPECENTE  ASSOCIACAO",
        "ENTORPECENTES  POSSE"
      ) ~ "Crimes relacionados a drogas",
      
      # ===============================
      # 11. CRIMES CONTRA CRIANÇAS E ADOLESCENTES
      # ===============================
      tipo_enquadramento %in% c(
        "ABANDONO DE INCAPAZ",
        "SUBTRACAO DE INCAPAZ",
        "ESTUPRO DE VULNERAVEL",
        "SERVIR BEBIDA ALCOOLICA A VULNERAVEIS",
        "FORNECER PRODUTOS CRIANCA/ADOLESCENTE QUE CAUSAM DEPENDENCIA",
        "OUTROS CRIMES CONTRA A CRIANCA/ADOLESCENTE"
      ) ~ "Crimes contra crianças e adolescentes",
      
      # ===============================
      # 12. CRIMES DE DISCRIMINAÇÃO
      # ===============================
      tipo_enquadramento %in% c(
        "HOMOFOBIA TRANSFOBIA",
        "PRECONCEITO RACA COR",
        "PRECONCEITO DE RACA E COR",
        "PRECONCEITO DEFICIENCIA",
        "PRECONCEITO ETNIA PROCEDENCIA NACIONAL",
        "PRECONCEITO RELIGIAO",
        "INJURIA DISCRIMINATORIA",
        "APOLOGIA AO NAZISMO",
        "INJURIA QUALIFICADA  RACA COR ETNIA RELIGIAO OU ORIGEM"
      ) ~ "Crimes de discriminação",
      
      # ===============================
      # 13. CRIMES CONTRA GRUPOS VULNERÁVEIS
      # ===============================
      tipo_enquadramento %in% c(
        "ABANDONO DE PESSOA COM DEFICIENCIA",
        "OUTROS CRIMES CONTRA O IDOSO",
        "DISCRIMINACAO CONTRA O IDOSO",
        "ABANDONO DE IDOSO",
        "DISCRIMINACAO A PESSOA COM DEFICIENCIA",
        "OMISSAO DE SOCORRO CONTRA O IDOSO",
        "MAUS TRATOS CONTRA O IDOSO",
        "APROPRIACAO INDEBITA DE BEM DE IDOSO",
        "RETENCAO DO CARTAO DE PESSOA COM DEFICIENCIA"
      ) ~ "Crimes contra grupos vulneráveis",
      
      # ===============================
      # 14. CRIMES AMBIENTAIS E CONTRA ANIMAIS
      # ===============================
      tipo_enquadramento %in% c(
        "CRIME DE POLUICAO E OUTROS CRIMES AMBIENTAIS",
        "CRIMES CONTRA A FAUNA",
        "CRIMES CONTRA A FLORA",
        "OUTROS CRIMES CONTRA MEIO AMBIENTE",
        "CRUELDADE CONTRA ANIMAIS",
        "OMISSAO DE CAUTELA NA GUARDA OU CONDUCAO DE ANIMAIS",
        "SUPRESSAO OU ALTERACAO DE MARCA EM ANIMAIS",
        "USURPACAO DE AGUAS"
      ) ~ "Crimes ambientais e contra animais",
      
      # ===============================
      # 15. OUTROS
      # ===============================
      TRUE ~ "Outros crimes"
    )
  )


library(ggplot2)

dados_enquadramento_M %>% 
  dplyr::group_by(classificacao) %>% 
  dplyr::count() %>% 
ggplot() +
  aes(x = classificacao, y = n) +
  geom_bar(stat = "summary", fun = "sum", 
           fill = "#1513B9") +
  labs(x = "Crimes", y = "Número absoluto") +
  coord_flip() +
  theme_gray() +
  theme(axis.text.y = element_text(face = "bold"))



dados_enquadramento_M <- dados2024_art3 %>% 
  dplyr::filter(sexo_vitima == "Feminino") %>% 
  mutate(
    classificacao = case_when(
      
      # ===============================
      # 1. CRIMES CONTRA A MULHER
      # ===============================
      tipo_enquadramento %in% c(
        "VIOLENCIA PSICOLOGICA CONTRA MULHER ART 147B",
        "DESCUMPRIMENTO DE MEDIDA PROTETIVA DE URGENCIA",
        "FEMINICIDIO ART 121 PAR 2 VI",
        "IMPORTUNACAO SEXUAL",
        "ESTUPRO",
        "VIOLACAO SEXUAL MEDIANTE FRAUDE"
      ) ~ "Crimes contra a mulher",
      
      # ===============================
      # 2. CRIMES CONTRA A DIGNIDADE SEXUAL
      # ===============================
      tipo_enquadramento %in% c(
        "ASSEDIO SEXUAL",
        "EXPLORACAO SEXUAL INFANTO-JUVENIL",
        "CASA DE PROSTITUICAO",
        "CONDUTAS RELACIONADAS À PEDOFILIA NA INTERNET",
        "RUFIANISMO",
        "PORNOGRAFIA INFANTO-JUVENIL",
        "SATISFACAO DE LASCIVIA MEDIANTE PRESENCA DE CRIANCA OU ADOLESCENTE"
      ) ~ "Crimes contra a dignidade sexual",
      
      # ===============================
      # 3. CRIMES CONTRA A PESSOA
      # ===============================
      tipo_enquadramento %in% c(
        "AMEACA",
        "LESAO CORPORAL",
        "LESAO CORPORAL LEVE",
        "LESAO CORPORAL GRAVE",
        "LESAO CORPORAL GRAVISSIMA",
        "LESAO CORPORAL SEGUIDA DE MORTE",
        "LESAO CORPORAL CULPOSA",
        "LESAO CORPORAL CULPOSA DIRECAO VEIC AUTOMOTOR",
        "VIAS DE FATO",
        "HOMICIDIO DOLOSO",
        "HOMICIDIO CULPOSO",
        "HOMICIDIO CULPOSO DIRECAO VEIC AUTOMOTOR",
        "HOMICIDIO DECORRENTE DE OPOSICAO A INTERVENCAO POLICIAL",
        "SEQUESTRO E CARCERE PRIVADO",
        "SEQUESTRO RELAMPAGO",
        "PERSEGUICAO",
        "MAUS TRATOS",
        "VIOLACAO DE DOMICILIO",
        "VIOLACAO DE SEPULTURA",
        "VILIPENDIO A CADAVER",
        "RIXA",
        "PERIGO A VIDA/SAUDE DE OUTREM",
        "INCENDIO DOLOSO",
        "INCENDIO CULPOSO",
        "INFANTICIDIO",
        "INDUZIMENTO INSTIGAO AUXILIO AO SUICIDIO OU A AUTOMULTILAO"
      ) ~ "Crimes contra a pessoa",
      
      # ===============================
      # 4. CRIMES CONTRA O PATRIMÔNIO
      # ===============================
      tipo_enquadramento %in% c(
        "ESBULHO POSSESSORIO",
        "FURTO SIMPLES",
        "FURTO QUALIFICADO",
        "FURTO DE VEICULO",
        "FURTO EM VEICULO",
        "FURTO DE TELEFONE CELULAR",
        "FURTO DE DOCUMENTO",
        "FURTO DE FIOS E CABOS",
        "FURTO ABIGEATO",
        "FURTO DE ARMA",
        "FURTO DE CARGA EM CAMINHAO",
        "FURTO DE COISA COMUM ART 156  SUBTRAIR O CONDOMINO COHERDEIRO OU SOCIO PARA SI OU PARA OUTREM A QUEM LEGITIMAMENTE A DETEM A COISA COMUM",
        "FURTO DE DEFENSIVO AGRICOLA",
        "FURTO QUALIFICADO EM VEICULO",
        "FURTO SIMPLES EM RESIDENCIA",
        "FURTO VEICULO AUTOMOTOR TRANSPORTE OUTRO ESTADO",
        "FURTO/ARROMBAMENTO",
        "FURTO/ARROMBAMENTO A CAIXA ELETRONICO",
        "FURTO/ARROMBAMENTO A ESTABELECIMENTO DE ENSINO",
        "FURTO/ARROMBAMENTO DE RESIDENCIA",
        "FURTO/ARROMBAMENTO ESTABELECIMENTO BANCARIO",
        "FURTO/ARROMBAMENTO ESTABELECIMENTO COMERCIAL",
        "OUTROS FURTOS",
        "ROUBO A PEDESTRE",
        "ROUBO DE VEICULO",
        "ROUBO DE TELEFONE CELULAR",
        "ROUBO A RESIDENCIA",
        "ROUBO COM LESOES",
        "ROUBO COM MORTE",
        "OUTROS ROUBOS",
        "EXTORSAO",
        "EXTORSAO MEDIANTE SEQUESTRO",
        "ESTELIONATO",
        "ESTELIONATO  FRAUDE ELETRONICA",
        "ESTELIONATO  FRAUDE COM A UTILIZACAO DE ATIVOS VIRTUAIS VALORES MOBILIARIOS OU ATIVOS FINANCEIROS",
        "DANO",
        "RECEPTACAO",
        "RECEPTACAO CULPOSA",
        "RECEPTACAO QUALIFICADA",
        "RECEPTACAO DE VEICULO",
        "RECEPTACAO DE ANIMAL",
        "OUTRAS FRAUDES",
        "APROPRIACAO INDEBITA",
        "FRAUDE A CREDORES",
        "FRAUDE NO COMERCIO",
        "FRAUDE NO PAGAMENTO POR MEIO DE CHEQUE"
      ) ~ "Crimes contra o patrimônio",
      
      # ===============================
      # 5. CRIMES CONTRA A HONRA
      # ===============================
      tipo_enquadramento %in% c(
        "CALUNIA",
        "DIFAMACAO",
        "INJURIA",
        "DENUNCIACAO CALUNIOSA"
      ) ~ "Crimes contra a honra",
      
      # ===============================
      # 6. CRIMES CONTRA A ADMINISTRAÇÃO PÚBLICA
      # ===============================
      tipo_enquadramento %in% c(
        "CORRUPCAO ATIVA",
        "CONCUSSAO",
        "PECULATO",
        "TRAFICO DE INFLUENCIA",
        "FAVORECIMENTO REAL",
        "FAVORECIMENTO PESSOAL",
        "PREVARICACAO",
        "EXERCICIO ARBITRARIO OU ABUSO DE PODER",
        "EXERCICIO ARBITRARIO PROPRIAS RAZOES",
        "USURPACAO DE FUNCAO PUBLICA",
        "ORGANIZACAO CRIMINOSA ART 2 DA LEI 12850 DE 2013",
        "VIOLACAO DE SIGILO FUNCIONAL",
        "RESISTENCIA"
      ) ~ "Crimes contra a administração pública",
      
      # ===============================
      # 7. CRIMES CONTRA A FÉ PÚBLICA
      # ===============================
      tipo_enquadramento %in% c(
        "FALSIDADE IDEOLOGICA",
        "FALSIFICACAO DE DOCUMENTOS PARTICULARES",
        "FALSIFICACAO DE PAPEIS/DOCUMENTOS PUBLICOS",
        "FALSO TESTEMUNHO OU FALSA PERICIA",
        "USO DE DOCUMENTO FALSO",
        "FALSA IDENTIDADE",
        "SIMULACAO QUALIDADE DE FUNCIONARIO",
        "USO ILEGITIMO DE UNIFORME OU DISTINTIVO",
        "EXTRAVIO SONEGACAO OU INUTILIZACAO DE LIVRO OU DOCUMENTO",
        "SUBTRACAO OU INUTILIZACAO DE LIVRO OU DOCUMENTO",
        "VIOLACAO DE CORRESPONDENCIA"
      ) ~ "Crimes contra a fé pública",
      
      # ===============================
      # 8. CRIMES RELACIONADOS A ARMAS
      # ===============================
      tipo_enquadramento %in% c(
        "DISPARO DE ARMA DE FOGO",
        "PORTE ILEGAL DE ARMA DE FOGO DE USO PERMITIDO",
        "POSSE IRREGULAR DE ARMA DE FOGO DE USO PERMITIDO",
        "POSSE OU PORTE ILEGAL DE ARMA DE FOGO DE USO PROIBIDO",
        "POSSE OU PORTE ILEGAL DE ARMA DE FOGO DE USO RESTRITO",
        "PORTE ARMA BRANCA",
        "FABRICO COMERCIO OU DENTENCAO DE ARMA BRANCA OU MUNICAO",
        "FORNECER ARMA, MUNICAO, EXPLOSIVO A CRIANCA/ADOLESCENTE",
        "COMERCIO ILEGAL DE ARMA DE FOGO",
        "TRAFICO INTERNACIONAL DE ARMA DE FOGO"
      ) ~ "Crimes relacionados a armas",
      
      # ===============================
      # 9. CRIMES DE TRÂNSITO
      # ===============================
      tipo_enquadramento %in% c(
        "EMBRIAGUEZ ART 306",
        "EMBRIAGUEZ - ART. 306",
        "DIRECAO PERIGOSA (RACHA) ART 308",
        "DIRIGIR SEM HABILITACAO GERANDO PERIGO DE DANO ART. 309",
        "FUGA DE LOCAL DE ACIDENTE - ART. 305",
        "VIOLAR A SUSPENSAO OU PROIBICAO DE DIRIGIR VEICULO ART.307",
        "TRAFEGAR COM VELOCIDADE INCOMPATIVEL COM A SEGURANCA ART.311",
        "INOVAR ARTIFICIOSAMENTE,EM CASO DE ACIDENTE TRANSITO ART.312",
        "PERMITIR,CONFIAR,OU ENTREG. DIRECAO A PESSOA S/HABIL.ART 310"
      ) ~ "Crimes de trânsito",
      
      # ===============================
      # 10. CRIMES RELACIONADOS A DROGAS
      # ===============================
      tipo_enquadramento %in% c(
        "ENTORPECENTES - TRAFICO",
        "ENTORPECENTE  ASSOCIACAO",
        "ENTORPECENTES  POSSE"
      ) ~ "Crimes relacionados a drogas",
      
      # ===============================
      # 11. CRIMES CONTRA CRIANÇAS E ADOLESCENTES
      # ===============================
      tipo_enquadramento %in% c(
        "ABANDONO DE INCAPAZ",
        "SUBTRACAO DE INCAPAZ",
        "ESTUPRO DE VULNERAVEL",
        "SERVIR BEBIDA ALCOOLICA A VULNERAVEIS",
        "FORNECER PRODUTOS CRIANCA/ADOLESCENTE QUE CAUSAM DEPENDENCIA",
        "OUTROS CRIMES CONTRA A CRIANCA/ADOLESCENTE"
      ) ~ "Crimes contra crianças e adolescentes",
      
      # ===============================
      # 12. CRIMES DE DISCRIMINAÇÃO
      # ===============================
      tipo_enquadramento %in% c(
        "HOMOFOBIA TRANSFOBIA",
        "PRECONCEITO RACA COR",
        "PRECONCEITO DE RACA E COR",
        "PRECONCEITO DEFICIENCIA",
        "PRECONCEITO ETNIA PROCEDENCIA NACIONAL",
        "PRECONCEITO RELIGIAO",
        "INJURIA DISCRIMINATORIA",
        "DISCRIMINACAO A PESSOA COM DEFICIENCIA",
        "APOLOGIA AO NAZISMO",
        "INJURIA QUALIFICADA  RACA COR ETNIA RELIGIAO OU ORIGEM",
        "DISCRIMINACAO CONTRA O IDOSO",
      ) ~ "Crimes de discriminação",
      
      # ===============================
      # 13. CRIMES CONTRA GRUPOS VULNERÁVEIS
      # ===============================
      tipo_enquadramento %in% c(
        "ABANDONO DE PESSOA COM DEFICIENCIA",
        "OUTROS CRIMES CONTRA O IDOSO",
        "ABANDONO DE IDOSO",
        "OMISSAO DE SOCORRO CONTRA O IDOSO",
        "MAUS TRATOS CONTRA O IDOSO",
        "APROPRIACAO INDEBITA DE BEM DE IDOSO",
        "RETENCAO DO CARTAO DE PESSOA COM DEFICIENCIA"
      ) ~ "Crimes contra grupos vulneráveis",
      
      # ===============================
      # 14. CRIMES AMBIENTAIS E CONTRA ANIMAIS
      # ===============================
      tipo_enquadramento %in% c(
        "CRIME DE POLUICAO E OUTROS CRIMES AMBIENTAIS",
        "CRIMES CONTRA A FAUNA",
        "CRIMES CONTRA A FLORA",
        "OUTROS CRIMES CONTRA MEIO AMBIENTE",
        "CRUELDADE CONTRA ANIMAIS",
        "OMISSAO DE CAUTELA NA GUARDA OU CONDUCAO DE ANIMAIS",
        "SUPRESSAO OU ALTERACAO DE MARCA EM ANIMAIS",
        "USURPACAO DE AGUAS"
      ) ~ "Crimes ambientais e contra animais",
      
      # ===============================
      # 15. OUTROS
      # ===============================
      TRUE ~ "Outros crimes"
    )
  )










###########################
# ANO: 2025
###########################

dados2025_art3 <- read_excel("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/MVIOL/dados_completos/Dados/SSP_LEI15610/Mensal_Art3/SPJ_DADOS_ABERTOS_OCORRENCIAS_JAN_ABR_2025 - Em 05.05.2025.xls") %>% 
  
  janitor::clean_names() %>% 
  dplyr::select(sequencia:cor_vitima) %>% 
  dplyr::filter(str_detect(tipo_enquadramento,
                           "^HOMICIDIO CULPOSO|^HOMICIDIO DOLOSO|^IMPORTUNACAO|^HOMOFOBIA|^ABUSO|^AMEACA|^ASSEDIO|^CONDUTO|^CONSTRANGIMENTO|^DIFAMACAO|^ESTUPRO|^EXPLORACAO|^FEMINICIDIO|^INJURIA|^LESAO CORPORAL GRAVE|^LESAO CORPORAL GRAVISSIMA|^LESAO CORPORAL LEVE|^LESAO CORPORAL SEGUIDA DE MORTE|^OUTROS CRIMES CONTRA A FAMILIA|^PERSEGUICAO|^SEQUESTRO|^VIOLACAO SEXUAL|^VIOLENCIA PSICOLOGICA"))


#######################################################################################
# ARTIGO 6° - III
#######################################################################################

dados2021_2PC_art6 <- readr::read_delim(here("Dados", "SSP_LEI15610", "Semestral_Art6", "PC - Art. 6 Inc. III - Vitimas Mulheres de Violencia Domestica e Familiar_2021_2.csv", 
                                                                                         delim = ";", escape_double = FALSE, trim_ws = TRUE))
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












