*** Settings ***
Library      Browser
Library      BuiltIn
Library      String
Library      Collections
Library      DateTime
Library      OperatingSystem
Variables    Config.yaml

#Repositories
Resource    ../Resources/Repositories/common_repositories.resource
Resource    ../Resources/Repositories/login_repositories.resource
Resource    ../Resources/Repositories/series_detail_page_repositories.resource
Resource    ../Resources/Repositories/setting_page_repositories.resource
Resource    ../Resources/Repositories/livetv_page_repositories.resource
Resource    ../Resources/Repositories/search_repositories.resource

#Keywords
Resource    ../Resources/Keywords/common_keyword.resource
Resource    ../Resources/Keywords/open_browser_keyword.resource
Resource    ../Resources/Keywords/livetv_keyword.resource
Resource    ../Resources/Keywords/settings_keyword.resource
Resource    ../Resources/Keywords/search_keyword.resource

#Localized
Resource    ../Resources/Localized/${LANG}/common_localized.resource

#Variables
Resource    ../Resources/Variables/common_variables.resource