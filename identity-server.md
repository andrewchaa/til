    // adding role claims 
    Scope should have Scope claim of "role"

    For example, if you want to add roles for api scope, api scope needs to have role scope claim.

    var scopes = con.Query<Scope>("select * from Scopes where Enabled = 1 and Name in @names", new { names = scopeNames });
    foreach (var sScope in scopes)
    {
        var scope = new Scope
        {
            Enabled = localScope.Enabled,
            Name = localScope.Name,
            DisplayName = localScope.DisplayName,
            Description = localScope.Description,
            Type = localScope.ScopeType
        };

        var claims = con.Query<Claim>("select * from Claims where ScopeId = @scopeId", new {scopeId = scope.Id}).ToList();
        if (localClaims.Any())
        {
            scope.Claims = localClaims.Select(c => new ScopeClaim(c.Name, true)).ToList();
        }

        scopes.Add(scope);
    }
