# Get Block And Uncle Rewards by BlockNo

get_block_uncle_rewards <- function(block_num, api_key){
  url <- paste0("https://api.etherscan.io/api?module=block&action=getblockreward&blockno=", block_num, "&apikey=", api_key)
  df <- jsonlite::fromJSON(url)$result
  data.frame(
    block_number = df$blockNumber, 
    timestamp = df$timeStamp, 
    block_miner = df$blockMiner, 
    block_reward = df$blockReward, 
    uncle_miner = df$uncles$miner, 
    uncle_position = df$uncles$unclePosition, 
    uncle_block_reward = df$uncles$blockreward, 
    uncle_inclusion_reward = df$uncleInclusionReward
  )
}

# Get Estimated Block Countdown Time by BlockNo

estimated_block_countdown <- function(block_num, api_key){
  url <- paste0("https://api.etherscan.io/api?module=block&action=getblockcountdown&blockno=", block_num, "&apikey=", api_key)
  jsonlite::fromJSON(url)
  
  if(jsonlite::fromJSON(url)$status == "0"){
    jsonlite::fromJSON(url)$result
  } else {
    df <- jsonlite::fromJSON(url)$result
    data.frame(
      current_block = df$CurrentBlock, 
      countdown_block = df$CountdownBlock, 
      remaining_blocks = df$RemainingBlock, 
      est_time_seconds = df$EstimateTimeInSec
    )
  }
}


