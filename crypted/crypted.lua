local crypted = {}

-- Exemple de clé de chiffrement (cela devrait être plus sécurisé en production)
local secretKey = "5eWgr8naX12SdfLW"

-- Fonction de chiffrement des données
function crypted.encrypt(text)
    local cipherText = ""
    for i = 1, #text do
        local char = text:sub(i, i)
        local keyChar = secretKey:sub((i % #secretKey) + 1, (i % #secretKey) + 1)
        local encryptedChar = string.char(bit.bxor(string.byte(char), string.byte(keyChar)))
        cipherText = cipherText .. encryptedChar
    end
    return cipherText
end

-- Fonction de déchiffrement des données
function crypted.decrypt(encryptedText)
    local originalText = ""
    for i = 1, #encryptedText do
        local char = encryptedText:sub(i, i)
        local keyChar = secretKey:sub((i % #secretKey) + 1, (i % #secretKey) + 1)
        local decryptedChar = string.char(bit.bxor(string.byte(char), string.byte(keyChar)))
        originalText = originalText .. decryptedChar
    end
    return originalText
end

-- Exemple de test de chiffrement et déchiffrement
local testString = "Password123"
local encryptedString = crypted.encrypt(testString)
local decryptedString = crypted.decrypt(encryptedString)

print("Original: " .. testString)
print("Encrypted: " .. encryptedString)
print("Decrypted: " .. decryptedString)

return crypted
