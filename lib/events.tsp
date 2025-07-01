import "@typespec/http";
import "@typespec/openapi3";
import "@microsoft/typespec-m365-copilot";
import "./models.tsp";
import "./auth.tsp";

using TypeSpec.Http;
using TypeSpec.M365.Copilot.Actions;
using Graph.Models;

@service
@actions(Microsoft.Graph.ACTIONS_METADATA)
namespace Microsoft.Graph.Events {
  /**
   * Metadata for the Microsoft Graph API actions.
   */
  const ACTIONS_METADATA = #{
    nameForHuman: "Events actions for Microsoft Graph API",
    descriptionForHuman: "Manage your events using the Microsoft Graph API",
    descriptionForModel: "Adds the ability to manage user events using the Microsoft Graph API",
    legalInfoUrl: "https://learn.microsoft.com/en-us/legal/microsoft-apis/terms-of-use",
    privacyPolicyUrl: "https://learn.microsoft.com/en-us/legal/microsoft-apis/terms-of-use",
  };

  /**
   * Schedule a new meeting in the user's calendar.
   * @param meeting The meeting information to be sent.
   * @returns A response containing the details of the scheduled meeting.
   */
  @route("/me/events")
  @post
  op ScheduleMeeting(@body meeting: MeetingRequest): MeetingResponse;
}
