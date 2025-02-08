include .env

deploy-mainnet:; forge script script/DeployTest:DeployTest.s.sol --rpc-url $(MAINNET_RPC_URL) --private-key $(PRIVATE_KEY) --verify $(ETHERSCAN_API_KEY) --broadcast -vvvvv