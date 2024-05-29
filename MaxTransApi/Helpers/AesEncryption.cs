using System;
using System.Security.Cryptography;
using System.Text;


namespace MaxTransApi.Helpers
{
    public static class AesEncryption
    {
        private static readonly byte[] Key = Encoding.UTF8.GetBytes("VeryLongSecret"); //Secret key
        private static readonly byte[] IV = Encoding.UTF8.GetBytes("HR$2pIjHR$2pIj12"); // InitializationVector

        public static string Encrypt(string plainText)
        {
            using var aes = Aes.Create();
            aes.Key = Generate128BitKeyFromPassphrase();
            aes.IV = IV;

            var encryptor = aes.CreateEncryptor(aes.Key, aes.IV);
            var data = Encoding.UTF8.GetBytes(plainText);

            var encryptedData = encryptor.TransformFinalBlock(data, 0, data.Length);
            return Convert.ToBase64String(encryptedData);
        }

        public static string Decrypt(string cipherText)
        {
            using var aes = Aes.Create();
            aes.Key = Key;
            aes.IV = IV;

            var decryptor = aes.CreateDecryptor(aes.Key, aes.IV);
            var encryptedData = Convert.FromBase64String(cipherText);

            var decryptedData = decryptor.TransformFinalBlock(encryptedData, 0, encryptedData.Length);
            return Encoding.UTF8.GetString(decryptedData);
        }

        public static byte[] Generate128BitKeyFromPassphrase()
        {
            // Use PBKDF2 to derive a 128-bit key
            using (var pbkdf2 = new Rfc2898DeriveBytes(Key, salt: IV, iterations: 10000))
            {
                return pbkdf2.GetBytes(16); // 16 bytes = 128 bits
            }
        }
    }

}


