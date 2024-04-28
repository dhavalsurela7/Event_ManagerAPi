using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;

namespace LIBRARY
{
    public class JWT
    {
        private const string Secret = "db3OIsj+BXE9NZDy0t8W3TcNekrF+2d/1sFnWG4HnV8TZY30iTOdtVWJG8abWvB1GlOgJuQZdcF2Luqm/hccMw==";


        public static string GenerateToken(string email, string role)
        {
            var token = "";
            try
            {


                int expireMinutes = 20;
                var symmetricKey = Convert.FromBase64String(Secret);
                var tokenHandler = new JwtSecurityTokenHandler();

                var now = DateTime.UtcNow;
                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(new[]
                    {
            new Claim(ClaimTypes.Email, email),
            new Claim(ClaimTypes.Role, role)
        }),

                    Expires = now.AddMinutes(Convert.ToInt32(expireMinutes)),

                    SigningCredentials = new SigningCredentials(
                        new SymmetricSecurityKey(symmetricKey),
                        SecurityAlgorithms.HmacSha256Signature)
                };

                var stoken = tokenHandler.CreateToken(tokenDescriptor);
                token = tokenHandler.WriteToken(stoken);
                token = Encryption.Encrypt(token,"you can't decode this");

            }
            catch (Exception ex)
            {

                InsertLog.WriteErrrorLog("JWT=>GenerateToken=>Exception" + ex.Message + ex.StackTrace);
            }
            return token;
        }
    }
}
