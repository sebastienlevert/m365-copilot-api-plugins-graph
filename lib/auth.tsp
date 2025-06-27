import "@typespec/http";
import "@typespec/openapi3";
import "@microsoft/typespec-m365-copilot";

using TypeSpec.Http;

namespace Microsoft.Graph.Auth {
  /**
   * Azure Active Directory (AAD) Token Authentication Flow
   * @template AuthUrl The authorization URL.
   * @template TokenUrl The token URL.
   * @template Scopes A list of scopes the token applies to.
   */
  model AadTokenAuthFlow<
    Scopes extends string[],
    AuthUrl extends string,
    TokenUrl extends string,
    RefreshUrl extends string
  > extends TypeSpec.Http.AuthorizationCodeFlow {
    type: OAuth2FlowType.authorizationCode;
    authorizationUrl: AuthUrl;
    tokenUrl: TokenUrl;
    refreshUrl: RefreshUrl;
    scopes: Scopes;
  }

  /**
   * Azure Active Directory OAuth2 Flow
   * @template AuthUrl The authorization URL.
   * @template TokenUrl The token URL.
   * @template Scopes A list of scopes the token applies to.
   */
  model AadOauth2Auth<
    Scopes extends string[],
    AuthUrl extends string = "https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize",
    TokenUrl extends string = "https://login.microsoftonline.com/organizations/oauth2/v2.0/token",
    RefreshUrl extends string = "https://login.microsoftonline.com/organizations/oauth2/v2.0/token"
  > is OAuth2Auth<[AadTokenAuthFlow<Scopes, AuthUrl, TokenUrl, RefreshUrl>]>;
}
