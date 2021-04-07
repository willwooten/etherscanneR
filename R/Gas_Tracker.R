# Get Estimation of Confirmation Time
# (Result returned in seconds, gasprice value in gwei)

get_confirmation_time_estimate <- function(gwei, api_key){
  gwei <- gwei * 1000000000
  url <- paste0("https://api.etherscan.io/api?module=gastracker&action=gasestimate&gasprice=", format(gwei, scientific=F) , "&apikey=", api_key)
  seconds <- jsonlite::fromJSON(url)$result
  as.integer(seconds)
}

# Get Gas Oracle
# (SafeGasPrice, ProposeGasPrice And FastGasPrice returned in Gwei)

get_gas_prices <- function(api_key){
  url <- paste0("https://api.etherscan.io/api?module=gastracker&action=gasoracle&apikey=", api_key)
  df <- jsonlite::fromJSON(url)$result
  data.frame(
    last_block = df$LastBlock, 
    safe_gas_price = df$SafeGasPrice, 
    proposed_gas_price = df$ProposeGasPrice, 
    fast_gas_price = df$FastGasPrice
  )
}