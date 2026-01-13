#######################################################################################
# Indicadores da Violência Contra a Mulher - Lei Maria da Penha
#######################################################################################
# Dados baixados em: https://www.ssp.rs.gov.br/indicadores-da-violencia-contra-a-mulher
#######################################################################################
# FUTURO: AUTOMATIZAR A LEITURA COM WEBSCRAPING
#######################################################################################


library(janitor)
library(tidyverse)
library(writexl)
library(magrittr)
library(readxl)
library(stringr)
library(janitor)
library(glue)
library(here)

#######################################################################################

MUNICIPIOS_MP <- readxl::read_excel("Dados/ShapeRS/MUNICIPIOS.xlsx") %>% 
  janitor::clean_names() %>%
  dplyr::mutate(municipio_mp = stringr::str_to_upper(municipio)) %>% 
  dplyr::mutate(municipio_mp = abjutils::rm_accent(municipio_mp),
                municipio_mp = dplyr::case_when(municipio_mp == "BARAO DO COTEGIPE" ~ "BARAO DE COTEGIPE",
                                                municipio_mp == "DR MAURICIO CARDOSO" ~ "DOUTOR MAURICIO CARDOSO",
                                                municipio_mp == "ENTRE IJUIS" ~ "ENTRE-IJUIS",
                                                municipio_mp == "FAZENDA VILA NOVA" ~ "FAZENDA VILANOVA",
                                          
                                                
                                                      municipio_mp == "NAO ME TOQUE" ~ "NAO-ME-TOQUE",
                                    
                                                            municipio_mp == "XANGRILA" ~ "XANGRI-LA",
                                                .default
                                                
                                                = municipio_mp))  

write_xlsx(MUNICIPIOS_MP, 
           paste0("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/MVIOL/MVIOL_project/MUNICIPIOS_MP.xlsx"))


MUNICIPIOS <- read_excel("Dados/ShapeRS/MUNICIPIOS.xlsx") %>% 
  janitor::clean_names()

#######################################################################################
# arquivo <- "C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/MVIOL/dados_completos/Dados/SSP_LEIPENHA/12160426-site-violencia-contra-as-mulheres-2018-atualizado-em-07-janeiro-2019-publicacao.xlsx"
# 
# sheets <- excel_sheets(arquivo)
# 
# 
# dados_2018 <- sheets %>%
#   set_names(sheets) %>%   # ou simplesmente set_names()
#   map(~ read_excel(arquivo, sheet = .x) %>% clean_names())
# 
# 
# dados_2018 <- dados_2018 %>%
#   imap(~ {
#     
#     df <- .x
#     
#     # Ajustes específicos
#     if (.y == "Ameaça") {
#       df <- df %>%
#         mutate(across(c(mai, jun, jul, ago, set, out, nov, dez), as.double)) %>%
#         slice(1:497)
#     } else if (.y == "Lesão Corporal") {
#       df <- df %>% slice(1:497)
#     }
#     
#     df %>%
#       mutate(
#         ano = "2018",
#         crime = janitor::make_clean_names(.y)
#       ) %>%
#       clean_names()
#   })
# 
# tentado_2018       <- dados_2018$`Feminicídio Tentado`
# consumado_2018    <- dados_2018$`Feminicídio Consumado`
# ameaca_2018       <- dados_2018$Ameaça
# estupro_2018      <- dados_2018$Estupro
# lesaoCorporal_2018 <- dados_2018$`Lesão Corporal`
#######################################################################################
#USANDO O PACOTE HERE
#######################################################################################
here("Dados", "SSP_LEIPENHA")
####################
# 2018
####################


tentado_2018 <- read_excel(
  here::here(
  "12160426-site-violencia-contra-as-mulheres-2018-atualizado-em-07-janeiro-2019-publicacao.xlsx"
),
sheet = "Feminicídio Tentado") %>% 
  dplyr::mutate(ano = base::rep("2018", 497),
                crime = base::rep("tentado", 497)) %>% 
  janitor::clean_names() 
  # dplyr::rename_with(\(x) stringr::str_c(x, "_2018"))


consumado_2018 <- read_excel("Dados/SSP_LEIPENHA/12160426-site-violencia-contra-as-mulheres-2018-atualizado-em-07-janeiro-2019-publicacao.xlsx", 
                             sheet = "Feminicídio Consumado") %>% 
  dplyr::mutate(ano = base::rep("2018", 497),
                crime = base::rep("consumado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2018"))


ameaca_2018 <- read_excel("Dados/SSP_LEIPENHA/12160426-site-violencia-contra-as-mulheres-2018-atualizado-em-07-janeiro-2019-publicacao.xlsx", 
                          sheet = "Ameaça") %>% 
  dplyr::mutate(dplyr::across(c(Mai, Jun, Jul, Ago, Set, Out, Nov, Dez), as.double),
                ano = base::rep("2018", 498),
                crime = base::rep("ameaca", 498)) %>% 
  dplyr::slice(1:497) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2018"))


estupro_2018 <- read_excel("Dados/SSP_LEIPENHA/12160426-site-violencia-contra-as-mulheres-2018-atualizado-em-07-janeiro-2019-publicacao.xlsx", 
                           sheet = "Estupro") %>% 
  dplyr::mutate(ano = base::rep("2018", 497),
                crime = base::rep("estupro", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2018"))


lesaoCorporal_2018 <- read_excel("Dados/SSP_LEIPENHA/12160426-site-violencia-contra-as-mulheres-2018-atualizado-em-07-janeiro-2019-publicacao.xlsx", 
                                 sheet = "Lesão Corporal") %>% 
  dplyr::mutate(ano = base::rep("2018", 498),
                crime = base::rep("lesaoCorporal", 498)) %>% 
  dplyr::slice(1:497) %>%  
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2018"))


####################
# 2019
####################

tentado_2019 <- read_excel("Dados/SSP_LEIPENHA/12160432-site-violencia-contra-as-mulheres-2019-atualizado-em-21-fevereiro-2020-publicacao.xlsx", 
                           sheet = "Feminicídio Tentado") %>% 
  dplyr::mutate(ano = base::rep("2019", 497),
                crime = base::rep("tentado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2019"))


consumado_2019 <- read_excel("Dados/SSP_LEIPENHA/12160432-site-violencia-contra-as-mulheres-2019-atualizado-em-21-fevereiro-2020-publicacao.xlsx", 
                             sheet = "Feminicídio Consumado") %>% 
  dplyr::mutate(ano = base::rep("2019", 497),
                crime = base::rep("consumado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2019"))


ameaca_2019 <- read_excel("Dados/SSP_LEIPENHA/12160432-site-violencia-contra-as-mulheres-2019-atualizado-em-21-fevereiro-2020-publicacao.xlsx", 
                          sheet = "Ameaça") %>% 
  dplyr::mutate(ano = base::rep("2019", 497),
                crime = base::rep("ameaca", 497)) %>%
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2019"))


estupro_2019 <- read_excel("Dados/SSP_LEIPENHA/12160432-site-violencia-contra-as-mulheres-2019-atualizado-em-21-fevereiro-2020-publicacao.xlsx", 
                           sheet = "Estupro") %>% 
  dplyr::mutate(ano = base::rep("2019", 497),
                crime = base::rep("estupro", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2019"))


lesaoCorporal_2019 <- read_excel("Dados/SSP_LEIPENHA/12160432-site-violencia-contra-as-mulheres-2019-atualizado-em-21-fevereiro-2020-publicacao.xlsx", 
                                 sheet = "Lesão Corporal") %>% 
  dplyr::mutate(ano = base::rep("2019", 497),
                crime = base::rep("lesaoCorporal", 497)) %>% 
  janitor::clean_names()
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2019"))

####################
# 2020
####################


tentado_2020 <- read_excel("Dados/SSP_LEIPENHA/12163332-site-violencia-contra-as-mulheres-2020-atualizado-em-05-maio-2023-publicacao.xlsx", 
                           sheet = "Feminicídio Tentado") %>% 
  dplyr::mutate(ano = base::rep("2020", 497),
                crime = base::rep("tentado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2020"))


consumado_2020 <- read_excel("Dados/SSP_LEIPENHA/12163332-site-violencia-contra-as-mulheres-2020-atualizado-em-05-maio-2023-publicacao.xlsx", 
                             sheet = "Feminicídio Consumado") %>% 
  dplyr::mutate(ano = base::rep("2020", 497),
                crime = base::rep("consumado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2020"))


ameaca_2020 <- read_excel("Dados/SSP_LEIPENHA/12163332-site-violencia-contra-as-mulheres-2020-atualizado-em-05-maio-2023-publicacao.xlsx", 
                          sheet = "Ameaça") %>% 
  dplyr::mutate(ano = base::rep("2020", 497),
                crime = base::rep("ameaca", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2020"))


estupro_2020 <- read_excel("Dados/SSP_LEIPENHA/12163332-site-violencia-contra-as-mulheres-2020-atualizado-em-05-maio-2023-publicacao.xlsx", 
                           sheet = "Estupro") %>% 
  dplyr::mutate(ano = base::rep("2020", 497),
                crime = base::rep("estupro", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2020"))


lesaoCorporal_2020 <- read_excel("Dados/SSP_LEIPENHA/12163332-site-violencia-contra-as-mulheres-2020-atualizado-em-05-maio-2023-publicacao.xlsx", 
                                 sheet = "Lesão Corporal") %>% 
  dplyr::mutate(ano = base::rep("2020", 497),
                crime = base::rep("lesaoCorporal", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2020"))



####################
# 2021
####################

tentado_2021 <- read_excel("Dados/SSP_LEIPENHA/04105912-site-violencia-contra-as-mulheres-2021-atualizado-em-04-dez-2023.xlsx", 
                                sheet = "Feminicídio Tentado") %>% 
  dplyr::mutate(ano = base::rep("2021", 497),
                crime = base::rep("tentado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2021"))


consumado_2021 <- read_excel("Dados/SSP_LEIPENHA/04105912-site-violencia-contra-as-mulheres-2021-atualizado-em-04-dez-2023.xlsx", 
                           sheet = "Feminicídio Consumado") %>% 
  dplyr::mutate(ano = base::rep("2021", 497),
                crime = base::rep("consumado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2021"))


ameaca_2021 <- read_excel("Dados/SSP_LEIPENHA/04105912-site-violencia-contra-as-mulheres-2021-atualizado-em-04-dez-2023.xlsx", 
                             sheet = "Ameaça") %>% 
  dplyr::mutate(ano = base::rep("2021", 497),
                crime = base::rep("ameaca", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2021"))


estupro_2021 <- read_excel("Dados/SSP_LEIPENHA/04105912-site-violencia-contra-as-mulheres-2021-atualizado-em-04-dez-2023.xlsx", 
                          sheet = "Estupro") %>% 
  dplyr::mutate(ano = base::rep("2021", 497),
                crime = base::rep("estupro", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2021"))


lesaoCorporal_2021 <- read_excel("Dados/SSP_LEIPENHA/04105912-site-violencia-contra-as-mulheres-2021-atualizado-em-04-dez-2023.xlsx", 
                          sheet = "Lesão Corporal") %>% 
  dplyr::mutate(ano = base::rep("2021", 497),
                crime = base::rep("lesaoCorporal", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2021"))

####################
# 2022
####################

tentado_2022 <- read_excel("Dados/SSP_LEIPENHA/17161756-indicadores-de-violencia-contra-a-mulher-geral-e-por-municipio-2022-1.xlsx", 
                           sheet = "Feminicídio Tentado") %>% 
  dplyr::mutate(ano = base::rep("2022", 497),
                crime = base::rep("tentado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2022"))


consumado_2022 <- read_excel("Dados/SSP_LEIPENHA/17161756-indicadores-de-violencia-contra-a-mulher-geral-e-por-municipio-2022-1.xlsx", 
                             sheet = "Feminicídio Consumado") %>% 
  dplyr::mutate(ano = base::rep("2022", 497),
                crime = base::rep("consumado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2022"))


ameaca_2022 <- read_excel("Dados/SSP_LEIPENHA/17161756-indicadores-de-violencia-contra-a-mulher-geral-e-por-municipio-2022-1.xlsx", 
                          sheet = "Ameaça") %>% 
  dplyr::mutate(ano = base::rep("2022", 497),
                crime = base::rep("ameaca", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2022"))


estupro_2022 <- read_excel("Dados/SSP_LEIPENHA/17161756-indicadores-de-violencia-contra-a-mulher-geral-e-por-municipio-2022-1.xlsx", 
                           sheet = "Estupro") %>% 
  dplyr::mutate(ano = base::rep("2022", 497),
                crime = base::rep("estupro", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2022"))


lesaoCorporal_2022 <- read_excel("Dados/SSP_LEIPENHA/17161756-indicadores-de-violencia-contra-a-mulher-geral-e-por-municipio-2022-1.xlsx", 
                                 sheet = "Lesão Corporal") %>% 
  dplyr::mutate(ano = base::rep("2022", 497),
                crime = base::rep("lesaoCorporal", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2022"))


####################
# 2023
####################

tentado_2023 <- read_excel("Dados/SSP_LEIPENHA/15105142-site-violencia-contra-as-mulheres-2023-atualizado-em-05-maio-2025-publicacao.xlsx", 
                           sheet = "Feminicídio Tentado") %>% 
  dplyr::mutate(ano = base::rep("2023", 497),
                crime = base::rep("tentado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2023"))


consumado_2023 <- read_excel("Dados/SSP_LEIPENHA/15105142-site-violencia-contra-as-mulheres-2023-atualizado-em-05-maio-2025-publicacao.xlsx", 
                             sheet = "Feminicídio Consumado") %>% 
  dplyr::mutate(ano = base::rep("2023", 497),
                crime = base::rep("consumado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2023"))


ameaca_2023 <- read_excel("Dados/SSP_LEIPENHA/15105142-site-violencia-contra-as-mulheres-2023-atualizado-em-05-maio-2025-publicacao.xlsx", 
                          sheet = "Ameaça") %>% 
  dplyr::mutate(ano = base::rep("2023", 497),
                crime = base::rep("ameaca", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2023"))


estupro_2023 <- read_excel("Dados/SSP_LEIPENHA/15105142-site-violencia-contra-as-mulheres-2023-atualizado-em-05-maio-2025-publicacao.xlsx", 
                           sheet = "Estupro") %>% 
  dplyr::mutate(ano = base::rep("2023", 497),
                crime = base::rep("estupro", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2023"))


lesaoCorporal_2023 <- read_excel("Dados/SSP_LEIPENHA/15105142-site-violencia-contra-as-mulheres-2023-atualizado-em-05-maio-2025-publicacao.xlsx", 
                                 sheet = "Lesão Corporal") %>% 
  dplyr::mutate(ano = base::rep("2023", 497),
                crime = base::rep("lesaoCorporal", 497)) %>% 
  janitor::clean_names()
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2023"))


####################
# 2024
####################

tentado_2024 <- read_excel("Dados/SSP_LEIPENHA/15103628-site-violencia-contra-as-mulheres-2024-atualizado-em-05-maio-2025-publicacao.xlsx", 
                           sheet = "Feminicídio Tentado") %>% 
  dplyr::mutate(ano = base::rep("2024", 497),
                crime = base::rep("tentado", 497)) %>% 
  janitor::clean_names()
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2024"))


consumado_2024 <- read_excel("Dados/SSP_LEIPENHA/15103628-site-violencia-contra-as-mulheres-2024-atualizado-em-05-maio-2025-publicacao.xlsx", 
                             sheet = "Feminicídio Consumado") %>% 
  dplyr::mutate(ano = base::rep("2024", 497),
                crime = base::rep("consumado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2024"))


ameaca_2024 <- read_excel("Dados/SSP_LEIPENHA/15103628-site-violencia-contra-as-mulheres-2024-atualizado-em-05-maio-2025-publicacao.xlsx", 
                          sheet = "Ameaça") %>% 
  dplyr::mutate(ano = base::rep("2024", 497),
                crime = base::rep("ameaca", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2024"))


estupro_2024 <- read_excel("Dados/SSP_LEIPENHA/15103628-site-violencia-contra-as-mulheres-2024-atualizado-em-05-maio-2025-publicacao.xlsx", 
                           sheet = "Estupro") %>% 
  dplyr::mutate(ano = base::rep("2024", 497),
                crime = base::rep("estupro", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2024"))


lesaoCorporal_2024 <- read_excel("Dados/SSP_LEIPENHA/15103628-site-violencia-contra-as-mulheres-2024-atualizado-em-05-maio-2025-publicacao.xlsx", 
                                 sheet = "Lesão Corporal") %>% 
  dplyr::mutate(ano = base::rep("2024", 497),
                crime = base::rep("lesaoCorporal", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2024"))


####################
# 2025
####################

tentado_2025 <- read_excel("Dados/SSP_LEIPENHA/10163332-site-violencia-contra-as-mulheres-2025-atualizado-em-05-dezembro-2025-publicacao.xlsx", 
                           sheet = "Feminicídio Tentado") %>% 
  dplyr::mutate(dplyr::across(c(Mai, Jun, Jul, Ago, Set, Out, Nov, Dez), as.double),
                ano = base::rep("2025", 497),
                crime = base::rep("tentado", 497)
                ) %>% 
  janitor::clean_names()
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2025"))


consumado_2025 <- read_excel("Dados/SSP_LEIPENHA/10163332-site-violencia-contra-as-mulheres-2025-atualizado-em-05-dezembro-2025-publicacao.xlsx", 
                             sheet = "Feminicídio Consumado") %>% 
  dplyr::mutate(dplyr::across(c(Mai, Jun, Jul, Ago, Set, Out, Nov, Dez), as.double),
                ano = base::rep("2025", 497),
                crime = base::rep("consumado", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2025"))


ameaca_2025 <- read_excel("Dados/SSP_LEIPENHA/10163332-site-violencia-contra-as-mulheres-2025-atualizado-em-05-dezembro-2025-publicacao.xlsx", 
                          sheet = "Ameaça") %>% 
  dplyr::mutate(dplyr::across(c(Mai, Jun, Jul, Ago, Set, Out, Nov, Dez), as.double),
                ano = base::rep("2025", 497),
                crime = base::rep("ameaca", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2025"))


estupro_2025 <- read_excel("Dados/SSP_LEIPENHA/10163332-site-violencia-contra-as-mulheres-2025-atualizado-em-05-dezembro-2025-publicacao.xlsx", 
                           sheet = "Estupro") %>% 
  dplyr::mutate(dplyr::across(c(Mai, Jun, Jul, Ago, Set, Out, Nov, Dez), as.double),
                ano = base::rep("2025", 497),
                crime = base::rep("estupro", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2025"))


lesaoCorporal_2025 <- read_excel("Dados/SSP_LEIPENHA/10163332-site-violencia-contra-as-mulheres-2025-atualizado-em-05-dezembro-2025-publicacao.xlsx", 
                                 sheet = "Lesão Corporal") %>% 
  dplyr::mutate(dplyr::across(c(Mai, Jun, Jul, Ago, Set, Out, Nov, Dez), as.double),
                ano = base::rep("2025", 497),
                crime = base::rep("lesaoCorporal", 497)) %>% 
  janitor::clean_names() 
  #dplyr::rename_with(\(x) stringr::str_c(x, "_2025"))


#######################################################################################
# JOIN DAS BASES
#######################################################################################

# dados_tentado <- tentado_2018 %>% 
#   dplyr::left_join(tentado_2019, by = c("municipio_2018" = "municipio_2019")) %>% 
#   dplyr::left_join(tentado_2020, by = c("municipio_2018" = "municipio_2020")) %>%
#   dplyr::left_join(tentado_2021, by = c("municipio_2018" = "municipio_2021")) %>%
#   dplyr::left_join(tentado_2022, by = c("municipio_2018" = "municipio_2022")) %>%
#   dplyr::left_join(tentado_2023, by = c("municipio_2018" = "municipio_2023")) %>%
#   dplyr::left_join(tentado_2024, by = c("municipio_2018" = "municipio_2024")) %>%
#   dplyr::left_join(tentado_2025, by = c("municipio_2018" = "municipio_2025")) 
# 
# dados_consumado <- consumado_2018 %>% 
#   dplyr::left_join(consumado_2019, by = c("municipio_2018" = "municipio_2019")) %>% 
#   dplyr::left_join(consumado_2020, by = c("municipio_2018" = "municipio_2020")) %>%
#   dplyr::left_join(consumado_2021, by = c("municipio_2018" = "municipio_2021")) %>%
#   dplyr::left_join(consumado_2022, by = c("municipio_2018" = "municipio_2022")) %>%
#   dplyr::left_join(consumado_2023, by = c("municipio_2018" = "municipio_2023")) %>%
#   dplyr::left_join(consumado_2024, by = c("municipio_2018" = "municipio_2024")) %>%
#   dplyr::left_join(consumado_2025, by = c("municipio_2018" = "municipio_2025"))
# 
# 
# dados_estupro <-   estupro_2018 %>% 
#   dplyr::left_join(estupro_2019, by = c("municipio_2018" = "municipio_2019")) %>% 
#   dplyr::left_join(estupro_2020, by = c("municipio_2018" = "municipio_2020")) %>%
#   dplyr::left_join(estupro_2021, by = c("municipio_2018" = "municipio_2021")) %>%
#   dplyr::left_join(estupro_2022, by = c("municipio_2018" = "municipio_2022")) %>%
#   dplyr::left_join(estupro_2023, by = c("municipio_2018" = "municipio_2023")) %>%
#   dplyr::left_join(estupro_2024, by = c("municipio_2018" = "municipio_2024")) %>%
#   dplyr::left_join(estupro_2025, by = c("municipio_2018" = "municipio_2025"))
# 
# 
# dados_ameaca <-    ameaca_2018 %>% 
#   dplyr::left_join(ameaca_2019, by = c("municipio_2018" = "municipio_2019")) %>% 
#   dplyr::left_join(ameaca_2020, by = c("municipio_2018" = "municipio_2020")) %>%
#   dplyr::left_join(ameaca_2021, by = c("municipio_2018" = "municipio_2021")) %>%
#   dplyr::left_join(ameaca_2022, by = c("municipio_2018" = "municipio_2022")) %>%
#   dplyr::left_join(ameaca_2023, by = c("municipio_2018" = "municipio_2023")) %>%
#   dplyr::left_join(ameaca_2024, by = c("municipio_2018" = "municipio_2024")) %>%
#   dplyr::left_join(ameaca_2025, by = c("municipio_2018" = "municipio_2025"))
# 
# 
# dados_lesaoCorporal <-    lesaoCorporal_2018 %>% 
#   dplyr::left_join(lesaoCorporal_2019, by = c("municipio_2018" = "municipio_2019")) %>% 
#   dplyr::left_join(lesaoCorporal_2020, by = c("municipio_2018" = "municipio_2020")) %>%
#   dplyr::left_join(lesaoCorporal_2021, by = c("municipio_2018" = "municipio_2021")) %>%
#   dplyr::left_join(lesaoCorporal_2022, by = c("municipio_2018" = "municipio_2022")) %>%
#   dplyr::left_join(lesaoCorporal_2023, by = c("municipio_2018" = "municipio_2023")) %>%
#   dplyr::left_join(lesaoCorporal_2024, by = c("municipio_2018" = "municipio_2024")) %>%
#   dplyr::left_join(lesaoCorporal_2025, by = c("municipio_2018" = "municipio_2025"))

sheets <- list("Feminicio Tentado"        = dados_tentado, 
               "Femicidio Consumado"      = dados_consumado,
               "Ameaça"                   = dados_ameaca,
               "Estupro"                  = dados_estupro,
               "Lesão Corporal"           = dados_lesaoCorporal)

write_xlsx(sheets, 
           paste0("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/MVIOL/MVIOL_project/dados_MVIOL.xlsx"))

#######################################################################################
# BIND
#######################################################################################

dadosTotais_MVIOLBI <- tentado_2018 %>%
  dplyr::bind_rows(tentado_2019) %>%
  dplyr::bind_rows(tentado_2020) %>%
  dplyr::bind_rows(tentado_2021) %>%
  dplyr::bind_rows(tentado_2022) %>%
  dplyr::bind_rows(tentado_2023) %>%
  dplyr::bind_rows(tentado_2024) %>%
  dplyr::bind_rows(tentado_2025) %>% 
  
  dplyr::bind_rows(consumado_2018) %>%
  dplyr::bind_rows(consumado_2019) %>%
  dplyr::bind_rows(consumado_2020) %>%
  dplyr::bind_rows(consumado_2021) %>%
  dplyr::bind_rows(consumado_2022) %>%
  dplyr::bind_rows(consumado_2023) %>%
  dplyr::bind_rows(consumado_2024) %>%
  dplyr::bind_rows(consumado_2025) %>%
  
  dplyr::bind_rows(estupro_2018) %>%
  dplyr::bind_rows(estupro_2019) %>%
  dplyr::bind_rows(estupro_2020) %>%
  dplyr::bind_rows(estupro_2021) %>%
  dplyr::bind_rows(estupro_2022) %>%
  dplyr::bind_rows(estupro_2023) %>%
  dplyr::bind_rows(estupro_2024) %>%
  dplyr::bind_rows(estupro_2025) %>%
  
  dplyr::bind_rows(ameaca_2018) %>%
  dplyr::bind_rows(ameaca_2019) %>%
  dplyr::bind_rows(ameaca_2020) %>%
  dplyr::bind_rows(ameaca_2021) %>%
  dplyr::bind_rows(ameaca_2022) %>%
  dplyr::bind_rows(ameaca_2023) %>%
  dplyr::bind_rows(ameaca_2024) %>%
  dplyr::bind_rows(ameaca_2025) %>%
  
  dplyr::bind_rows(lesaoCorporal_2018) %>%
  dplyr::bind_rows(lesaoCorporal_2019) %>%
  dplyr::bind_rows(lesaoCorporal_2020) %>%
  dplyr::bind_rows(lesaoCorporal_2021) %>%
  dplyr::bind_rows(lesaoCorporal_2022) %>%
  dplyr::bind_rows(lesaoCorporal_2023) %>%
  dplyr::bind_rows(lesaoCorporal_2024) %>%
  dplyr::bind_rows(lesaoCorporal_2025) %>% 
  
  dplyr::mutate(municipio = dplyr::case_when(municipio == "BARAO DO COTEGIPE" ~ "BARAO DE COTEGIPE",
                                             municipio == "DR MAURICIO CARDOSO" ~ "DOUTOR MAURICIO CARDOSO",
                                             municipio == "ENTRE IJUIS" ~ "ENTRE-IJUIS",
                                             municipio == "FAZENDA VILA NOVA" ~ "FAZENDA VILANOVA",
                                             municipio == "NAO ME TOQUE" ~ "NAO-ME-TOQUE",
                                             municipio == "XANGRILA" ~ "XANGRI-LA",
                                             .default = municipio)) %>% 
  dplyr::left_join(MUNICIPIOS_MP, by = c("municipio" = "municipio"))
  


write_xlsx(dadosTotais_MVIOLBI, 
           paste0("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/MVIOL/MVIOL_project//Dados/SSP_LEIPENHA/dadosTotais_MVIOLBI.xlsx"))


#######################################################################################
# TRANSFORMAÇÃO DE DADOS
#######################################################################################

library(readxl)
library(abjutils)
library(stringr)

#################

dados_MVIOL_consumado <- read_excel("Dados/SSP_LEIPENHA/dados_MVIOL.xlsx", 
                          sheet = "Femicidio Consumado") %>% 
  dplyr::select(municipio_2018, dplyr::starts_with('total')) %>%
  dplyr::mutate(municipio_2018 = dplyr::case_when(municipio_2018 == "BARAO DO COTEGIPE" ~ "BARAO DE COTEGIPE",
                                             municipio_2018 == "DR MAURICIO CARDOSO" ~ "DOUTOR MAURICIO CARDOSO",
                                             municipio_2018 == "ENTRE IJUIS" ~ "ENTRE-IJUIS",
                                             municipio_2018 == "FAZENDA VILA NOVA" ~ "FAZENDA VILANOVA",
                                             municipio_2018 == "NAO ME TOQUE" ~ "NAO-ME-TOQUE",
                                             municipio_2018 == "XANGRILA" ~ "XANGRI-LA",
                                             .default = municipio_2018))

dados_MVIOL_tentado <- read_excel("Dados/SSP_LEIPENHA/dados_MVIOL.xlsx", 
                                    sheet = "Feminicio Tentado") %>% 
  dplyr::select(municipio_2018, dplyr::starts_with('total')) %>%
  dplyr::mutate(municipio_2018 = dplyr::case_when(municipio_2018 == "BARAO DO COTEGIPE" ~ "BARAO DE COTEGIPE",
                                                  municipio_2018 == "DR MAURICIO CARDOSO" ~ "DOUTOR MAURICIO CARDOSO",
                                                  municipio_2018 == "ENTRE IJUIS" ~ "ENTRE-IJUIS",
                                                  municipio_2018 == "FAZENDA VILA NOVA" ~ "FAZENDA VILANOVA",
                                                  municipio_2018 == "NAO ME TOQUE" ~ "NAO-ME-TOQUE",
                                                  municipio_2018 == "XANGRILA" ~ "XANGRI-LA",
                                                  .default = municipio_2018))


dados_MVIOL_ameaca <- read_excel("Dados/SSP_LEIPENHA/dados_MVIOL.xlsx", 
                                  sheet = "Ameaça") %>% 
  dplyr::select(municipio_2018, dplyr::starts_with('total')) %>%
  dplyr::mutate(municipio_2018 = dplyr::case_when(municipio_2018 == "BARAO DO COTEGIPE" ~ "BARAO DE COTEGIPE",
                                                  municipio_2018 == "DR MAURICIO CARDOSO" ~ "DOUTOR MAURICIO CARDOSO",
                                                  municipio_2018 == "ENTRE IJUIS" ~ "ENTRE-IJUIS",
                                                  municipio_2018 == "FAZENDA VILA NOVA" ~ "FAZENDA VILANOVA",
                                                  municipio_2018 == "NAO ME TOQUE" ~ "NAO-ME-TOQUE",
                                                  municipio_2018 == "XANGRILA" ~ "XANGRI-LA",
                                                  .default = municipio_2018)) %>% 
  dplyr::slice(1:497)

dados_MVIOL_LesaoCorporal <- read_excel("Dados/SSP_LEIPENHA/dados_MVIOL.xlsx", 
                                 sheet = "Lesão Corporal") %>% 
  dplyr::select(municipio_2018, dplyr::starts_with('total')) %>%
  dplyr::mutate(municipio_2018 = dplyr::case_when(municipio_2018 == "BARAO DO COTEGIPE" ~ "BARAO DE COTEGIPE",
                                                  municipio_2018 == "DR MAURICIO CARDOSO" ~ "DOUTOR MAURICIO CARDOSO",
                                                  municipio_2018 == "ENTRE IJUIS" ~ "ENTRE-IJUIS",
                                                  municipio_2018 == "FAZENDA VILA NOVA" ~ "FAZENDA VILANOVA",
                                                  municipio_2018 == "NAO ME TOQUE" ~ "NAO-ME-TOQUE",
                                                  municipio_2018 == "XANGRILA" ~ "XANGRI-LA",
                                                  .default = municipio_2018)) %>% 
  dplyr::slice(1:497)

dados_MVIOL_Estupro <- read_excel("Dados/SSP_LEIPENHA/dados_MVIOL.xlsx", 
                                        sheet = "Estupro") %>% 
  dplyr::select(municipio_2018, dplyr::starts_with('total')) %>%
  dplyr::mutate(municipio_2018 = dplyr::case_when(municipio_2018 == "BARAO DO COTEGIPE" ~ "BARAO DE COTEGIPE",
                                                  municipio_2018 == "DR MAURICIO CARDOSO" ~ "DOUTOR MAURICIO CARDOSO",
                                                  municipio_2018 == "ENTRE IJUIS" ~ "ENTRE-IJUIS",
                                                  municipio_2018 == "FAZENDA VILA NOVA" ~ "FAZENDA VILANOVA",
                                                  municipio_2018 == "NAO ME TOQUE" ~ "NAO-ME-TOQUE",
                                                  municipio_2018 == "XANGRILA" ~ "XANGRI-LA",
                                                  .default = municipio_2018))


dadosTotais_LEIPENHA <- dados_MVIOL_tentado %>% 
  dplyr::left_join(dados_MVIOL_consumado,
                   by = 'municipio_2018', suffix = c(".tentado", ".consumado")) %>% 
  dplyr::left_join(dados_MVIOL_ameaca,
                   by = 'municipio_2018', suffix = c(".consumado",  ".ameaca" )) %>% 
  dplyr::left_join(dados_MVIOL_LesaoCorporal,
                   by = 'municipio_2018', suffix = c(".ameaca", ".LesaoCorporal")) %>%
  dplyr::left_join(dados_MVIOL_Estupro,
                   by = 'municipio_2018', suffix = c(".LesaoCorporal", ".Estupro")) %>% 
  dplyr::rename("total_2018.Estupro" = total_2018,
                "total_2019.Estupro" = total_2019,
                "total_2020.Estupro" = total_2020,
                "total_2021.Estupro" = total_2021,
                "total_2022.Estupro" = total_2022,
                "total_2023.Estupro" = total_2023,
                "total_2024.Estupro" = total_2024,
                "total_2025.Estupro" = total_2025) %>% 
  dplyr::left_join(MUNICIPIOS_MP,
                   by = c("municipio_2018" = "municipio_mp"))
 
  
# sheets <- list("Feminicidio Tentado"        = dados_MVIOL_tentado, 
#                "Feminicidio Consumado"      = dados_MVIOL_consumado,
#                "Ameaça"                     = dados_MVIOL_ameaca, 
#                "Lesão Corporal"             = dados_MVIOL_LesaoCorporal,
#                "Estupro"                    = dados_MVIOL_Estupro)
# 
 writexl::write_xlsx(dadosTotais_LEIPENHA, 
            paste0("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/MVIOL/MVIOL_project/Dados/SSP_LEIPENHA/dadosTotais_LEIPENHA.xlsx"))


###########################################################