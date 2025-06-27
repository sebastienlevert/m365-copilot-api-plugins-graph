import "@typespec/http";
import "@typespec/openapi3";
import "@microsoft/typespec-m365-copilot";
import "./models.tsp";

using TypeSpec.Http;
using TypeSpec.M365.Copilot.Actions;
using Graph.Models;

@service
@actions(Microsoft.Graph.Tasks.ACTIONS_METADATA)
namespace Microsoft.Graph.Tasks {
  /**
   * Metadata for the Microsoft Graph API actions.
   */
  const ACTIONS_METADATA = #{
    nameForHuman: "Tasks actions for Microsoft Graph API",
    descriptionForHuman: "Manage your tasks using the Microsoft Graph API",
    descriptionForModel: "Adds the ability to manage tasks with the Microsoft Graph API",
    legalInfoUrl: "https://learn.microsoft.com/en-us/legal/microsoft-apis/terms-of-use",
    privacyPolicyUrl: "https://learn.microsoft.com/en-us/legal/microsoft-apis/terms-of-use",
  };

  namespace Cards {
    /**
     * Card for a task.
     */
    const Task = #{
      $schema: "http://adaptivecards.io/schemas/adaptive-card.json",
      type: "AdaptiveCard",
      version: "1.4",
      body: #[
        #{
          type: "Container",
          $data: "\${\$root}",
          items: #[
            #{ type: "TextBlock", text: "\${if(title, title, 'N/A')}", weight: "Bolder", wrap: true },
            #{ type: "TextBlock", text: "\${if(body.content, body.content, 'N/A')}", wrap: true }
          ],
        }
      ],
      actions: #[
        #{ type: "Action.OpenUrl", title: "View Issue", url: "https://to-do.office.com/tasks/id/\${id}/details" }
      ],
    };
  }

  /**
   * Get all todo lists available for the current user
   * @returns A list of todo task lists available for the current user. If the user has no lists, an empty array is returned.
   */
  @route("/me/todo/lists")
  @get
  op GetLists(): TodoTaskList[] | ErrorResponse;

  /**
   * Get all tasks in a list
   * @param listId The ID of the list. If you don't know the 'id', use the GetLists operation to get the full details of the lists, including the 'id'. The format of the listId is a base64 that looks like this: AAMkAGRmZDhjZGFhLTczMWQtNGI4Yy04ODc1LTdjNDMzMzgxMDY3OQAuAAAAAAAP1fvlpseATIjxKZ3OLlI5AQC4X1JL6JLcTLRDMlUKvJhRAABqKZOpAAA=.
   * @returns A list of tasks in the specified list. If the list has no tasks, an empty array is returned.
   */
  @route("/me/todo/lists/{listId}/tasks")
  @capabilities(#{
    responseSemantics: #{
      dataPath: "$.value",
      properties: #{ title: "$.title", subTitle: "$.body.content" },
      staticTemplate: Microsoft.Graph.Tasks.Cards.Task,
    },
  })
  @get
  op GetTasks(listId: string): Task[] | ErrorResponse;

  /**
   * Create a new task in a list
   * @param listId The ID of the list. If you don't know the 'id', use the GetLists operation to get the full details of the lists, including the 'id'. The format of the taskId is a base64 that looks like this: AAMkAGRmZDhjZGFhLTczMWQtNGI4Yy04ODc1LTdjNDMzMzgxMDY3OQAuAAAAAAAP1fvlpseATIjxKZ3OLlI5AQC4X1JL6JLcTLRDMlUKvJhRAABqKZOpAAA=.
   * @param task The task to create. The entire request body is the task object.
   * @returns The created task
   */
  @route("/me/todo/lists/{listId}/tasks")
  @capabilities(#{
    responseSemantics: #{
      dataPath: "$",
      properties: #{ title: "$.title", subTitle: "$.body.content" },
      staticTemplate: Microsoft.Graph.Tasks.Cards.Task,
    },
  })
  @post
  op CreateTask(listId: string, @body task: Task): Task | ErrorResponse;

  /**
   * Update an existing task in a list
   * @param listId The ID of the list. If you don't know the 'id', use the GetLists operation to get the full details of the lists, including the 'id'.
   * @param taskId The ID of the task to update. If you don't know the 'id', use the GetTasks operation to get the full details of the tasks, including the 'id'. The format of the listId is a base64 that looks like this: AAMkAGRmZDhjZGFhLTczMWQtNGI4Yy04ODc1LTdjNDMzMzgxMDY3OQBGAAAAAAAP1fvlpseATIjxKZ3OLlI5BwC4X1JL6JLcTLRDMlUKvJhRAABqKZOpAAC4X1JL6JLcTLRDMlUKvJhRAABqKzdPAAA=.
   * @param task The task to create. The entire request body is the task object.
   * @returns The updated task
   */
  @route("/me/todo/lists/{listId}/tasks/{taskId}")
  @capabilities(#{
    responseSemantics: #{
      dataPath: "$",
      properties: #{ title: "$.title", subTitle: "$.body.content" },
      staticTemplate: Microsoft.Graph.Tasks.Cards.Task,
    },
  })
  @patch(#{ implicitOptionality: false })
  op UpdateTask(listId: string, taskId: string, @body task: Task): Task | ErrorResponse;
}
