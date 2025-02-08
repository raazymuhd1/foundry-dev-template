include .env

deploy-mainnet:; forge script script/DeployTest:DeployTest.s.sol --rpc-url $(MAINNET_RPC_URL) --private-key $(PRIVATE_KEY) --verify $(ETHERSCAN_API_KEY) --broadcast -vvvvv

# gas snapshot
snapshot:; forge snapshot

# compilation
build:; forge build

# clean up cache
clean:; forge clean

# formatting sol code
fmt:; forge fmt src/Counter.sol

# Display a tree visualization of the project’s dependency graph
tree:; forge tree

# verify contract manually
verify:; $ forge verify-contract --help

# managin deps
remove-deps:; forge remove deps-name

# remappings 
remaps:; forge remappings --pretty

# reports coverage
cover:; forge coverage

# generate documentation
doc:; forge doc --out doc-path

# cloning contract from block-explorer
clone:; forge clone --chain 1 contractAddresses