namespace MaxTransApi
{
    public interface IRefreshTokenGenerator
    {
        string GenerateToken(string username);
    }
}
