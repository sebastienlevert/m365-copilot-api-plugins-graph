import "./mail.tsp";
import "./tasks.tsp";
import "./events.tsp";

namespace Microsoft.Graph {
  /**
   * The base URL for the Microsoft Graph API.
   */
  const BASE_URL = "https://graph.microsoft.com/v1.0";

  /**
   * Metadata for the Microsoft Graph API actions.
   */
  const ACTIONS_METADATA = #{
    nameForHuman: "Microsoft Graph API actions",
    descriptionForHuman: "Access and manage Microsoft Graph resources",
    descriptionForModel: "Provides access to Microsoft Graph resources",
    legalInfoUrl: "https://learn.microsoft.com/en-us/legal/microsoft-apis/terms-of-use",
    privacyPolicyUrl: "https://learn.microsoft.com/en-us/legal/microsoft-apis/terms-of-use",
  };
}
