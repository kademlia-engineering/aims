# How to Run with Docker

Build the image:

```docker build -t llama_webserver .```

Run the container:

```docker run -it -p 8080:8080 llama_webserver ```


Navigate to http://localhost:8080/docs to see the OpenAPI documentation. It should be a swagger page.

Once you have the llama.cpp swagger page pulled up, try out the http POST request to "/v1/chat/completions" with the request body below. In this json body, notice the first element in the "messages" array. The "role" is set to "system", this implies that the "content" field is assigning a special behavior to the chatbot. When "role" is set to "user", like the second element in the array, the content field would be a normal prompt a user would submit to a chatbot.

```
{
  "max_tokens": 512,
  "messages": [
    {
      "content": "You are a helpful assistant. Your focus is to write smart contracts in different programming languages that are able to compile to webassembly (goLang, c++, Rust...)",
      "role": "system"
    },
    {
      "content": "Can you write an NFT smart contract in golang?",
      "role": "user"
    }
  ]
}
```

The response should look something like this,

```
{
  "id": "chatcmpl-98afd8ba-a556-48b1-ac70-6b7918cf7b9c",
  "object": "chat.completion",
  "created": 1690451806,
  "model": "llama-2-13b-chat.ggmlv3.q2_K.bin",
  "choices": [
    {
      "index": 0,
      "message": {
        "role": "assistant",
        "content": "Of course! Here's an example of an NFT smart contract written in Go:\n```\n// A simple NFT contract written in Go\npackage main\n\nimport (\n\t\"fmt\"\n\t\"github.com/NFT-Foundation/nft-contracts/v1/common\"\n\t\"github.com/NFT-Foundation/nft-contracts/v1/erc20\"\n)\n\nfunc main() {\n\t// Set up the NFT contract\n\terc20.Start(nil)\n\n\t// Define the NFT's metadata\n\tmetadata := common.Metadata{\n\t\tName: \"My NFT\",\n\t\tDescription: \"This is my NFT\",\n\t\tImage: \"https://example.com/nft_image.jpg\",\n\t\tSymbol: \"NFT\",\n\t}\n\n\t// Mint the NFT\n\terc20.Mint(metadata)\n\n\t// Set the owner of the NFT\n\towner := common.Address{\n\t\tAddress: \"0x12345678901234567890123456789\",\n\t}\n\terc20.SetOwner(owner)\n\n\t// Get the current owner of the NFT\n\tcurrentOwner := erc20.GetOwner()\n\tfmt.Println(\"Current owner:\", currentOwner)\n}\n```\nThis contract is an example of a simple NFT contract written in Go, using the `erc20` package to mint and manage the NFT. The `common` package is used to define the metadata of the NFT. The contract sets up the owner of the NFT and prints out the current owner.\n\nThis is just one example of an NFT smart contract written in Go, there are many other ways to write this contract and it's important to keep in mind that this is a very simple example and in real world scenarios you would want to add more functionality and security measures to your contract.\nAlso, it's worth mentioning that this contract is not compatible with the Ethereum blockchain, it's designed to be deployed on top of the GoLang based blockchain.\nI hope this example helps you understand how an NFT smart contract written in Go would look like"
      },
      "finish_reason": "length"
    }
  ],
  "usage": {
    "prompt_tokens": 60,
    "completion_tokens": 512,
    "total_tokens": 572
  }
}
```