# Get Total Supply of Ether

get_total_eth_supply <- function(api_key){
  url <- paste0("https://api.etherscan.io/api?module=stats&action=ethsupply&apikey=", api_key)
  as.numeric(jsonlite::fromJSON(url)$result) / 1000000000000000000
}

# Get ether last price

get_eth_price <- function(api_key){
  url <- paste0("https://api.etherscan.io/api?module=stats&action=ethprice&apikey=", api_key)
  df <- jsonlite::fromJSON(url)$result
  data.frame(
    "eth/btc" = df$ethbtc, 
    "eth/btc_timestamp" = as_datetime(as.numeric(df$ethbtc_timestamp)), 
    "eth/usd" = df$ethusd, 
    "eth/usd_timestamp" = as_datetime(as.numeric(df$ethusd_timestamp))
  )
}

# Get Ethereum Nodes Size
# [Parameters] startdate and enddate format 'yyyy-MM-dd', clienttype value is 'geth' or 'parity', syncmode value is 'default' or 'archive'
# (The chainsize return in bytes.)

get_eth_nodes_size <- function(start_date, end_date, client = "geth"){
  url <- paste0("https://api.etherscan.io/api?module=stats&action=chainsize&startdate=", start_date, "&enddate=", end_date, "&clienttype=", client, "&syncmode=default&sort=asc&apikey=", api_key)
  jsonlite::fromJSON(url)$result
}

# Get Total Nodes Count

get_eth_node_count <- function(api_key){
  url <- paste0("https://api.etherscan.io/api?module=stats&action=nodecount&apikey=", api_key)
  df <- jsonlite::fromJSON(url)$result
  data.frame(
    date = df$UTCDate, 
    node_count = df$TotalNodeCount
  )
}


