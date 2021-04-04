# eth_blockNumber
# Returns the number of most recent block

eth_blocknumber <- function(api_key){
  url <- paste0("https://api.etherscan.io/api?module=proxy&action=eth_blockNumber&apikey=", api_key)
  df <- jsonlite::fromJSON(url)
  data.frame(
    block_hex = df$result, 
    block_num = as.numeric(df$result)
  )
}

# eth_getBlockByNumber
# Returns information about a block by block number

eth_get_block_by_number <- function(block_hex, api_key){
  df_list <- list()
  url <- paste0("https://api.etherscan.io/api?module=proxy&action=eth_getBlockByNumber&tag=", block_hex, "&boolean=true&apikey=", api_key)
  df <- jsonlite::fromJSON(url)$result
  df_list[[1]] <- data.frame(
    difficulty = df$difficulty, 
    extra_data = df$extraData, 
    gas_limit = df$gasLimit, 
    gas_used = df$gasUsed, 
    block_hash = df$hash, 
    logs_bloom = df$logsBloom, 
    miner = df$miner, 
    mix_hash = df$mixHash, 
    nonce = df$nonce, 
    block_hex = df$number, 
    parent_hash = df$parentHash, 
    receipts_root = df$receiptsRoot, 
    sha3_uncles = df$sha3Uncles, 
    size = df$size, 
    state_root = df$stateRoot, 
    timestamp = df$timestamp, 
    total_difficulty = df$totalDifficulty, 
    tx_root = df$transactionsRoot
  )
  df_list[[2]] <- df$transactions
  df_list[[3]] <- df$uncles
  df_list
}

# eth_getUncleByBlockNumberAndIndex
# Returns information about a uncle by block number

eth_get_uncle_by_block_hex_index <- function(block_hex, index = "0x0", api_key){
  df_list <- list()
  url <- paste0("https://api.etherscan.io/api?module=proxy&action=eth_getUncleByBlockNumberAndIndex&tag=", block_hex ,"&index=", index, "&apikey=", api_key)
  df <- jsonlite::fromJSON(url)$result
  df_list[[1]] <- data.frame(
    difficulty = df$difficulty, 
    extra_data = df$extraData, 
    gas_limit = df$gasLimit, 
    gas_used = df$gasUsed, 
    block_hash = df$hash, 
    logs_bloom = df$logsBloom, 
    miner = df$miner, 
    mix_hash = df$mixHash, 
    nonce = df$nonce, 
    block_hex = df$number, 
    parent_hash = df$parentHash, 
    receipts_root = df$receiptsRoot, 
    sha3_uncles = df$sha3Uncles, 
    size = df$size, 
    state_root = df$stateRoot, 
    timestamp = df$timestamp,
    transaction_root = df$transactionsRoot
  )
  df_list[[2]] <- df$uncles
  df_list
}

