# Check Contract Execution Status (if there was an error during contract execution)
# Note: isError":"0" = Pass , isError":"1" = Error during Contract Execution

tx_check_contract_execution <- function(tx_hash, api_key){
  url <- paste0("https://api.etherscan.io/api?module=transaction&action=getstatus&txhash=", tx_hash , "&apikey=", api_key)
  df <- jsonlite::fromJSON(url)$result
  data.frame(
    tx_hash = tx_hash,
    isError = df$isError, 
    Description = df$errDescription
  )
}

# Check Transaction Receipt Status (Only applicable for Post Byzantium fork transactions)
# Note: status: 0 = Fail, 1 = Pass. Will return null/empty value for pre-byzantium fork

tx_check_receipt_status <- function(tx_hash, api_key){
  url <- paste0("https://api.etherscan.io/api?module=transaction&action=gettxreceiptstatus&txhash=", tx_hash , "&apikey=", api_key)
  df <- jsonlite::fromJSON(url)
  data.frame(
    tx_hash = tx_hash,
    status = df$status, 
    message = df$message
  )
}