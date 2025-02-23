include .env

deploy-mainnet:; forge script script/DeployTest:DeployTest.s.sol --rpc-url $(MAINNET_RPC_URL) --private-key $(PRIVATE_KEY) --verify $(ETHERSCAN_API_KEY) --broadcast -vvvvv

verifying:; forge verify-contract \
    --rpc-url $(MONAD_TESTNET) \
    --verifier sourcify \
    --verifier-url https://sourcify-api-monad.blockvision.org \
     0xe4c8e73E74dA4a1ad8B3a900f76C6911D01adf8d \
    src/CoolDev.sol:CoolDev \

# gas snapshot
snapshot:; forge snapshot

# compilation
build:; forge build

# clean up cache
clean:; forge clean

# formatting sol code
fmt:; forge fmt src/CoolDev.sol

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