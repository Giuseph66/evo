# Evolution API Documentation

**Version**: 2.1.1
**Description**: No description provided.

## Authentication

### ApiKeyAuth
- **Type**: apiKey
- **In**: header
- **Name**: `apikey`
- **Description**: Your authorization key header

---

## Chat Controller

### WhatsApp Numbers

- **Endpoint**: `POST /chat/whatsappNumbers/{instance}`
- **Description**: Check if numbers are on WhatsApp
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **numbers** (array): Phone numbers (with country code) to be checked
    Array of:

---

### Mark Message As Read

- **Endpoint**: `POST /chat/markMessageAsRead/{instance}`
- **Description**: Mark message as read
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **readMessages** (array): Messages to be mark as read
    Array of:
      Object:
      - **remoteJid** (string): Chat contact or group remote JID
      - **fromMe** (boolean): If the message was sent by the instance owner or the contact
      - **id** (string): Message ID

---

### Mark Message As Unread

- **Endpoint**: `POST /chat/markChatUnread/{instance}`
- **Description**: Mark message as read
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **lastMessage** (array): Messages to be mark as unread
    Array of:
      Object:
      - **remoteJid** (string): Chat contact or group remote JID
      - **fromMe** (boolean): If the message was sent by the instance owner or the contact
      - **id** (string): Message ID
  - **chat** (string): remoteJid here

---

### Archive Chat

- **Endpoint**: `POST /chat/archiveChat/{instance}`
- **Description**: Archive Chat
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **lastMessage** (object): Messages to be mark as read
    Object:
    - **key** (object): 
      Object:
      - **remoteJid** (string): Chat contact or group remote JID
      - **fromMe** (boolean): If the message was sent by the instance owner or the contact
      - **id** (string): Message ID
  - **archive** (boolean): Whether to archive the chat or not
  - **chat** (string): remoteJid here

---

### Delete Message For Everyone

- **Endpoint**: `DELETE /chat/deleteMessageForEveryone/{instance}`
- **Description**: Delete Message For Everyone
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **id** (string): Message ID
  - **remoteJid** (string): Chat contact or group remote JID
  - **fromMe** (boolean): If the message was sent by the instance owner or the contact
  - **participant** (string): Participant for group messages only TODO

---

### Send Presence

- **Endpoint**: `POST /chat/sendPresence/{instance}`
- **Description**: Send Presence (typing...)
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): Receiver phone number with country code
  - **options** (object): 
    Object:
    - **delay** (integer): Presence display time in milliseconds
    - **presence** (string): Presence type
    - **number** (string): Number contact

---

### Update block status

- **Endpoint**: `POST /message/updateBlockStatus/{instance}`
- **Description**: Block status to contacts
- **Source File**: `src/api/routes/sendMessage.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string):  Phone number with country code
  - **status** (string): Values: block, unblock 

---

### Fetch Profile Picture URL

- **Endpoint**: `POST /chat/fetchProfilePictureUrl/{instance}`
- **Description**: Fetch Profile Picture URL
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): Number to fetch profile picture URL: {{remoteJid}}

---

### Find Contacts

- **Endpoint**: `POST /chat/findContacts/{instance}`
- **Description**: Here it is possible to list all contacts or just one,using the 'where' option.
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **where** (object): 
    Object:
    - **id** (string): Contact number: optional

---

### Get Base64 From Media Message

- **Endpoint**: `POST /chat/getBase64FromMediaMessage/{instance}`
- **Description**: Get base64 from media message
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **message** (object): 
    Object:
    - **key** (object): 
      Object:
      - **id** (string): Message ID
  - **convertToMp4** (boolean): Convert video to MP4, for video only

---

### Find Messages

- **Endpoint**: `POST /chat/findMessages/{instance}`
- **Description**: Find all messages
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **where** (object): 
    Object:
    - **key** (object): 
      Object:
      - **remoteJid** (string): Contact or group remote JID

---

### Find Status Message

- **Endpoint**: `POST /chat/findStatusMessage/{instance}`
- **Description**: Find status message
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **where** (object): 
    Object:
    - **_id** (string): MongoDB message ID
    - **id** (string): Message ID (from WhatsApp)
    - **remoteJid** (string): Contact or group remote JID
    - **fromMe** (boolean): Whether the message is from the instance owner or not
  - **limit** (integer): Limit for the return

---

### Update Message

- **Endpoint**: `POST /chat/updateMessage/{instance}`
- **Description**: Update message
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (integer): Receiver phone number with country code
  - **text** (string): New message content
  - **key** (object): 
    Object:
    - **remoteJid** (string): Chat contact or group remote JID
    - **fromMe** (boolean): If the message was sent by the instance owner or not
    - **id** (string): Message ID

---

### Find Chats

- **Endpoint**: `POST /chat/findChats/{instance}`
- **Description**: Find all chats
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name instance

---

### Fetch Business Profile

- **Endpoint**: `POST /chat/fetchBusinessProfile/{instance}`
- **Description**: Fetch business profile from phone number
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): Phone number with country code

---

### Fetch Business Profile

- **Endpoint**: `POST /chat/fetchProfile/{instance}`
- **Description**: Fetch profile from phone number
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): Phone number with country code

---

### Update Profile Name

- **Endpoint**: `POST /chat/updateProfileName/{instance}`
- **Description**: Update profile name
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **name** (string): New name for profile

---

### Update Profile Status

- **Endpoint**: `POST /chat/updateProfileStatus/{instance}`
- **Description**: Update profile status
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **status** (string): New status for profile

---

### Update Profile Picture

- **Endpoint**: `POST /chat/updateProfilePicture/{instance}`
- **Description**: Update profile picture
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **picture** (string): New spicture URL

---

### Remove Profile Picture

- **Endpoint**: `DELETE /chat/removeProfilePicture/{instance}`
- **Description**: Update profile picture
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name instance

---

### Fetch Privacy Settings

- **Endpoint**: `GET /chat/fetchPrivacySettings/{instance}`
- **Description**: Fetch privacy settings
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 

---

### Update Privacy Settings

- **Endpoint**: `POST /chat/updatePrivacySettings/{instance}`
- **Description**: Update privacy settings
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **readreceipts** (string): 
  - **profile** (string): 
  - **status** (string): 
  - **online** (string): 
  - **last** (string): 
  - **groupadd** (string): 

---

## Chatwoot Controller

### Set Chatwoot

- **Endpoint**: `POST /chatwoot/set/{instance}`
- **Description**: Set Chatwoot
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): Enable chatwoot
  - **accountId** (string): Chatwoot account ID
  - **token** (string): Chatwoot token
  - **url** (string): Chatwoot server URL
  - **signMsg** (boolean): Sign message with user name
  - **reopenConversation** (boolean): 
  - **conversationPending** (boolean): 
  - **nameInbox** (string): Name inbox chatwoot
  - **mergeBrazilContacts** (boolean): 
  - **importContacts** (boolean): Import Chatwoot contacts
  - **importMessages** (boolean): Import chatwoot messages
  - **daysLimitImportMessages** (integer): 
  - **signDelimiter** (string): Break line
  - **autoCreate** (boolean): 
  - **organization** (string): Name organization
  - **logo** (string): Url logo
  - **ignoreJids** (array): 
    Array of:

---

### Find Chatwoot

- **Endpoint**: `GET /chatwoot/find/{instance}`
- **Description**: Find Chatwoot
- **Source File**: `src/api/routes/chat.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

## Dify Controller

### Create a new Dify bot instance

- **Endpoint**: `POST /dify/create/{instance}`
- **Description**: Creates a new Dify bot with the provided configuration
- **Source File**: `src/api/integrations/chatbot/dify/routes/dify.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): 
  - **botType** (string): 
  - **apiUrl** (string): 
  - **apiKey** (string): 
  - **triggerType** (string): 
  - **triggerOperator** (string): 
  - **triggerValue** (string): 
  - **expire** (integer): 
  - **keywordFinish** (string): 
  - **delayMessage** (integer): 
  - **unknownMessage** (string): 
  - **listeningFromMe** (boolean): 
  - **stopBotFromMe** (boolean): 
  - **keepOpen** (boolean): 
  - **debounceTime** (integer): 
  - **ignoreJids** (array): 
    Array of:

---

### Create a new Dify bot instance

- **Endpoint**: `PUT /dify/update/:difyId/{instance}`
- **Description**: Update bot Dify
- **Source File**: `src/api/integrations/chatbot/dify/routes/dify.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `difyId` (path, string, Required): Id bot dify
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): 
  - **botType** (string): 
  - **apiUrl** (string): 
  - **apiKey** (string): 
  - **triggerType** (string): 
  - **triggerOperator** (string): 
  - **triggerValue** (string): 
  - **expire** (integer): 
  - **keywordFinish** (string): 
  - **delayMessage** (integer): 
  - **unknownMessage** (string): 
  - **listeningFromMe** (boolean): 
  - **stopBotFromMe** (boolean): 
  - **keepOpen** (boolean): 
  - **debounceTime** (integer): 
  - **ignoreJids** (array): 
    Array of:

---

### Atualiza as configurações do bot Dify

- **Endpoint**: `POST /dify/settings/{instance}`
- **Description**: Atualiza as configurações do bot Dify.
- **Source File**: `src/api/integrations/chatbot/dify/routes/dify.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **expire** (integer): Tempo de expiração em minutos.
  - **keywordFinish** (string): Palavra-chave que finalizará o bot.
  - **delayMessage** (integer): Tempo de delay antes do envio de uma nova mensagem (em milissegundos).
  - **unknownMessage** (string): Mensagem que será enviada quando o bot não reconhecer o comando.
  - **listeningFromMe** (boolean): Define se o bot deve ouvir mensagens enviadas pelo próprio usuário.
  - **stopBotFromMe** (boolean): Define se o bot deve parar ao receber mensagens enviadas pelo próprio usuário.
  - **keepOpen** (boolean): Define se o bot deve manter a conversa aberta após uma resposta.
  - **debounceTime** (integer): Tempo de debounce (em milissegundos).
  - **ignoreJids** (array): Lista de JIDs a serem ignorados.
    Array of:
  - **difyIdFallback** (string): ID de fallback do bot Dify.

---

### Find settings dify bot

- **Endpoint**: `GET /dify/fetchSettings/{instance}`
- **Description**: Find settigns dify bot
- **Source File**: `src/api/integrations/chatbot/dify/routes/dify.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância

---

### Altera o status do bot Dify

- **Endpoint**: `POST /dify/changeStatus/{instance}`
- **Description**: Altera o status de um bot Dify. O status pode ser `opened`, `paused`, ou `closed`. O status `closed` encerra a interação do bot.
- **Source File**: `src/api/integrations/chatbot/dify/routes/dify.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **remoteJid** (string): Número de telefone remoto no formato E.164 (ex: 5511912345678@s.whatsapp.net)
  - **status** (string): Status a ser atribuído ao bot Dify. Os valores válidos são `opened`, `paused` e `closed`.

---

### Recupera as sessões ativas do bot Dify

- **Endpoint**: `GET /dify/fetchSessions/:difyId/{instance}`
- **Description**: Recupera as sessões ativas de um bot Dify específico, com base no ID do bot (`difyId`) e na instância do bot (`instance`).
- **Source File**: `src/api/integrations/chatbot/dify/routes/dify.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `difyId` (path, string, Required): ID único do bot Dify.
  - `instance` (path, string, Required): Nome da instância.

---

### Recupera as sessões ativas do bot Flowise

- **Endpoint**: `GET /flowise/find/{instance}`
- **Description**: Fetch bots flowise
- **Source File**: `src/api/integrations/chatbot/flowise/routes/flowise.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância.

---

### Recupera as sessões ativas do bot Flowise

- **Endpoint**: `GET /flowise/find/:flowiseId/{instance}`
- **Description**: Fetch bots flowise
- **Source File**: `src/api/integrations/chatbot/flowise/routes/flowise.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância.
  - `flowiseId` (path, string, Required): Id Bot Flowise

---

### Recupera as sessões ativas do bot Flowise

- **Endpoint**: `GET /flowise/fetchSessions/:flowiseId/{instance}`
- **Description**: Fetch session flowise
- **Source File**: `src/api/integrations/chatbot/flowise/routes/flowise.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância.
  - `flowiseId` (path, string, Required): Id Bot Flowise

---

### Recupera os configurações do bot flowise

- **Endpoint**: `GET /flowise/fetchSettings/{instance}`
- **Description**: Fetch settings flowise
- **Source File**: `src/api/integrations/chatbot/flowise/routes/flowise.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância.

---

## EvoAI Controller

### Create a new evoai bot instance

- **Endpoint**: `POST /evoai/create/{instance}`
- **Description**: Creates a new EvoAI bot with the provided configuration
- **Source File**: `src/api/integrations/chatbot/evoai/routes/evoai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): 
  - **agentUrl** (string): 
  - **apiKey** (string): 
  - **triggerType** (string): 
  - **triggerOperator** (string): 
  - **triggerValue** (string): 
  - **expire** (integer): 
  - **keywordFinish** (string): 
  - **delayMessage** (integer): 
  - **unknownMessage** (string): 
  - **listeningFromMe** (boolean): 
  - **stopBotFromMe** (boolean): 
  - **keepOpen** (boolean): 
  - **debounceTime** (integer): 
  - **ignoreJids** (array): 
    Array of:

---

### Fetch EvoAI Bot

- **Endpoint**: `GET /evoai/find/{instance}`
- **Description**: Fetches EvoAI bots.
- **Source File**: `src/api/integrations/chatbot/evoai/routes/evoai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

### Find EvoAI Bot

- **Endpoint**: `GET /evoai/find/:evoaiId/{instance}`
- **Description**: Update EvoAI bot.
- **Source File**: `src/api/integrations/chatbot/evoai/routes/evoai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `evoaiId` (path, string, Required): ID of the EvoAI bot

---

### Create a new EvoAI bot instance

- **Endpoint**: `PUT /evoai/update/:evoaiId/{instance}`
- **Description**: Update bot EvoAI
- **Source File**: `src/api/integrations/chatbot/evoai/routes/evoai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `evoaiId` (path, string, Required): Id bot EvoAI
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): 
  - **agentUrl** (string): 
  - **apiKey** (string): 
  - **triggerType** (string): 
  - **triggerOperator** (string): 
  - **triggerValue** (string): 
  - **expire** (integer): 
  - **keywordFinish** (string): 
  - **delayMessage** (integer): 
  - **unknownMessage** (string): 
  - **listeningFromMe** (boolean): 
  - **stopBotFromMe** (boolean): 
  - **keepOpen** (boolean): 
  - **debounceTime** (integer): 
  - **ignoreJids** (array): 
    Array of:

---

### Atualiza as configurações do bot EvoAI

- **Endpoint**: `POST /evoai/settings/{instance}`
- **Description**: Atualiza as configurações do bot EvoAI.
- **Source File**: `src/api/integrations/chatbot/evoai/routes/evoai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **expire** (integer): Tempo de expiração em minutos.
  - **keywordFinish** (string): Palavra-chave que finalizará o bot.
  - **delayMessage** (integer): Tempo de delay antes do envio de uma nova mensagem (em milissegundos).
  - **unknownMessage** (string): Mensagem que será enviada quando o bot não reconhecer o comando.
  - **listeningFromMe** (boolean): Define se o bot deve ouvir mensagens enviadas pelo próprio usuário.
  - **stopBotFromMe** (boolean): Define se o bot deve parar ao receber mensagens enviadas pelo próprio usuário.
  - **keepOpen** (boolean): Define se o bot deve manter a conversa aberta após uma resposta.
  - **debounceTime** (integer): Tempo de debounce (em milissegundos).
  - **ignoreJids** (array): Lista de JIDs a serem ignorados.
    Array of:
  - **evoaiIdFallback** (string): ID de fallback do bot EvoAI.

---

### Find settings EvoAI bot

- **Endpoint**: `GET /evoai/fetchSettings/{instance}`
- **Description**: Find settigns EvoAI bot
- **Source File**: `src/api/integrations/chatbot/evoai/routes/evoai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância

---

### Altera o status do bot EvoAI

- **Endpoint**: `POST /evoai/changeStatus/{instance}`
- **Description**: Altera o status de um bot EvoAI. O status pode ser `opened`, `paused`, ou `closed`. O status `closed` encerra a interação do bot.
- **Source File**: `src/api/integrations/chatbot/evoai/routes/evoai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **remoteJid** (string): Número de telefone remoto no formato E.164 (ex: 5511912345678@s.whatsapp.net)
  - **status** (string): Status a ser atribuído ao bot EvoAI. Os valores válidos são `opened`, `paused` e `closed`.

---

### Recupera as sessões ativas do bot EvoAI

- **Endpoint**: `GET /evoai/fetchSessions/:evoaiId/{instance}`
- **Description**: Recupera as sessões ativas de um bot EvoAI específico, com base no ID do bot (`evoaiId`) e na instância do bot (`instance`).
- **Source File**: `src/api/integrations/chatbot/evoai/routes/evoai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `evoaiId` (path, string, Required): ID único do bot EvoAI.
  - `instance` (path, string, Required): Nome da instância.

---

## Evolution Bot Controller

### Create Evolution Bot

- **Endpoint**: `POST /evolutionBot/create/{instance}`
- **Description**: Create a new Evolution Bot configuration.
- **Source File**: `src/api/integrations/chatbot/evolutionBot/routes/evolutionBot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): Enable Evolution Bot
  - **apiUrl** (string): API URL for the bot
  - **apiKey** (string): API Key for authentication (optional)
  - **triggerType** (string): Trigger type, e.g., 'all' or 'keyword'
  - **triggerOperator** (string): Operator logic, e.g., 'contains', 'equals', 'startsWith', 'endsWith', 'regex'
  - **triggerValue** (string): Trigger value, e.g., 'test'
  - **expire** (number): Expiration time for the session (in seconds)
  - **keywordFinish** (string): Keyword to terminate the session
  - **delayMessage** (number): Delay time (in ms) for sending messages
  - **unknownMessage** (string): Message displayed when an unknown input is received
  - **listeningFromMe** (boolean): Listen to messages sent by the bot owner
  - **stopBotFromMe** (boolean): Stop bot when the owner sends a message
  - **keepOpen** (boolean): Keep the session open after processing messages
  - **debounceTime** (number): Time delay to debounce messages
  - **ignoreJids** (array): List of JIDs to ignore
    Array of:

---

### Update Evolution Bot

- **Endpoint**: `PUT /evolutionBot/update/:evolutionBotId/{instance}`
- **Description**: Update an existing Evolution Bot configuration.
- **Source File**: `src/api/integrations/chatbot/evolutionBot/routes/evolutionBot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `evolutionBotId` (path, string, Required): ID of the Evolution Bot to update
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): Enable or disable the Evolution Bot
  - **apiUrl** (string): API URL for the bot
  - **apiKey** (string): API Key for authentication (optional)
  - **triggerType** (string): Trigger type, e.g., 'all' or 'keyword'
  - **triggerOperator** (string): Operator logic, e.g., 'contains', 'equals', 'startsWith', 'endsWith', 'regex'
  - **triggerValue** (string): Trigger value, e.g., 'test'
  - **expire** (number): Expiration time for the session (in seconds)
  - **keywordFinish** (string): Keyword to terminate the session
  - **delayMessage** (number): Delay time (in ms) for sending messages
  - **unknownMessage** (string): Message displayed when an unknown input is received
  - **listeningFromMe** (boolean): Listen to messages sent by the bot owner
  - **stopBotFromMe** (boolean): Stop bot when the owner sends a message
  - **keepOpen** (boolean): Keep the session open after processing messages
  - **debounceTime** (number): Time delay to debounce messages
  - **ignoreJids** (array): List of JIDs to ignore
    Array of:

---

### Create Evolution Bot Settings

- **Endpoint**: `POST /evolutionBot/settings/{instance}`
- **Description**: Configure settings for an Evolution Bot.
- **Source File**: `src/api/integrations/chatbot/evolutionBot/routes/evolutionBot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **expire** (number): Expiration time for the session (in seconds)
  - **keywordFinish** (string): Keyword to terminate the session
  - **delayMessage** (number): Delay time (in ms) for sending messages
  - **unknownMessage** (string): Message displayed when an unknown input is received
  - **listeningFromMe** (boolean): Listen to messages sent by the bot owner
  - **stopBotFromMe** (boolean): Stop bot when the owner sends a message
  - **keepOpen** (boolean): Keep the session open after processing messages
  - **debounceTime** (number): Time delay to debounce messages
  - **ignoreJids** (array): List of JIDs to ignore
    Array of:
  - **botIdFallback** (string): Fallback bot ID to use

---

### Find EvoBot

- **Endpoint**: `GET /evolutionBot/fetchSettings/{instance}`
- **Description**: Find evolution bot settings
- **Source File**: `src/api/integrations/chatbot/evolutionBot/routes/evolutionBot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

### Find EvoBot session

- **Endpoint**: `GET /evolutionBot/fetchSessions/:evolutionBotId/{instance}`
- **Description**: Find evolution bot settings
- **Source File**: `src/api/integrations/chatbot/evolutionBot/routes/evolutionBot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `evolutionBotId` (path, string, Required): ID of the evo bot

---

## Flowise Controller

### Cria uma nova instância do Flowise

- **Endpoint**: `POST /flowise/create/{instance}`
- **Description**: Create Bot Flowise
- **Source File**: `src/api/integrations/chatbot/flowise/routes/flowise.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): Indica se a instância está habilitada ou não.
  - **apiUrl** (string): URL da API do Flowise.
  - **apiKey** (string): Chave de API (opcional).
  - **triggerType** (string): Tipo de gatilho para o bot.
  - **triggerOperator** (string): Operador para o gatilho.
  - **triggerValue** (string): Valor do gatilho.
  - **expire** (integer): Tempo de expiração do bot em minutos.
  - **keywordFinish** (string): Palavra-chave para encerrar a interação.
  - **delayMessage** (integer): Tempo de atraso para a mensagem, em milissegundos.
  - **unknownMessage** (string): Mensagem padrão quando a entrada não for reconhecida.
  - **listeningFromMe** (boolean): Indica se o bot deve ouvir apenas mensagens enviadas por você.
  - **stopBotFromMe** (boolean): Indica se o bot deve ser parado quando você enviar uma mensagem.
  - **keepOpen** (boolean): Indica se a instância do bot deve permanecer aberta.
  - **debounceTime** (integer): Tempo de debounce para a entrada, em milissegundos.
  - **ignoreJids** (array): Lista de JIDs (identificadores de usuário) que o bot deve ignorar.
    Array of:

---

### Atualiza uma instância do Flowise

- **Endpoint**: `POST /flowise/update/:flowiseId/{instance}`
- **Description**: Update flowise bot
- **Source File**: `src/api/integrations/chatbot/flowise/routes/flowise.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `flowiseId` (path, string, Required): ID da instância do Flowise
  - `instance` (path, string, Required): Nome da instância
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): Indica se a instância está habilitada ou não.
  - **apiUrl** (string): URL da API do Flowise.
  - **apiKey** (string): Chave de API (opcional).
  - **triggerType** (string): Tipo de gatilho para o bot.
  - **triggerOperator** (string): Operador para o gatilho.
  - **triggerValue** (string): Valor do gatilho.
  - **expire** (integer): Tempo de expiração do bot em minutos.
  - **keywordFinish** (string): Palavra-chave para encerrar a interação.
  - **delayMessage** (integer): Tempo de atraso para a mensagem, em milissegundos.
  - **unknownMessage** (string): Mensagem padrão quando a entrada não for reconhecida.
  - **listeningFromMe** (boolean): Indica se o bot deve ouvir apenas mensagens enviadas por você.
  - **stopBotFromMe** (boolean): Indica se o bot deve ser parado quando você enviar uma mensagem.
  - **keepOpen** (boolean): Indica se a instância do bot deve permanecer aberta.
  - **debounceTime** (integer): Tempo de debounce para a entrada, em milissegundos.
  - **ignoreJids** (array): Lista de JIDs (identificadores de usuário) que o bot deve ignorar.
    Array of:

---

### Set as configurações do Flowise

- **Endpoint**: `POST /flowise/settings/{instance}`
- **Description**: Set Settings Flowise bot
- **Source File**: `src/api/integrations/chatbot/flowise/routes/flowise.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **expire** (integer): Tempo de expiração do bot, em minutos.
  - **keywordFinish** (string): Palavra-chave que encerra a interação com o bot.
  - **delayMessage** (integer): Tempo de atraso para a mensagem, em milissegundos.
  - **unknownMessage** (string): Mensagem enviada quando o bot não reconhece a entrada.
  - **listeningFromMe** (boolean): Indica se o bot deve ouvir apenas as mensagens enviadas pelo usuário.
  - **stopBotFromMe** (boolean): Indica se o bot deve ser interrompido quando o usuário envia uma mensagem.
  - **keepOpen** (boolean): Indica se o bot deve permanecer aberto após a interação.
  - **debounceTime** (integer): Tempo de debounce em milissegundos para a entrada do usuário.
  - **ignoreJids** (array): Lista de JIDs que devem ser ignorados pelo bot.
    Array of:
  - **flowiseIdFallback** (string): ID do Flowise a ser utilizado como fallback caso a instância atual não esteja disponível.

---

### Atualiza o status de uma instância Flowise

- **Endpoint**: `POST /flowise/changeStatus/{instance}`
- **Description**: Atualiza os settings do bot flowise
- **Source File**: `src/api/integrations/chatbot/flowise/routes/flowise.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **remoteJid** (string): Identificador remoto do WhatsApp no formato JID
  - **status** (string): Novo status para a instância

---

## Group Controller

### Create Group

- **Endpoint**: `POST /group/create/{instance}`
- **Description**: Create group
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **subject** (object): Group subject
  - **description** (string): Group description
  - **participants** (array): Group members phone numbers with country code
    Array of:

---

### Update Group Subject

- **Endpoint**: `POST /group/updateGroupSubject/{instance}`
- **Description**: Update group subject
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `groupJid` (query, string, Required): Group remote JID
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **subject** (string): New group subject

---

### Update Group Description

- **Endpoint**: `POST /group/updateGroupDescription/{instance}`
- **Description**: Update group description
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `groupJid` (query, string, Required): Group remote JID
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **description** (string): New group description

---

### Fetch Group Invite Code

- **Endpoint**: `GET /group/inviteCode/{instance}`
- **Description**: Fetch group invite code
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `groupJid` (query, string, Required): Group remote JID

---

### Fetch Group Invite Code

- **Endpoint**: `GET /group/acceptInviteCode/{instance}`
- **Description**: Fetch group invite code
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): ID of the instance to connect
  - `inviteCode` (query, string, Required): Group invite code

---

### Fetch Group Invite Code

- **Endpoint**: `POST /group/revokeInviteCode/{instance}`
- **Description**: Revoke group invite
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `groupJid` (query, string, Required): Group remote JID

---

### Send Group Invite

- **Endpoint**: `POST /group/sendInvite/{instance}`
- **Description**: Send group invite
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **groupJid** (string): Group remote JID
  - **description** (string): Description to send with the invitation
  - **numbers** (array): Numbers to receive the invitation
    Array of:

---

### Find Group By Invite Code

- **Endpoint**: `GET /group/inviteInfo/{instance}`
- **Description**: Find group by invite code
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `inviteCode` (query, string, Optional): Group invite code

---

### Find Group By Remote JID

- **Endpoint**: `GET /group/findGroupInfos/{instance}`
- **Description**: Find group by remote JID
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `groupJid` (query, string, Required): Group remote JID

---

### Fetch All Groups

- **Endpoint**: `GET /group/fetchAllGroups/{instance}`
- **Description**: Fetch all groups
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `getParticipants` (query, boolean, Required): Whether to get the group members or not

---

### Fetch All Group Members

- **Endpoint**: `GET /group/participants/{instance}`
- **Description**: Fetch all group members
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `groupJid` (query, string, Required): Group remote JID

---

### Update Group Members

- **Endpoint**: `POST /group/updateParticipant/{instance}`
- **Description**: Update group members
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `groupJid` (query, string, Required): Group remote JID
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **action** (string): 
  - **participants** (array): Group members phone numbers with country code
    Array of:

---

### Update Group Settings

- **Endpoint**: `POST /group/updateSetting/{instance}`
- **Description**: Update group settings
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `groupJid` (query, string, Required): Group remote JID
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **action** (string): Group setting (`announcement` = only admins can send messages; `not_announcement` = everyone can send messages; `locked` = only admins can edit group settings; `unlocked` = everyone can edit group settings

---

### Toggle Ephemeral Group Messages

- **Endpoint**: `POST /group/toggleEphemeral/{instance}`
- **Description**: Toggle temporary messages on group
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `groupJid` (query, string, Required): Group remote JID
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **expiration** (integer): Time to expire message (in seconds)

---

### Leave Group

- **Endpoint**: `DELETE /group/leaveGroup/{instance}`
- **Description**: Leave group
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `groupJid` (query, string, Required): Group remote JID

---

### Delete Bot Flowise

- **Endpoint**: `DELETE /flowise/delete/:flowiseId/{instance}`
- **Description**: Delete Bot
- **Source File**: `src/api/integrations/chatbot/flowise/routes/flowise.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `flowiseId` (query, string, Required): Id Bot Flowise

---

### Delete Bot Evolution

- **Endpoint**: `DELETE /evolutionBot/delete/:evolutionBotId/{instance}`
- **Description**: Delete Bot
- **Source File**: `src/api/integrations/chatbot/evolutionBot/routes/evolutionBot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `evolutionBotId` (query, string, Required): Id Bot Evolution

---

## Instance Controller

### Create Instance

- **Endpoint**: `POST /instance/create`
- **Source File**: `src/api/routes/instance.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **instanceName** (string): instance (Instance name)
  - **token** (string): apikey (Enter or leave empty to create dynamically)
  - **qrcode** (boolean): Create QR Code automatically after creation
  - **number** (string): 559999999999 (Instance owner number with Country Code)
  - **integration** (string): WhatsApp engine
  - **rejectCall** (boolean): Reject WhatsApp calls automatically
  - **msgCall** (string): Message to be sent when a call is rejected automatically
  - **groupsIgnore** (boolean): Ignore group messages
  - **alwaysOnline** (boolean): Keep WhatsApp always online
  - **readMessages** (boolean): Send read receipts to received messages
  - **readStatus** (boolean): Show sent messages read status
  - **syncFullHistory** (boolean): Syncronize full WhatsApp history with EvolutionAPI
  - **proxyHost** (string): proxy host
  - **proxyPort** (string): proxy port
  - **proxyProtocol** (string): proxy protocol
  - **proxyUsername** (string): proxy Username
  - **proxyPassword** (string): proxy password
  - **webhook** (object): Webhook URL
    Object:
    - **url** (string): The URL of the webhook.
    - **byEvents** (boolean): Enable Webhook by events
    - **base64** (boolean): Sends files in base64 when available
    - **headers** (object): Headers for send the API from webhook
      Object:
      - **authorization** (string): Your authorization key header
      - **Content-Type** (string): content-type
    - **events** (array): Events to be sent to the Webhook
      Array of:
  - **rabbitmq** (object): 
    Object:
    - **enabled** (boolean): Enable RabbitMQ
    - **events** (array): Events to be sent to the RabbitMQ
      Array of:
  - **sqs** (object): Enable SQS
    Object:
    - **enabled** (boolean): Enable SQS
    - **events** (array): Events to be sent to the SQS
      Array of:
  - **chatwootAccountId** (integer): Chatwoot account ID
  - **chatwootToken** (string): Chatwoot authentication token
  - **chatwootUrl** (string): Chatwoot server URL
  - **chatwootSignMsg** (boolean): Send message signature on Chatwoot
  - **chatwootReopenConversation** (boolean): Reopen conversation on Chatwoot
  - **chatwootConversationPending** (boolean): TODO
  - **chatwootImportContacts** (boolean): Import Chatwoot contacts
  - **chatwootNameInbox** (string): Name inbox chatwoot
  - **chatwootMergeBrazilContacts** (boolean): TODO
  - **chatwootImportMessages** (boolean): Import chatwoot messages
  - **chatwootDaysLimitImportMessages** (integer): Limit message import chatwoot
  - **chatwootOrganization** (string): Evolution Bot
  - **chatwootLogo** (string): https://evolution-api.com/files/evolution-api-favicon.png

---

### Fetch Instances

- **Endpoint**: `GET /instance/fetchInstances`
- **Description**: Returns the instance with the name informed in the parameter, or all the instances if empty.
- **Source File**: `src/api/routes/instance.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instanceName` (query, string, Optional): Name of the instance to be fetched
  - `instanceId` (query, string, Optional): ID of the instance to be fetched

---

### Instances Connect

- **Endpoint**: `GET /instance/connect/{instance}`
- **Description**: Generates and returns the QR code for WhatsApp connection
- **Source File**: `src/api/routes/instance.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance to connect
  - `number` (query, string, Optional): Phone number (with country code) to be connected

---

### Restart Instance

- **Endpoint**: `PUT /instance/restart/{instance}`
- **Description**: Restarts the instance
- **Source File**: `src/api/routes/instance.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance to restart

---

### Connection State

- **Endpoint**: `GET /instance/connectionState/{instance}`
- **Description**: Gets the state of the connection
- **Source File**: `src/api/routes/instance.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance to get status connect

---

### Logout Instance

- **Endpoint**: `DELETE /instance/logout/{instance}`
- **Description**: Makes logout on instance
- **Source File**: `src/api/routes/instance.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance to logout

---

### Delete Instance

- **Endpoint**: `DELETE /instance/delete/{instance}`
- **Description**: Delete instance
- **Source File**: `src/api/routes/instance.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance to delete

---

### Set Presence

- **Endpoint**: `POST /instance/setPresence/{instance}`
- **Description**: Deletes instance
- **Source File**: `src/api/routes/instance.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance to connect
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **presence** (string): 

---

## Message Controller

### Send Text

- **Endpoint**: `POST /message/sendText/{instance}`
- **Description**: Send plain text message
- **Source File**: `src/api/routes/sendMessage.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): Number to receive the message (with country code)
  - **text** (string): Test message to send
  - **delay** (integer): Presence time in milliseconds before sending message
  - **linkPreview** (boolean): Shows a preview of the target website if there's a link within the message
  - **mentionsEveryOne** (boolean): Mentioned everyone when the message send
  - **mentioned** (array): Numbers to mention
    Array of:
  - **quoted** (object): 
    Object:
    - **key** (object): 
      Object:
      - **id** (string): Quoted message ID
    - **message** (object): 
      Object:
      - **conversation** (string): Quoted message content

---

### Send Media

- **Endpoint**: `POST /message/sendMedia/{instance}`
- **Description**: Send media message
- **Source File**: `src/api/routes/sendMessage.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): Number to receive the message (with country code)
  - **mediatype** (string): Image, video or document
  - **mimetype** (string): image/png
  - **caption** (string): Teste de caption
  - **media** (string): Url or base64
  - **fileName** (string): Image.png
  - **delay** (integer): Presence time in milliseconds before sending message
  - **linkPreview** (boolean): Shows a preview of the target website if there's a link within the message
  - **mentionsEveryOne** (boolean): Mentioned everyone when the message send
  - **mentioned** (array): Numbers to mention
    Array of:
  - **quoted** (object): 
    Object:
    - **key** (object): 
      Object:
      - **id** (string): Quoted message ID
    - **message** (object): 
      Object:
      - **conversation** (string): Quoted message content

---

### Send WhatsApp Audio

- **Endpoint**: `POST /message/sendWhatsAppAudio/{instance}`
- **Description**: Send WhatsApp Audio
- **Source File**: `src/api/routes/sendMessage.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): ID of the instance to connect
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): Number to receive the message (with country code)
  - **audio** (string): url or base64 
  - **delay** (integer): Presence time in milliseconds before sending message
  - **linkPreview** (boolean): Shows a preview of the target website if there's a link within the message
  - **mentionsEveryOne** (boolean): Mentioned everyone when the message send
  - **mentioned** (array): Numbers to mention
    Array of:
  - **quoted** (object): 
    Object:
    - **key** (object): 
      Object:
      - **id** (string): Quoted message ID
    - **message** (object): 
      Object:
      - **conversation** (string): Quoted message content

---

### Send Sticker

- **Endpoint**: `POST /message/sendSticker/{instance}`
- **Description**: Send Sticker
- **Source File**: `src/api/routes/sendMessage.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): Number to receive the message (with country code)
  - **sticker** (string): Url or base64 
  - **delay** (integer): Presence time in milliseconds before sending message
  - **linkPreview** (boolean): Shows a preview of the target website if there's a link within the message
  - **mentionsEveryOne** (boolean): Mentioned everyone when the message send
  - **mentioned** (array): Numbers to mention
    Array of:
  - **quoted** (object): 
    Object:
    - **key** (object): 
      Object:
      - **id** (string): Quoted message ID
    - **message** (object): 
      Object:
      - **conversation** (string): Quoted message content

---

### Send Status

- **Endpoint**: `POST /message/sendStatus/{instance}`
- **Description**: Post WhatsApp status (stories)
- **Source File**: `src/api/routes/sendMessage.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **type** (string): status type
  - **content** (string): status type
  - **caption** (string): Optional for image or video
  - **backgroundColor** (string): Exemple #008000
  - **font** (number): 1 = SERIF 2 = NORICAN_REGULAR 3 = BRYNDAN_WRITE 4 = BEBASNEUE_REGULAR 5 = OSWALD_HEAVY 
  - **allContacts** (boolean): true to send to all contacts or false to send to statusJidList below 
  - **statusJidList** (array): Numbers to send status
    Array of:

---

### Send Location

- **Endpoint**: `POST /message/sendLocation/{instance}`
- **Description**: Send Location
- **Source File**: `src/api/routes/sendMessage.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): Number to receive the message (with country code)
  - **name** (string): Name the city
  - **address** (string): Location address
  - **latitude** (number): Latitude location
  - **longitude** (number): Longitude location
  - **delay** (integer): Presence time in milliseconds before sending message
  - **linkPreview** (boolean): Shows a preview of the target website if there's a link within the message
  - **mentionsEveryOne** (boolean): Mentioned everyone when the message send
  - **mentioned** (array): Numbers to mention
    Array of:
  - **quoted** (object): 
    Object:
    - **key** (object): 
      Object:
      - **id** (string): Quoted message ID
    - **message** (object): 
      Object:
      - **conversation** (string): Quoted message content

---

### Send Contact

- **Endpoint**: `POST /message/sendContact/{instance}`
- **Description**: Send Contact
- **Source File**: `src/api/routes/sendMessage.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): Number to receive the message (with country code)
  - **contact** (array): 
    Array of:
      Object:
      - **fullName** (string): Contact full name
      - **wuid** (string): Phone number non-stylized with country code (553198296801)
      - **phoneNumber** (string): Phone number stylized (+55 31 9 9999-9999)
      - **organization** (string): Organization name for the contact
      - **email** (string): Contact email address
      - **url** (string): Page URL

---

### Send Reaction

- **Endpoint**: `POST /message/sendReaction/{instance}`
- **Description**: Send Reaction
- **Source File**: `src/api/routes/sendMessage.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **key** (object): 
    Object:
    - **remoteJid** (string): Chat contact or group remote JID
    - **fromMe** (boolean): If the message was sent by the instance owner or not
    - **id** (string): Message ID
  - **reaction** (string): Reaction emoji

---

### Send Poll

- **Endpoint**: `POST /message/sendPoll/{instance}`
- **Description**: Send Poll
- **Source File**: `src/api/routes/sendMessage.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): {{remoteJid}}
  - **name** (string): Main text of the poll
  - **selectableCount** (number): Ex: 1
  - **values** (array): Values for question
    Array of:
  - **delay** (integer): Presence time in milliseconds before sending message
  - **linkPreview** (boolean): Shows a preview of the target website if there's a link within the message
  - **mentionsEveryOne** (boolean): Mentioned everyone when the message send
  - **mentioned** (array): Numbers to mention
    Array of:
  - **quoted** (object): 
    Object:
    - **key** (object): 
      Object:
      - **id** (string): Quoted message ID
    - **message** (object): 
      Object:
      - **conversation** (string): Quoted message content

---

### Send List

- **Endpoint**: `POST /message/sendList/{instance}`
- **Description**: Send List
- **Source File**: `src/api/routes/sendMessage.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): {{remoteJid}}
  - **title** (string): Title of list
  - **description** (string): Description for lists
  - **buttonText** (string): Text Button
  - **footerText** (string): footer list
https://examplelink.com.br
  - **values** (array): 
    Array of:
      Object:
      - **title** (string): title item of list
      - **rows** (array): 
        Array of:
          Object:
          - **title** (string): Title of row
          - **description** (string): Description of row
          - **rowId** (string): Id of row
  - **delay** (integer): Presence time in milliseconds before sending message
  - **linkPreview** (boolean): Shows a preview of the target website if there's a link within the message
  - **mentionsEveryOne** (boolean): Mentioned everyone when the message send
  - **mentioned** (array): Numbers to mention
    Array of:
  - **quoted** (object): 
    Object:
    - **key** (object): 
      Object:
      - **id** (string): Quoted message ID
    - **message** (object): 
      Object:
      - **conversation** (string): Quoted message content

---

### Send Buttons

- **Endpoint**: `POST /message/sendButtons/{instance}`
- **Description**: Send Buttons
- **Source File**: `src/api/routes/sendMessage.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **number** (string): {{remoteJid}}
  - **title** (string): Title Button
  - **description** (string): Description for buttons
  - **footer** (string): Text Button
  - **buttons** (array): 
    Array of:
      Object:
      - **title** (string): Types: reply,url,call
      - **displayText** (string): Text of button
      - **id** (string): Id button
  - **delay** (integer): Presence time in milliseconds before sending message
  - **linkPreview** (boolean): Shows a preview of the target website if there's a link within the message
  - **mentionsEveryOne** (boolean): Mentioned everyone when the message send
  - **mentioned** (array): Numbers to mention
    Array of:
  - **quoted** (object): 
    Object:
    - **key** (object): 
      Object:
      - **id** (string): Quoted message ID
    - **message** (object): 
      Object:
      - **conversation** (string): Quoted message content

---

## OpenAI Controller

### Set OpenAI Bot Settings

- **Endpoint**: `POST /openai/settings/{instance}`
- **Description**: Set settings for an OpenAI bot instance.
- **Source File**: `src/api/integrations/chatbot/openai/routes/openai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **openaiCredsId** (string): The OpenAI credentials ID
  - **expire** (integer): Expiration time in seconds
  - **keywordFinish** (string): Keyword to finish the interaction
  - **delayMessage** (integer): Delay time for the message in milliseconds
  - **unknownMessage** (string): Message when the input is not recognized
  - **listeningFromMe** (boolean): Indicates if the bot is listening for commands from the user
  - **stopBotFromMe** (boolean): Indicates if the bot should stop upon user command
  - **keepOpen** (boolean): Indicates if the bot session should remain open
  - **debounceTime** (integer): Time in milliseconds to wait before processing the next input
  - **ignoreJids** (array): List of JIDs (Jabber IDs) to ignore
    Array of:
  - **openaiIdFallback** (string): Fallback OpenAI credentials ID if the main one fails

---

### Change OpenAI Bot Status

- **Endpoint**: `POST /openai/changeStatus/{instance}`
- **Description**: Changes the status of the OpenAI bot instance.
- **Source File**: `src/api/integrations/chatbot/openai/routes/openai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **remoteJid** (string): The JID (Jabber ID) of the remote contact
  - **status** (string): Status of the bot instance. Possible values: 'opened', 'paused', 'closed'

---

### Fetch sessions of the OpenAI bot instance

- **Endpoint**: `GET /openai/fetchSessions/:openaiBotId/{instance}`
- **Description**: Fetches the sessions of the specified OpenAI bot instance.
- **Source File**: `src/api/integrations/chatbot/openai/routes/openai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `openaiBotId` (path, string, Required): ID of the OpenAI bot
  - `instance` (path, string, Required): Name of the instance

---

### Fetch Bot Dify

- **Endpoint**: `GET /dify/find/{instance}`
- **Description**: Fetches dify bots.
- **Source File**: `src/api/integrations/chatbot/dify/routes/dify.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

### Find Bot Dify

- **Endpoint**: `GET /dify/find/:difyId/{instance}`
- **Description**: Update dify bot.
- **Source File**: `src/api/integrations/chatbot/dify/routes/dify.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `difyId` (path, string, Required): ID of the dify bot

---

### Find Bot Evo

- **Endpoint**: `GET /evolutionBot/fetch/:evolutionBotId/{instance}`
- **Description**: Update evo bot.
- **Source File**: `src/api/integrations/chatbot/evolutionBot/routes/evolutionBot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `evolutionBotId` (path, string, Required): ID of the evo bot

---

### Find Bots Evo

- **Endpoint**: `GET /evolutionBot/find/{instance}`
- **Description**: Update evo bots.
- **Source File**: `src/api/integrations/chatbot/evolutionBot/routes/evolutionBot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

## OpenIA Controller

### Create OpenAI

- **Endpoint**: `POST /openai/create/{instance}`
- **Description**: Create an OpenAI bot with detailed configuration
- **Source File**: `src/api/integrations/chatbot/openai/routes/openai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): Indicates whether the bot is enabled
  - **openaiCredsId** (string): ID of the OpenAI credentials
  - **botType** (string): Type of the bot (e.g., 'assistant')
  - **assistantId** (string): Unique identifier for the assistant
  - **functionUrl** (string): URL for additional bot functionality
  - **model** (string): Model to be used (e.g., 'gpt-4o')
  - **systemMessages** (array): Messages to define system behavior
    Array of:
  - **assistantMessages** (array): Predefined assistant messages
    Array of:
  - **userMessages** (array): Predefined user messages
    Array of:
  - **maxTokens** (integer): Maximum number of tokens per interaction
  - **triggerType** (string): Type of trigger for the bot
  - **triggerOperator** (string): Operator for trigger evaluation
  - **triggerValue** (string): Value to trigger the bot
  - **expire** (integer): Expiration time in seconds
  - **keywordFinish** (string): Keyword to terminate the bot interaction
  - **delayMessage** (integer): Delay before the bot responds, in milliseconds
  - **unknownMessage** (string): Message to display for unrecognized input
  - **listeningFromMe** (boolean): Indicates if the bot listens to messages from the user
  - **stopBotFromMe** (boolean): Indicates if the bot can be stopped by the user
  - **keepOpen** (boolean): Indicates if the bot session remains open
  - **debounceTime** (integer): Debounce time for message processing
  - **ignoreJids** (array): List of JIDs to ignore
    Array of:

---

### Find OpenAI Bots

- **Endpoint**: `GET /openai/find/{instance}`
- **Description**: Get OpenAI bot with detailed configuration
- **Source File**: `src/api/integrations/chatbot/openai/routes/openai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

### Find OpenAI Bot

- **Endpoint**: `GET /openai/find/:openaiBotId/{instance}`
- **Description**: Get OpenAI bot with detailed configuration
- **Source File**: `src/api/integrations/chatbot/openai/routes/openai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `openaiBotId` (path, string, Required): ID of the bot

---

### Delete OpenAI Bot

- **Endpoint**: `DELETE /openai/delete/:openaiBotId/{instance}`
- **Description**: Delete bot OpenAi
- **Source File**: `src/api/integrations/chatbot/openai/routes/openai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `openaiBotId` (path, string, Required): ID of the bot

---

### Update OpenAI Bot

- **Endpoint**: `PUT /openai/update/:openaiBotId/{instance}`
- **Description**: Update OpenAI bot with detailed configuration
- **Source File**: `src/api/integrations/chatbot/openai/routes/openai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `openaiBotId` (path, string, Required): ID of the bot
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): Indicates if the bot is enabled
  - **openaiCredsId** (string): The OpenAI credentials ID
  - **botType** (string): The type of bot (either 'assistant' or 'chatCompletion')
  - **assistantId** (string): The ID of the assistant (only if 'botType' is 'assistant')
  - **functionUrl** (string): The function URL that the bot will call
  - **model** (string): The OpenAI model to use for chat completion (e.g., 'gpt-4o')
  - **systemMessages** (array): The system messages to define the assistant behavior
    Array of:
  - **assistantMessages** (array): Messages to be sent by the assistant
    Array of:
  - **userMessages** (array): Messages sent by the user
    Array of:
  - **maxTokens** (integer): Maximum number of tokens for the bot's responses
  - **triggerType** (string): The trigger type for the bot (e.g., 'keyword' or 'all')
  - **triggerOperator** (string): The operator to match the trigger type
  - **triggerValue** (string): The value that triggers the bot (e.g., 'teste')
  - **expire** (integer): The expiration time of the bot instance in minutes
  - **keywordFinish** (string): Keyword to end the bot interaction
  - **delayMessage** (integer): Time in milliseconds to delay the message
  - **unknownMessage** (string): Message to send if the bot doesn't recognize the input
  - **listeningFromMe** (boolean): Indicates if the bot should listen for messages from the user
  - **stopBotFromMe** (boolean): Indicates if the bot can be stopped by the user
  - **keepOpen** (boolean): Indicates if the bot session should remain open
  - **debounceTime** (integer): Time in milliseconds for the debounce delay
  - **ignoreJids** (array): List of JIDs to ignore
    Array of:

---

### Creds OpenAI Bot

- **Endpoint**: `POST /openai/creds/{instance}`
- **Description**: Creds openia bot configuration
- **Source File**: `src/api/integrations/chatbot/openai/routes/openai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **apiKey** (string): 
  - **name** (string): 

---

### Find OpenAI Creds

- **Endpoint**: `GET /openai/creds/{instance}`
- **Description**: Get OpenAI Creds
- **Source File**: `src/api/integrations/chatbot/openai/routes/openai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

### Delete OpenAI Creds

- **Endpoint**: `DELETE /openai/creds/:openaiCredsId/{instance}`
- **Description**: Delete bot OpenAi
- **Source File**: `src/api/integrations/chatbot/openai/routes/openai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `openaiCredsId` (path, string, Required): ID of the creds

---

### Find OpenAI Settings

- **Endpoint**: `GET /openai/fetchSettings/{instance}`
- **Description**: Find settings OpenAi
- **Source File**: `src/api/integrations/chatbot/openai/routes/openai.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

## RabbitMQ Controller

### Set RabbitMQ

- **Endpoint**: `POST /rabbitmq/set/{instance}`
- **Description**: Set RabbitMQ
- **Source File**: `src/api/integrations/event/rabbitmq/rabbitmq.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **rabbitmq** (object): 
    Object:
    - **enabled** (boolean): 
    - **events** (array): Events to be sent to the Webhook
      Array of:

---

### Find RabbitMQ

- **Endpoint**: `GET /rabbitmq/find/{instance}`
- **Description**: Find RabbitMQ
- **Source File**: `src/api/integrations/event/rabbitmq/rabbitmq.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

## SQS Controller

### Set SQS

- **Endpoint**: `POST /sqs/set/{instance}`
- **Description**: Set SQS
- **Source File**: `src/api/integrations/event/sqs/sqs.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **sqs** (object): 
    Object:
    - **enabled** (boolean): 
    - **events** (array): Events to be sent to the Webhook
      Array of:

---

### Find SQS

- **Endpoint**: `GET /sqs/find/{instance}`
- **Description**: Find SQS
- **Source File**: `src/api/integrations/event/sqs/sqs.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

## Settings Controller

### Set Settings

- **Endpoint**: `POST /settings/set/{instance}`
- **Description**: Set settings
- **Source File**: `src/api/routes/settings.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **rejectCall** (boolean): Reject calls automatically
  - **msgCall** (string): Message to be sent when a call is rejected automatically
  - **groupsIgnore** (boolean): Ignore group messages
  - **alwaysOnline** (boolean): Always show WhatsApp online
  - **readMessages** (boolean): Send read receipts
  - **readStatus** (boolean): See message status
  - **syncFullHistory** (boolean): Syncronize full WhatsApp history with EvolutionAPI

---

## Typebot Controller

### Create Typebot

- **Endpoint**: `POST /typebot/create/{instance}`
- **Description**: Set typebot
- **Source File**: `src/api/integrations/chatbot/typebot/routes/typebot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): 
  - **url** (string): Typebot URL
  - **typebot** (string): Typebot name
  - **triggerType** (string): All or keyword
  - **triggerOperator** (string): Operator logic, ex: contains, equals, startsWith, endsWith, regex
  - **triggerValue** (string): All or keyword
  - **expire** (number): Time to expire session
  - **keywordFinish** (string): Keyword to finish session
  - **delayMessage** (number): Delay when the bot send message
  - **unknownMessage** (string): Unrecognized message
  - **listeningFromMe** (boolean): Marked as viewed
  - **stopBotFromMe** (boolean): Stop bot when I send message
  - **keepOpen** (boolean): Keep session open
  - **debounceTime** (number): Start typebot for your own messages

---

### Start Typebot

- **Endpoint**: `POST /typebot/start/{instance}`
- **Description**: Start typebot
- **Source File**: `src/api/integrations/chatbot/typebot/routes/typebot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **url** (string): Typebot URL
  - **typebot** (string): Typebot name
  - **remoteJid** (string): Receiver remote JID
  - **startSession** (boolean): Start a new session
  - **variables** (array): 
    Array of:
      Object:
      - **name** (string): Variable name
      - **value** (string): Variable value

---

### Change Session Status

- **Endpoint**: `POST /typebot/changeStatus/{instance}`
- **Description**: Change status session
- **Source File**: `src/api/integrations/chatbot/typebot/routes/typebot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **remoteJid** (string): {{remoteJid}}
  - **status** (string): Typebot status, types: opened, paused, closed

---

### Change Session Status

- **Endpoint**: `POST /typebot/settings/{instance}`
- **Description**: Set settings typebot
- **Source File**: `src/api/integrations/chatbot/typebot/routes/typebot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **expire** (string): Time to expire session bot
  - **keywordFinish** (string): Keyword to finished session
  - **delayMessage** (string): Delay when the bot send message
  - **unknownMessage** (string): Unrecognized message
  - **listeningFromMe** (string): 
  - **stopBotFromMe** (string): Stop bot when I send message
  - **keepOpen** (string): Keep session open
  - **debounceTime** (string): Time 
  - **ignoreJids** (string): Jids ignore from bot
  - **typebotIdFallback** (string): Id fallback

---

### Find Typebot

- **Endpoint**: `GET /typebot/fetchSettings/{instance}`
- **Description**: Find typebot settings
- **Source File**: `src/api/integrations/chatbot/typebot/routes/typebot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

### Find Typebot

- **Endpoint**: `GET /typebot/find/{instance}`
- **Description**: Find typebot
- **Source File**: `src/api/integrations/chatbot/typebot/routes/typebot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

### Find Typebot

- **Endpoint**: `GET /typebot/fetch/:typebotId/{instance}`
- **Description**: Find typebot
- **Source File**: `src/api/integrations/chatbot/typebot/routes/typebot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `typebotId` (path, string, Required): ID of the typebot

---

### Find session typebot

- **Endpoint**: `GET /typebot/fetchSessions/:typebotId/{instance}`
- **Description**: Find session typebot
- **Source File**: `src/api/integrations/chatbot/typebot/routes/typebot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `typebotId` (path, string, Required): ID of the typebot

---

### Change Typebot Status

- **Endpoint**: `POST /typebot/update/:typebotId/{instance}`
- **Description**: Start typebot
- **Source File**: `src/api/integrations/chatbot/typebot/routes/typebot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `typebotId` (path, string, Required): ID of the typebot
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): Enable typebot
  - **url** (string): Url of typebot
  - **typebot** (string): Nmae typebot
  - **expire** (number): Time to expire session
  - **keywordFinish** (string): Keyword to finished session
  - **delayMessage** (number): Delay when the bot send message
  - **unknownMessage** (string): Unrecognized message
  - **listeningFromMe** (boolean): Listening message for me
  - **stopBotFromMe** (boolean): Stop bot when I send message
  - **keepOpen** (boolean): Keep session open
  - **debounceTime** (number): The timestamp of the message.
  - **triggerType** (string): All or keyword
  - **triggerOperator** (string): Operator logic, ex: contains, equals, startsWith, endsWith, regex
  - **triggerValue** (string): Ex: evolution

---

### Delete Status

- **Endpoint**: `DELETE /typebot/delete/:typebotId/{instance}`
- **Description**: Delete typebot
- **Source File**: `src/api/integrations/chatbot/typebot/routes/typebot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `typebotId` (path, string, Required): ID of the typebot

---

### Change Session Status

- **Endpoint**: `POST /evolutionBot/changeStatus/{instance}`
- **Description**: Change status session
- **Source File**: `src/api/integrations/chatbot/evolutionBot/routes/evolutionBot.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **remoteJid** (string): {{remoteJid}}
  - **status** (string): Typebot status, types: opened, paused, closed

---

## Uncategorized

### Get information about your EvolutionAPI

- **Endpoint**: `GET /`
- **Description**: Get information about your EvolutionAPI
- **Source File**: `Unknown`
- **Authentication**: Public (check specific endpoint logic)
- **Parameters**:
  - `instance` (path, string, Required): ID of the instance to connect

---

## Update group picture

### Update group picture

- **Endpoint**: `POST /group/updateGroupPicture/{instance}`
- **Description**: Update group picture
- **Source File**: `src/api/routes/group.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance 
  - `groupJid` (query, string, Required): Group remote JID
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **image** (string): New profile picture image URL

---

## Webhook Controller

### Set Webhook

- **Endpoint**: `POST /webhook/set/{instance}`
- **Description**: Set Webhook for instance
- **Source File**: `src/api/integrations/event/webhook/webhook.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): enable webhook to instance
  - **url** (string): Webhook URL
  - **webhookByEvents** (boolean): Enables Webhook by events
  - **webhookBase64** (boolean): Sends files in base64 when available
  - **events** (array): Events to be sent to the Webhook
    Array of:

---

### Find Webhook

- **Endpoint**: `GET /webhook/find/{instance}`
- **Description**: Fetch Webhook configuration
- **Source File**: `src/api/integrations/event/webhook/webhook.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

### Find Webhook

- **Endpoint**: `GET /settings/find/{instance}`
- **Description**: Fetch Webhook configuration
- **Source File**: `src/api/routes/settings.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance to get settings

---

## Websocket Controller

### Set Websocket

- **Endpoint**: `POST /websocket/set/{instance}`
- **Description**: Set Websocket
- **Source File**: `src/api/integrations/event/websocket/websocket.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **websocket** (object): 
    Object:
    - **enabled** (boolean): 
    - **events** (array): Events to be sent to the websocket
      Array of:

---

### Find Websocket

- **Endpoint**: `GET /websocket/find/{instance}`
- **Description**: Find Websocket
- **Source File**: `src/api/integrations/event/websocket/websocket.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

## n8n Controller

### Create a new n8n bot instance

- **Endpoint**: `POST /n8n/create/{instance}`
- **Description**: Creates a new n8n bot with the provided configuration
- **Source File**: `src/api/integrations/chatbot/n8n/routes/n8n.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): 
  - **webhookUrl** (string): 
  - **basicAuthUser** (string): 
  - **basicAuthPassword** (string): 
  - **triggerType** (string): 
  - **triggerOperator** (string): 
  - **triggerValue** (string): 
  - **expire** (integer): 
  - **keywordFinish** (string): 
  - **delayMessage** (integer): 
  - **unknownMessage** (string): 
  - **listeningFromMe** (boolean): 
  - **stopBotFromMe** (boolean): 
  - **keepOpen** (boolean): 
  - **debounceTime** (integer): 
  - **ignoreJids** (array): 
    Array of:

---

### Fetch n8n Bot

- **Endpoint**: `GET /n8n/find/{instance}`
- **Description**: Fetches n8n bots.
- **Source File**: `src/api/integrations/chatbot/n8n/routes/n8n.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance

---

### Find n8n Bot

- **Endpoint**: `GET /n8n/find/:n8nId/{instance}`
- **Description**: Update n8n bot.
- **Source File**: `src/api/integrations/chatbot/n8n/routes/n8n.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `n8nId` (path, string, Required): ID of the n8n bot

---

### Create a new n8n bot instance

- **Endpoint**: `PUT /n8n/update/:n8nId/{instance}`
- **Description**: Update bot n8n
- **Source File**: `src/api/integrations/chatbot/n8n/routes/n8n.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Name of the instance
  - `n8nId` (path, string, Required): Id bot n8n
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **enabled** (boolean): 
  - **webhookUrl** (string): 
  - **basicAuthUser** (string): 
  - **basicAuthPassword** (string): 
  - **triggerType** (string): 
  - **triggerOperator** (string): 
  - **triggerValue** (string): 
  - **expire** (integer): 
  - **keywordFinish** (string): 
  - **delayMessage** (integer): 
  - **unknownMessage** (string): 
  - **listeningFromMe** (boolean): 
  - **stopBotFromMe** (boolean): 
  - **keepOpen** (boolean): 
  - **debounceTime** (integer): 
  - **ignoreJids** (array): 
    Array of:

---

### Atualiza as configurações do bot n8n

- **Endpoint**: `POST /n8n/settings/{instance}`
- **Description**: Atualiza as configurações do bot n8n.
- **Source File**: `src/api/integrations/chatbot/n8n/routes/n8n.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **expire** (integer): Tempo de expiração em minutos.
  - **keywordFinish** (string): Palavra-chave que finalizará o bot.
  - **delayMessage** (integer): Tempo de delay antes do envio de uma nova mensagem (em milissegundos).
  - **unknownMessage** (string): Mensagem que será enviada quando o bot não reconhecer o comando.
  - **listeningFromMe** (boolean): Define se o bot deve ouvir mensagens enviadas pelo próprio usuário.
  - **stopBotFromMe** (boolean): Define se o bot deve parar ao receber mensagens enviadas pelo próprio usuário.
  - **keepOpen** (boolean): Define se o bot deve manter a conversa aberta após uma resposta.
  - **debounceTime** (integer): Tempo de debounce (em milissegundos).
  - **ignoreJids** (array): Lista de JIDs a serem ignorados.
    Array of:
  - **n8nIdFallback** (string): ID de fallback do bot n8n.

---

### Find settings n8n bot

- **Endpoint**: `GET /n8n/fetchSettings/{instance}`
- **Description**: Find settigns n8n bot
- **Source File**: `src/api/integrations/chatbot/n8n/routes/n8n.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância

---

### Altera o status do bot n8n

- **Endpoint**: `POST /n8n/changeStatus/{instance}`
- **Description**: Altera o status de um bot n8n. O status pode ser `opened`, `paused`, ou `closed`. O status `closed` encerra a interação do bot.
- **Source File**: `src/api/integrations/chatbot/n8n/routes/n8n.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `instance` (path, string, Required): Nome da instância
- **Request Body**:
  - Content-Type: `application/json`
  Object:
  - **remoteJid** (string): Número de telefone remoto no formato E.164 (ex: 5511912345678@s.whatsapp.net)
  - **status** (string): Status a ser atribuído ao bot n8n. Os valores válidos são `opened`, `paused` e `closed`.

---

### Recupera as sessões ativas do bot n8n

- **Endpoint**: `GET /n8n/fetchSessions/:n8nId/{instance}`
- **Description**: Recupera as sessões ativas de um bot n8n específico, com base no ID do bot (`n8nId`) e na instância do bot (`instance`).
- **Source File**: `src/api/integrations/chatbot/n8n/routes/n8n.router.ts`
- **Authentication**: Required
  - **ApiKeyAuth** (header: `apikey`)
- **Parameters**:
  - `n8nId` (path, string, Required): ID único do bot n8n.
  - `instance` (path, string, Required): Nome da instância.

---

