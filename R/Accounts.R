# Get Ether Balance for a list/vector of addresses

get_address_balances <- function(addresses, api_key){
  url <- paste0("https://api.etherscan.io/api?module=account&action=balancemulti&address=", paste(addresses, collapse=","), "&tag=latest&apikey=", api_key)
  jsonlite::fromJSON(url)$result
}

# Get a list of 'Normal' Transactions By Address
# [Optional Parameters] startblock: starting blockNo to retrieve results, endblock: ending blockNo to retrieve results
# (To get paginated results use page=<page number> and offset=<max records to return>)

get_address_txs_normal <- function(address, api_key, start_block = 0, end_block = 99999999, sort = "asc", page = 1){
  url <- paste0("https://api.etherscan.io/api?module=account&action=txlist&address=", address,"&startblock=", start_block,"&endblock=", end_block,"&page=", page, "&sort=", sort, "&apikey=", api_key)
  jsonlite::fromJSON(url)$result
}

# Get a list of 'Internal' Transactions by Address
# [Optional Parameters] startblock: starting blockNo to retrieve results, endblock: ending blockNo to retrieve results

get_address_txs_internal <- function(address, api_key, start_block = 0, end_block = 99999999, sort = "asc", page = 1){
  url <- paste0("https://api.etherscan.io/api?module=account&action=txlistinternal&address=", address,"&startblock=", start_block,"&endblock=", end_block,"&page=", page, "&sort=", sort, "&apikey=", api_key)
  jsonlite::fromJSON(url)$result
}

# Get "Internal Transactions" by Transaction Hash

get_internal_txs_by_txhash <- function(hash, api_key){
  url <- paste0("https://api.etherscan.io/api?module=account&action=txlistinternal&txhash=", tx_hash , "&apikey=", api_key)
  jsonlite::fromJSON(url)$result
}

# Get "Internal Transactions" by Block Range

get_internal_txs_by_blockrange <- function(start_block = 0, end_block = 99999999, sort = "asc", page = 1){
  url <- paste0("https://api.etherscan.io/api?module=account&action=txlistinternal&startblock=", start_block, "&endblock=", end_block, "&page=1&sort=asc&apikey=", api_key)
  jsonlite::fromJSON(url)$result
}

# Get a list of "ERC20 - Token Transfer Events" by Address
# [Optional Parameters] startblock: starting blockNo to retrieve results, endblock: ending blockNo to retrieve results

get_erc20_transfers_by_address <- function(address, api_key, start_block = 0, end_block = 99999999, sort = "asc"){
  url <- paste0("https://api.etherscan.io/api?module=account&action=tokentx&address=", address, "&startblock=", start_block ,"&endblock=", end_block, "&sort=", sort, "&apikey=", api_key)
  jsonlite::fromJSON(url)$result
}

# Get a list of "ERC20 - Token Transfer Events" by Contract Address

get_erc20_transfers_by_contract <- function(contract_address, api_key){
  url <- paste0("https://api.etherscan.io/api?module=account&action=tokentx&contractaddress=", contract_address,"&page=1&sort=asc&apikey=", api_key)
  jsonlite::fromJSON(url)$result
}


