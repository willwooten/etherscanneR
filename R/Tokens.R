# Get ERC20-Token TotalSupply by ContractAddress

get_erc20_supply <- function(address, api_key){
  url <- paste0("https://api.etherscan.io/api?module=stats&action=tokensupply&contractaddress=", address, "&apikey=", api_key)
  jsonlite::fromJSON(url)$result
}

# Get ERC20-Token Account Balance for TokenContractAddress

get_erc20_balance_by_address <- function(contract_address, account_address, api_key){
  url <- paste0("https://api.etherscan.io/api?module=account&action=tokenbalance&contractaddress=", contract_address ,"&address=", account_address, "&tag=latest&apikey=", api_key)
  jsonlite::fromJSON(url)$result
}

