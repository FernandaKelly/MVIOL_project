#######################################################################################
# DADOS SINAN - VIOLÊNCIA DOMÉSTICA
#######################################################################################

install.packages("remotes")
remotes::install_github("danicat/read.dbc")

#install.packages("read.dbc", repos = "https://packagemanager.posit.co/cran/2024-07-05")
library(read.dbc)
library(tidyverse)
library(magrittr)
library(writexl)
library(readxl)
library(lubridate)


# ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/VIOLBR18.dbc
# ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/VIOLBR19.dbc
# ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/VIOLBR20.dbc
# ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/VIOLBR21.dbc
# ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/VIOLBR22.dbc
# ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/VIOLBR23.dbc
# ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/PRELIM/VIOLBR24.dbc


########################################################################################
# DOCUMENTAÇÃO
########################################################################################

# ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DOCS/Docs_TAB_SINAN.zip

library(RCurl)

ftp_url <- "ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DOCS/Docs_TAB_SINAN.zip"

destfile_sinan <- "DOCBR.zip"
#download.file(ftp_url,  destfile_sinan, mode = "wb")
#doc_SINAN <- readBin("DOCBR.zip")

download("ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DOCS/Docs_TAB_SINAN.zip", destfile_sinan, mod = "wb")
########################################################################################


## 2018

ftp_url <- "ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/VIOLBR18.dbc"
destfile_sinan <- "DOBR2018.dbc"

download.file(ftp_url,  destfile_sinan, mode = "wb")
dados_2018 <- read.dbc("DOBR2018.dbc") %>% 
  dplyr::filter(SG_UF_NOT == 43)

writexl::write_xlsx(dados_2018,
"C:\\Users\\fernanda-romeiro\\OneDrive - Governo do Estado do Rio Grande do Sul\\Projetos\\MVIOL\\MVIOL_project\\Dados\\SINAN\\dadosSINAN_2018.xlsx")


## 2019

ftp_url <- "ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/VIOLBR19.dbc"
destfile_sinan <- "DOBR2019.dbc"

download.file(ftp_url,  destfile_sinan, mode = "wb")
dados_2019 <- read.dbc("DOBR2019.dbc") %>% 
  dplyr::filter(SG_UF_NOT == 43)

writexl::write_xlsx(dados_2019,
                    "C:\\Users\\fernanda-romeiro\\OneDrive - Governo do Estado do Rio Grande do Sul\\Projetos\\MVIOL\\MVIOL_project\\Dados\\SINAN\\dadosSINAN_2019.xlsx")

## 2020

ftp_url <- "ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/VIOLBR20.dbc"
destfile_sinan <- "DOBR2020.dbc"

download.file(ftp_url,  destfile_sinan, mode = "wb")
dados_2020 <- read.dbc("DOBR2020.dbc") %>% 
  dplyr::filter(SG_UF_NOT == 43)


writexl::write_xlsx(dados_2020,
                    "C:\\Users\\fernanda-romeiro\\OneDrive - Governo do Estado do Rio Grande do Sul\\Projetos\\MVIOL\\MVIOL_project\\Dados\\SINAN\\dadosSINAN_2020.xlsx")


## 2021

ftp_url <- "ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/VIOLBR21.dbc"
destfile_sinan <- "DOBR2021.dbc"

download.file(ftp_url,  destfile_sinan, mode = "wb")
dados_2021 <- read.dbc("DOBR2021.dbc") %>% 
  dplyr::filter(SG_UF_NOT == 43)


writexl::write_xlsx(dados_2021,
                    "C:\\Users\\fernanda-romeiro\\OneDrive - Governo do Estado do Rio Grande do Sul\\Projetos\\MVIOL\\MVIOL_project\\Dados\\SINAN\\dadosSINAN_2021.xlsx")


## 2022

ftp_url <- "ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/VIOLBR22.dbc"
destfile_sinan <- "DOBR2022.dbc"

download.file(ftp_url,  destfile_sinan, mode = "wb")
dados_2022 <- read.dbc("DOBR2022.dbc") %>% 
  dplyr::filter(SG_UF_NOT == 43)

writexl::write_xlsx(dados_2022,
                    "C:\\Users\\fernanda-romeiro\\OneDrive - Governo do Estado do Rio Grande do Sul\\Projetos\\MVIOL\\MVIOL_project\\Dados\\SINAN\\dadosSINAN_2022.xlsx")


## 2023

ftp_url <- "ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/VIOLBR23.dbc"
destfile_sinan <- "DOBR2023.dbc"

download.file(ftp_url,  destfile_sinan, mode = "wb")
dados_2023 <- read.dbc("DOBR2023.dbc") %>% 
  dplyr::filter(SG_UF_NOT == 43)

writexl::write_xlsx(dados_2023,
                    "C:\\Users\\fernanda-romeiro\\OneDrive - Governo do Estado do Rio Grande do Sul\\Projetos\\MVIOL\\MVIOL_project\\Dados\\SINAN\\dadosSINAN_2023.xlsx")


## 2024

ftp_url <- "ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/PRELIM/VIOLBR24.dbc"
destfile_sinan <- "DOBR2024.dbc"

download.file(ftp_url,  destfile_sinan, mode = "wb")
dados_2024 <- read.dbc("DOBR2024.dbc") %>% 
  dplyr::filter(SG_UF_NOT == 43)

writexl::write_xlsx(dados_2024,
                    "C:\\Users\\fernanda-romeiro\\OneDrive - Governo do Estado do Rio Grande do Sul\\Projetos\\MVIOL\\MVIOL_project\\Dados\\SINAN\\dadosSINAN_2024.xlsx")

## 2025

ftp_url <- "ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/PRELIM/VIOLBR25.dbc"
destfile_sinan <- "DOBR2025.dbc"

download.file(ftp_url,  destfile_sinan, mode = "wb")
dados_2025 <- read.dbc("DOBR2025.dbc") %>% 
  dplyr::filter(SG_UF_NOT == 43)

writexl::write_xlsx(dados_2025,
                    "C:\\Users\\fernanda-romeiro\\OneDrive - Governo do Estado do Rio Grande do Sul\\Projetos\\MVIOL\\MVIOL_project\\Dados\\SINAN\\dadosSINAN_2025.xlsx")


#######################################################################################
# TRANSFORMAÇÃO DE DADOS
#######################################################################################

MUNICIPIOS <- read_excel("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/MVIOL/dados_completos/Dados/ShapeRS/MUNICIPIOS.xlsx") %>% 
  janitor::clean_names()

############

dadosSINAN_2018 <- read_excel("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/MVIOL/dados_completos/Dados/SINAN/dadosSINAN_2018.xlsx") %>% 
  # dplyr::select(DT_NOTIFIC, DT_OCOR, SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
  #               
  #               NU_IDADE_N, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA, CS_ESCOL_N, SIT_CONJUG,
  #               
  #               OUT_VEZES, LES_AUTOP, VIOL_MOTIV, VIOL_FISIC, VIOL_PSICO, VIOL_TORT, 
  #               VIOL_SEXU, SEX_ASSEDI, SEX_ESTUPR, SEX_PORNO, SEX_EXPLO, SEX_OUTRO, SEX_ESPEC,
  #               
  #               VIOL_TRAF, VIOL_FINAN, VIOL_NEGLI, VIOL_INFAN, VIOL_OUTR, VIOL_ESPEC,
  #               AG_FORCA, AG_ENFOR, AG_OBJETO, AG_CORTE, AG_QUENTE, 
  #               AG_ENVEN, AG_FOGO, AG_AMEACA, 
  #               
  #               AUTOR_SEXO,  
  #               
  #               ASSIST_SOC, REDE_EDUCA, ATEND_MULH, CONS_TUTEL, CONS_IDO, DIR_HUMAN, MPU, DELEG_CRIA, 
  #               DELEG_MULH, DELEG, INFAN_JUV, DEFEN_PUBL,
  #               
  #               ID_OCUPA_N, LOCAL_OCOR, LOCAL_ESPE, NUM_ENVOLV, REL_PAI, REL_MAE,
  #               REL_PAD, REL_MAD, REL_CONJ, REL_EXCON, REL_NAMO, REL_EXNAM, REL_FILHO, REL_IRMAO, REL_CONHEC,
  #               REL_DESCO, REL_CUIDA, REL_PATRAO, REL_INST, REL_POL, REL_TRAB, REL_PROPRI, REL_OUTROS, REL_ESPEC, AUTOR_ALCO ) %>% 
  dplyr::mutate(
                dplyr::across(c(ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR), as.numeric),
                DT_OCOR   = base::as.Date(DT_OCOR),
                #data_nasc = base::as.Date(NU_IDADE_N),
                #idade = base::floor((DT_OCOR - data_nasc)/365.25),
                #idade = base::as.numeric(idade),
                nova_idade = stringr::str_extract(NU_IDADE_N, "\\d{2}$"),
                ano_not = lubridate::year(DT_NOTIFIC),
                mes_not = lubridate::month(DT_NOTIFIC),
                dia_not = lubridate::day(DT_NOTIFIC),
                ano_ocor = lubridate::year(DT_OCOR),
                mes_ocor = lubridate::month(DT_OCOR),
                dia_ocor = lubridate::day(DT_OCOR)
                ) %>% 
dplyr::select(!c(DT_NOTIFIC, DT_OCOR)) %>% 
#dplyr::left_join(MUNICIPIOS, by = c("ID_MN_OCOR" = "codigo_ibge_6d")) %>% 
  dplyr::relocate(SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                  NU_IDADE_N, nova_idade, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA,
                  CS_ESCOL_N, SIT_CONJUG) 
# %>% 
#   janitor::clean_names() %>% 
#   dplyr::rename_with(\(x) stringr::str_c(x, "_2018"))


dadosSINAN_2019 <- read_excel("Dados/SINAN/dadosSINAN_2019.xlsx") %>% 
  dplyr::select(DT_NOTIFIC, DT_OCOR, SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                
                NU_IDADE_N, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA, CS_ESCOL_N, SIT_CONJUG,
                
                OUT_VEZES, LES_AUTOP, VIOL_MOTIV, VIOL_FISIC, VIOL_PSICO, VIOL_TORT, 
                VIOL_SEXU, SEX_ASSEDI, SEX_ESTUPR, SEX_PORNO, SEX_EXPLO, SEX_OUTRO, SEX_ESPEC,
                
                VIOL_TRAF, VIOL_FINAN, VIOL_NEGLI, VIOL_INFAN, VIOL_OUTR, VIOL_ESPEC,
                AG_FORCA, AG_ENFOR, AG_OBJETO, AG_CORTE, AG_QUENTE, 
                AG_ENVEN, AG_FOGO, AG_AMEACA, 
                
                AUTOR_SEXO,  
                
                ASSIST_SOC, REDE_EDUCA, ATEND_MULH, CONS_TUTEL, CONS_IDO, DIR_HUMAN, MPU, DELEG_CRIA, 
                DELEG_MULH, DELEG, INFAN_JUV, DEFEN_PUBL) %>% 
  dplyr::mutate(
    dplyr::across(c(ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR), as.numeric),
    DT_OCOR   = base::as.Date(DT_OCOR),
    #data_nasc = base::as.Date(NU_IDADE_N),
    #idade = base::floor((DT_OCOR - data_nasc)/365.25),
    #idade = base::as.numeric(idade),
    nova_idade = stringr::str_extract(NU_IDADE_N, "\\d{2}$"),
    ano_not = lubridate::year(DT_NOTIFIC),
    mes_not = lubridate::month(DT_NOTIFIC),
    dia_not = lubridate::day(DT_NOTIFIC),
    ano_ocor = lubridate::year(DT_OCOR),
    mes_ocor = lubridate::month(DT_OCOR),
    dia_ocor = lubridate::day(DT_OCOR)
  ) %>% 
  dplyr::select(!c(DT_NOTIFIC, DT_OCOR)) %>% 
  #dplyr::left_join(MUNICIPIOS, by = c("ID_MN_OCOR" = "codigo_ibge_6d")) %>% 
  dplyr::relocate(SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                  NU_IDADE_N, nova_idade, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA,
                  CS_ESCOL_N, SIT_CONJUG) 
# %>% 
#   janitor::clean_names() %>% 
#   dplyr::rename_with(\(x) stringr::str_c(x, "_2019"))


dadosSINAN_2020 <- read_excel("Dados/SINAN/dadosSINAN_2020.xlsx") %>% 
  dplyr::select(DT_NOTIFIC, DT_OCOR, SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                
                NU_IDADE_N, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA, CS_ESCOL_N, SIT_CONJUG,
                
                OUT_VEZES, LES_AUTOP, VIOL_MOTIV, VIOL_FISIC, VIOL_PSICO, VIOL_TORT, 
                VIOL_SEXU, SEX_ASSEDI, SEX_ESTUPR, SEX_PORNO, SEX_EXPLO, SEX_OUTRO, SEX_ESPEC,
                
                VIOL_TRAF, VIOL_FINAN, VIOL_NEGLI, VIOL_INFAN, VIOL_OUTR, VIOL_ESPEC,
                AG_FORCA, AG_ENFOR, AG_OBJETO, AG_CORTE, AG_QUENTE, 
                AG_ENVEN, AG_FOGO, AG_AMEACA, 
                
                AUTOR_SEXO,  
                
                ASSIST_SOC, REDE_EDUCA, ATEND_MULH, CONS_TUTEL, CONS_IDO, DIR_HUMAN, MPU, DELEG_CRIA, 
                DELEG_MULH, DELEG, INFAN_JUV, DEFEN_PUBL) %>% 
  dplyr::mutate(
    dplyr::across(c(ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR), as.numeric),
    DT_OCOR   = base::as.Date(DT_OCOR),
    #data_nasc = base::as.Date(NU_IDADE_N),
    #idade = base::floor((DT_OCOR - data_nasc)/365.25),
    #idade = base::as.numeric(idade),
    nova_idade = stringr::str_extract(NU_IDADE_N, "\\d{2}$"),
    ano_not = lubridate::year(DT_NOTIFIC),
    mes_not = lubridate::month(DT_NOTIFIC),
    dia_not = lubridate::day(DT_NOTIFIC),
    ano_ocor = lubridate::year(DT_OCOR),
    mes_ocor = lubridate::month(DT_OCOR),
    dia_ocor = lubridate::day(DT_OCOR)
  ) %>% 
  dplyr::select(!c(DT_NOTIFIC, DT_OCOR)) %>% 
  #dplyr::left_join(MUNICIPIOS, by = c("ID_MN_OCOR" = "codigo_ibge_6d")) %>% 
  dplyr::relocate(SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                  NU_IDADE_N, nova_idade, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA,
                  CS_ESCOL_N, SIT_CONJUG) 
# %>% 
#   janitor::clean_names() %>% 
#   dplyr::rename_with(\(x) stringr::str_c(x, "_2020"))


dadosSINAN_2021 <- read_excel("Dados/SINAN/dadosSINAN_2021.xlsx") %>% 
  dplyr::select(DT_NOTIFIC, DT_OCOR, SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                
                NU_IDADE_N, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA, CS_ESCOL_N, SIT_CONJUG,
                
                OUT_VEZES, LES_AUTOP, VIOL_MOTIV, VIOL_FISIC, VIOL_PSICO, VIOL_TORT, 
                VIOL_SEXU, SEX_ASSEDI, SEX_ESTUPR, SEX_PORNO, SEX_EXPLO, SEX_OUTRO, SEX_ESPEC,
                
                VIOL_TRAF, VIOL_FINAN, VIOL_NEGLI, VIOL_INFAN, VIOL_OUTR, VIOL_ESPEC,
                AG_FORCA, AG_ENFOR, AG_OBJETO, AG_CORTE, AG_QUENTE, 
                AG_ENVEN, AG_FOGO, AG_AMEACA, 
                
                AUTOR_SEXO,  
                
                ASSIST_SOC, REDE_EDUCA, ATEND_MULH, CONS_TUTEL, CONS_IDO, DIR_HUMAN, MPU, DELEG_CRIA, 
                DELEG_MULH, DELEG, INFAN_JUV, DEFEN_PUBL) %>% 
  dplyr::mutate(
    dplyr::across(c(ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR), as.numeric),
    #DT_OCOR   = base::as.Date(DT_OCOR),
    #data_nasc = base::as.Date(NU_IDADE_N),
    #idade = base::floor((DT_OCOR - data_nasc)/365.25),
    #idade = base::as.numeric(idade),
    nova_idade = stringr::str_extract(NU_IDADE_N, "\\d{2}$"),
    ano_not = lubridate::year(DT_NOTIFIC),
    mes_not = lubridate::month(DT_NOTIFIC),
    dia_not = lubridate::day(DT_NOTIFIC),
    ano_ocor = lubridate::year(DT_OCOR),
    mes_ocor = lubridate::month(DT_OCOR),
    dia_ocor = lubridate::day(DT_OCOR)
  ) %>% 
  dplyr::select(!c(DT_NOTIFIC, DT_OCOR)) %>% 
  #dplyr::left_join(MUNICIPIOS, by = c("ID_MN_OCOR" = "codigo_ibge_6d")) %>% 
  dplyr::relocate(SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                  NU_IDADE_N, nova_idade, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA,
                  CS_ESCOL_N, SIT_CONJUG) 
# %>% 
#   janitor::clean_names() %>% 
#   dplyr::rename_with(\(x) stringr::str_c(x, "_2021"))


dadosSINAN_2022 <- read_excel("Dados/SINAN/dadosSINAN_2022.xlsx") %>% 
  dplyr::select(DT_NOTIFIC, DT_OCOR, SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                
                NU_IDADE_N, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA, CS_ESCOL_N, SIT_CONJUG,
                
                OUT_VEZES, LES_AUTOP, VIOL_MOTIV, VIOL_FISIC, VIOL_PSICO, VIOL_TORT, 
                VIOL_SEXU, SEX_ASSEDI, SEX_ESTUPR, SEX_PORNO, SEX_EXPLO, SEX_OUTRO, SEX_ESPEC,
                
                VIOL_TRAF, VIOL_FINAN, VIOL_NEGLI, VIOL_INFAN, VIOL_OUTR, VIOL_ESPEC,
                AG_FORCA, AG_ENFOR, AG_OBJETO, AG_CORTE, AG_QUENTE, 
                AG_ENVEN, AG_FOGO, AG_AMEACA, 
                
                AUTOR_SEXO,  
                
                ASSIST_SOC, REDE_EDUCA, ATEND_MULH, CONS_TUTEL, CONS_IDO, DIR_HUMAN, MPU, DELEG_CRIA, 
                DELEG_MULH, DELEG, INFAN_JUV, DEFEN_PUBL) %>% 
  dplyr::mutate(
    dplyr::across(c(ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR), as.numeric),
    #DT_OCOR   = base::as.Date(DT_OCOR),
    #data_nasc = base::as.Date(NU_IDADE_N),
    #idade = base::floor((DT_OCOR - data_nasc)/365.25),
    #idade = base::as.numeric(idade),
    nova_idade = stringr::str_extract(NU_IDADE_N, "\\d{2}$"),
    ano_not = lubridate::year(DT_NOTIFIC),
    mes_not = lubridate::month(DT_NOTIFIC),
    dia_not = lubridate::day(DT_NOTIFIC),
    ano_ocor = lubridate::year(DT_OCOR),
    mes_ocor = lubridate::month(DT_OCOR),
    dia_ocor = lubridate::day(DT_OCOR)
  ) %>% 
  dplyr::select(!c(DT_NOTIFIC, DT_OCOR)) %>% 
  #dplyr::left_join(MUNICIPIOS, by = c("ID_MN_OCOR" = "codigo_ibge_6d")) %>% 
  dplyr::relocate(SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                  NU_IDADE_N, nova_idade, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA,
                  CS_ESCOL_N, SIT_CONJUG)
# %>% 
#   janitor::clean_names() %>% 
#   dplyr::rename_with(\(x) stringr::str_c(x, "_2022"))

dadosSINAN_2023 <- read_excel("Dados/SINAN/dadosSINAN_2023.xlsx") %>% 
  dplyr::select(DT_NOTIFIC, DT_OCOR, SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                
                NU_IDADE_N, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA, CS_ESCOL_N, SIT_CONJUG,
                
                OUT_VEZES, LES_AUTOP, VIOL_MOTIV, VIOL_FISIC, VIOL_PSICO, VIOL_TORT, 
                VIOL_SEXU, SEX_ASSEDI, SEX_ESTUPR, SEX_PORNO, SEX_EXPLO, SEX_OUTRO, SEX_ESPEC,
                
                VIOL_TRAF, VIOL_FINAN, VIOL_NEGLI, VIOL_INFAN, VIOL_OUTR, VIOL_ESPEC,
                AG_FORCA, AG_ENFOR, AG_OBJETO, AG_CORTE, AG_QUENTE, 
                AG_ENVEN, AG_FOGO, AG_AMEACA, 
                
                AUTOR_SEXO,  
                
                ASSIST_SOC, REDE_EDUCA, ATEND_MULH, CONS_TUTEL, CONS_IDO, DIR_HUMAN, MPU, DELEG_CRIA, 
                DELEG_MULH, DELEG, INFAN_JUV, DEFEN_PUBL) %>% 
  dplyr::mutate(
    dplyr::across(c(ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR), as.numeric),
    #DT_OCOR   = base::as.Date(DT_OCOR),
    #data_nasc = base::as.Date(NU_IDADE_N),
    #idade = base::floor((DT_OCOR - data_nasc)/365.25),
    #idade = base::as.numeric(idade),
    nova_idade = stringr::str_extract(NU_IDADE_N, "\\d{2}$"),
    ano_not = lubridate::year(DT_NOTIFIC),
    mes_not = lubridate::month(DT_NOTIFIC),
    dia_not = lubridate::day(DT_NOTIFIC),
    ano_ocor = lubridate::year(DT_OCOR),
    mes_ocor = lubridate::month(DT_OCOR),
    dia_ocor = lubridate::day(DT_OCOR)
  ) %>% 
  dplyr::select(!c(DT_NOTIFIC, DT_OCOR)) %>% 
  #dplyr::left_join(MUNICIPIOS, by = c("ID_MN_OCOR" = "codigo_ibge_6d")) %>% 
  dplyr::relocate(SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                  NU_IDADE_N, nova_idade, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA,
                  CS_ESCOL_N, SIT_CONJUG)
# %>% 
#   janitor::clean_names() %>% 
#   dplyr::rename_with(\(x) stringr::str_c(x, "_2023"))


dadosSINAN_2024 <- read_excel("Dados/SINAN/dadosSINAN_2024.xlsx") %>% 
  dplyr::select(DT_NOTIFIC, DT_OCOR, SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                
                NU_IDADE_N, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA, CS_ESCOL_N, SIT_CONJUG,
                
                OUT_VEZES, LES_AUTOP, VIOL_MOTIV, VIOL_FISIC, VIOL_PSICO, VIOL_TORT, 
                VIOL_SEXU, SEX_ASSEDI, SEX_ESTUPR, SEX_PORNO, SEX_EXPLO, SEX_OUTRO, SEX_ESPEC,
                
                VIOL_TRAF, VIOL_FINAN, VIOL_NEGLI, VIOL_INFAN, VIOL_OUTR, VIOL_ESPEC,
                AG_FORCA, AG_ENFOR, AG_OBJETO, AG_CORTE, AG_QUENTE, 
                AG_ENVEN, AG_FOGO, AG_AMEACA, 
                
                AUTOR_SEXO,  
                
                ASSIST_SOC, REDE_EDUCA, ATEND_MULH, CONS_TUTEL, CONS_IDO, DIR_HUMAN, MPU, DELEG_CRIA, 
                DELEG_MULH, DELEG, INFAN_JUV, DEFEN_PUBL) %>% 
  dplyr::mutate(
    dplyr::across(c(ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR), as.numeric),
    #DT_OCOR   = base::as.Date(DT_OCOR),
    #data_nasc = base::as.Date(NU_IDADE_N),
    #idade = base::floor((DT_OCOR - data_nasc)/365.25),
    #idade = base::as.numeric(idade),
    nova_idade = stringr::str_extract(NU_IDADE_N, "\\d{2}$"),
    ano_not = lubridate::year(DT_NOTIFIC),
    mes_not = lubridate::month(DT_NOTIFIC),
    dia_not = lubridate::day(DT_NOTIFIC),
    ano_ocor = lubridate::year(DT_OCOR),
    mes_ocor = lubridate::month(DT_OCOR),
    dia_ocor = lubridate::day(DT_OCOR)
  ) %>% 
  dplyr::select(!c(DT_NOTIFIC, DT_OCOR)) %>% 
  #dplyr::left_join(MUNICIPIOS, by = c("ID_MN_OCOR" = "codigo_ibge_6d")) %>% 
  dplyr::relocate(SG_UF_NOT, ID_MUNICIP, ID_MN_RESI, ID_MN_OCOR, ID_UNIDADE, LOCAL_OCOR,
                  NU_IDADE_N, nova_idade, CS_SEXO, ORIENT_SEX, IDENT_GEN, CS_GESTANT, CS_RACA,
                  CS_ESCOL_N, SIT_CONJUG)
# %>% 
#   janitor::clean_names() %>% 
#   dplyr::rename_with(\(x) stringr::str_c(x, "_2024"))



###########

dadosSINAN <- dadosSINAN_2018 %>% 
  dplyr::bind_rows(dadosSINAN_2019) %>% 
  dplyr::bind_rows(dadosSINAN_2020) %>% 
  dplyr::bind_rows(dadosSINAN_2021) %>% 
  dplyr::bind_rows(dadosSINAN_2022) %>% 
  dplyr::bind_rows(dadosSINAN_2023) %>% 
  dplyr::bind_rows(dadosSINAN_2024) %>%
  dplyr::left_join(MUNICIPIOS, by = c("ID_MUNICIP" = "codigo_ibge_6d")) %>% 
  dplyr::mutate(VIOL_ESPEC = abjutils::rm_accent(VIOL_ESPEC),
                VIOL_ESPEC = stringr::str_remove_all(VIOL_ESPEC, "[.',+-]"),
                SEX_ESPEC = abjutils::rm_accent(SEX_ESPEC),
                SEX_ESPEC = stringr::str_remove_all(SEX_ESPEC, "[.',+-]"),
                dplyr::across(c(SG_UF_NOT:dia_ocor), abjutils::rm_accent)) %>% 
  dplyr::filter(VIOL_MOTIV == "01")

###########

writexl::write_xlsx(dadosSINAN, 
           paste0("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/MVIOL/MVIOL_project/dadosSINAN_Total.xlsx"))

dadosSINAN_Total <- read_excel("Dados/SINAN/dadosSINAN_Total.xlsx")

#######################################################################################
# RASCUNHO
#######################################################################################
  
# dados_teste2 <- dadosSINAN_2018 %>%
#   janitor::clean_names() %>% 
#   dplyr::mutate(id_mn_ocor = stringr::str_extract(id_mn_ocor, "\\d{6}")) %>% 
#   dplyr::select(id_mn_ocor, sex_espec) %>% 
#   dplyr::mutate(id_mn_ocor = base::as.numeric(id_mn_ocor)) %>%
#   dplyr::group_by(id_mn_ocor) %>% 
#   dplyr::left_join(muni_cod %>% 
#                      dplyr::mutate(codigo = base::as.numeric(codigo)), by = c("id_mn_ocor" = "codigo")) %>% 
#   dplyr::ungroup() %>% 
#   dplyr::relocate(municipio, sg_uf, id_mn_resi, sg_uf_ocor, id_mn_ocor )
  
# teste <- dadosSINAN_2018 %>% 
#   dplyr::mutate(#LB_creation_date = base::rep(Sys.Date(), 26490),
#                 DT_OCOR   = base::as.Date(DT_OCOR),
#                 data_nasc = base::as.Date(NU_IDADE_N),
#                 idade = base::floor((DT_OCOR - data_nasc)/365.25),
#                 idade = base::as.numeric(idade),
#                 nova_idade = stringr::str_extract(NU_IDADE_N, "\\d{2}$")) %>% 
#   
#   
#   dplyr::relocate(LB_creation_date, NU_IDADE_N, data_nasc, idade, nova_idade)

# dadosSINAN %>% 
#   dplyr::filter(municipio == "São José dos Ausentes") %>% 
#   janitor::tabyl(AG_AMEACA, AG_FORCA, AG_ENFOR, show_na = TRUE, show_missing_levels = TRUE)



#######################################################################################