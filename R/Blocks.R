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