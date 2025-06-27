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
namespace Microsoft.Graph.Mail {
  /**
   * Metadata for the Microsoft Graph API actions.
   */
  const ACTIONS_METADATA = #{
    nameForHuman: "Mail actions for Microsoft Graph API",
    descriptionForHuman: "Manage your emails using the Microsoft Graph API",
    descriptionForModel: "Adds the ability to  the Microsoft Graph API",
    legalInfoUrl: "https://learn.microsoft.com/en-us/legal/microsoft-apis/terms-of-use",
    privacyPolicyUrl: "https://learn.microsoft.com/en-us/legal/microsoft-apis/terms-of-use",
  };

  /**
   * Sends a message to a user.
   * @param body The request body containing the message to be sent.
   * @returns A void response indicating the message was sent successfully.
   */
  @route("/me/sendMail")
  @post
  @reasoning("""
      - If you can't find an official address, ask the user for the address they want to use.
      - Here is an example of how to send a message using the Microsoft Graph API.
        ```json
        { "message": { "subject": "Hello from TypeSpec!", "body": { "contentType": "html", "content": "<h1>Hello World</h1>" }, "toRecipients": [ { "emailAddress": { "address": "test@example.com", "name": "Test User" } } ], "ccRecipients": [ { "emailAddress": { "address": "test@example.com", "name": "Test User" } }, { "emailAddress": { "address": "test2@example.com", "name": "Test User 2" } } ] }, "saveToSentItems": true }
        ```
    """)
  op SendMessage(@body body: SendMailRequest): AcceptedResponse | ErrorResponse;
}
