module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",     // Localhost
      port: 7545,            // Port used by Ganache
      network_id: "*"        // Match any network id
    }
  },
  // Set the compiler version
  compilers: {
    solc: {
      version: "0.8.0"      // Replace with the Solidity version you need
    }
  }
};
