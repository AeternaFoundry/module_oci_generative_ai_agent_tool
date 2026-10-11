variable "generative_ai_agent_tools" {
  description = <<EOT
Map of generative_ai_agent_tools, attributes below
Required:
    - agent_id
    - compartment_id
    - description
    - tool_config (block):
        - agent_endpoint_id (optional)
        - api_schema (optional, block):
            - api_schema_input_location_type (required)
            - bucket (optional)
            - content (optional)
            - namespace (optional)
            - object (optional)
        - database_connection (optional, block):
            - connection_id (required)
            - connection_type (required)
        - database_schema (optional, block):
            - bucket (optional)
            - content (optional)
            - input_location_type (required)
            - namespace (optional)
            - prefix (optional)
        - dialect (optional)
        - embedding_llm_customization (optional, block):
            - instruction (optional)
            - llm_hyper_parameters (optional)
            - llm_selection (optional, block):
                - endpoint_id (optional)
                - llm_selection_type (required)
                - model_id (optional)
        - function (optional, block):
            - description (optional)
            - name (optional)
            - parameters (optional)
        - generation_llm_customization (optional, block):
            - instruction (optional)
            - llm_hyper_parameters (optional)
            - llm_selection (optional, block):
                - endpoint_id (optional)
                - llm_selection_type (required)
                - model_id (optional)
        - http_endpoint_auth_config (optional, block):
            - http_endpoint_auth_sources (optional, block):
                - http_endpoint_auth_scope (optional)
                - http_endpoint_auth_scope_config (optional, block):
                    - client_id (optional)
                    - http_endpoint_auth_scope_config_type (required)
                    - idcs_url (optional)
                    - key_location (optional)
                    - key_name (optional)
                    - scope_url (optional)
                    - vault_secret_id (optional)
        - icl_examples (optional, block):
            - bucket (optional)
            - content (optional)
            - input_location_type (required)
            - namespace (optional)
            - prefix (optional)
        - knowledge_base_configs (optional, block):
            - knowledge_base_id (optional)
        - model_size (optional)
        - reasoning_llm_customization (optional, block):
            - instruction (optional)
            - llm_hyper_parameters (optional)
            - llm_selection (optional, block):
                - endpoint_id (optional)
                - llm_selection_type (required)
                - model_id (optional)
        - reranking_llm_customization (optional, block):
            - instruction (optional)
            - llm_hyper_parameters (optional)
            - llm_selection (optional, block):
                - endpoint_id (optional)
                - llm_selection_type (required)
                - model_id (optional)
        - runtime_version (optional)
        - should_enable_self_correction (optional)
        - should_enable_sql_execution (optional)
        - subnet_id (optional)
        - table_and_column_description (optional, block):
            - bucket (optional)
            - content (optional)
            - input_location_type (required)
            - namespace (optional)
            - prefix (optional)
        - tool_config_type (required)
Optional:
    - defined_tags
    - display_name
    - freeform_tags
    - metadata
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    agent_id       = string
    compartment_id = string
    description    = string
    defined_tags   = optional(map(string))
    display_name   = optional(string)
    freeform_tags  = optional(map(string))
    metadata       = optional(map(string))
    tool_config = object({
      agent_endpoint_id = optional(string)
      api_schema = optional(object({
        api_schema_input_location_type = string
        bucket                         = optional(string)
        content                        = optional(string)
        namespace                      = optional(string)
        object                         = optional(string)
      }))
      database_connection = optional(object({
        connection_id   = string
        connection_type = string
      }))
      database_schema = optional(object({
        bucket              = optional(string)
        content             = optional(string)
        input_location_type = string
        namespace           = optional(string)
        prefix              = optional(string)
      }))
      dialect = optional(string)
      embedding_llm_customization = optional(object({
        instruction          = optional(string)
        llm_hyper_parameters = optional(map(string))
        llm_selection = optional(object({
          endpoint_id        = optional(string)
          llm_selection_type = string
          model_id           = optional(string)
        }))
      }))
      function = optional(object({
        description = optional(string)
        name        = optional(string)
        parameters  = optional(map(string))
      }))
      generation_llm_customization = optional(object({
        instruction          = optional(string)
        llm_hyper_parameters = optional(map(string))
        llm_selection = optional(object({
          endpoint_id        = optional(string)
          llm_selection_type = string
          model_id           = optional(string)
        }))
      }))
      http_endpoint_auth_config = optional(object({
        http_endpoint_auth_sources = optional(list(object({
          http_endpoint_auth_scope = optional(string)
          http_endpoint_auth_scope_config = optional(object({
            client_id                            = optional(string)
            http_endpoint_auth_scope_config_type = string
            idcs_url                             = optional(string)
            key_location                         = optional(string)
            key_name                             = optional(string)
            scope_url                            = optional(string)
            vault_secret_id                      = optional(string)
          }))
        })))
      }))
      icl_examples = optional(object({
        bucket              = optional(string)
        content             = optional(string)
        input_location_type = string
        namespace           = optional(string)
        prefix              = optional(string)
      }))
      knowledge_base_configs = optional(list(object({
        knowledge_base_id = optional(string)
      })))
      model_size = optional(string)
      reasoning_llm_customization = optional(object({
        instruction          = optional(string)
        llm_hyper_parameters = optional(map(string))
        llm_selection = optional(object({
          endpoint_id        = optional(string)
          llm_selection_type = string
          model_id           = optional(string)
        }))
      }))
      reranking_llm_customization = optional(object({
        instruction          = optional(string)
        llm_hyper_parameters = optional(map(string))
        llm_selection = optional(object({
          endpoint_id        = optional(string)
          llm_selection_type = string
          model_id           = optional(string)
        }))
      }))
      runtime_version               = optional(string)
      should_enable_self_correction = optional(bool)
      should_enable_sql_execution   = optional(bool)
      subnet_id                     = optional(string)
      table_and_column_description = optional(object({
        bucket              = optional(string)
        content             = optional(string)
        input_location_type = string
        namespace           = optional(string)
        prefix              = optional(string)
      }))
      tool_config_type = string
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_agent_tools : (
        contains([for v in ["AGENT_TOOL_CONFIG", "FUNCTION_CALLING_TOOL_CONFIG", "HTTP_ENDPOINT_TOOL_CONFIG", "RAG_TOOL_CONFIG", "SQL_TOOL_CONFIG"] : lower(v)], lower(v.tool_config.tool_config_type))
      )
    ])
    error_message = "must be one of: \"AGENT_TOOL_CONFIG\", \"FUNCTION_CALLING_TOOL_CONFIG\", \"HTTP_ENDPOINT_TOOL_CONFIG\", \"RAG_TOOL_CONFIG\", \"SQL_TOOL_CONFIG\""
  }
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_agent_tools : (
        v.tool_config.api_schema == null || (contains([for v in ["INLINE", "OBJECT_STORAGE_LOCATION"] : lower(v)], lower(v.tool_config.api_schema.api_schema_input_location_type)))
      )
    ])
    error_message = "must be one of: \"INLINE\", \"OBJECT_STORAGE_LOCATION\""
  }
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_agent_tools : (
        v.tool_config.database_connection == null || (contains([for v in ["DATABASE_TOOL_CONNECTION"] : lower(v)], lower(v.tool_config.database_connection.connection_type)))
      )
    ])
    error_message = "must be one of: \"DATABASE_TOOL_CONNECTION\""
  }
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_agent_tools : (
        v.tool_config.database_schema == null || (contains([for v in ["INLINE", "OBJECT_STORAGE_PREFIX"] : lower(v)], lower(v.tool_config.database_schema.input_location_type)))
      )
    ])
    error_message = "must be one of: \"INLINE\", \"OBJECT_STORAGE_PREFIX\""
  }
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_agent_tools : (
        v.tool_config.embedding_llm_customization == null || (v.tool_config.embedding_llm_customization.llm_selection == null || (contains([for v in ["CUSTOM_GEN_AI_ENDPOINT", "CUSTOM_GEN_AI_MODEL", "DEFAULT"] : lower(v)], lower(v.tool_config.embedding_llm_customization.llm_selection.llm_selection_type))))
      )
    ])
    error_message = "must be one of: \"CUSTOM_GEN_AI_ENDPOINT\", \"CUSTOM_GEN_AI_MODEL\", \"DEFAULT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_agent_tools : (
        v.tool_config.generation_llm_customization == null || (v.tool_config.generation_llm_customization.llm_selection == null || (contains([for v in ["CUSTOM_GEN_AI_ENDPOINT", "CUSTOM_GEN_AI_MODEL", "DEFAULT"] : lower(v)], lower(v.tool_config.generation_llm_customization.llm_selection.llm_selection_type))))
      )
    ])
    error_message = "must be one of: \"CUSTOM_GEN_AI_ENDPOINT\", \"CUSTOM_GEN_AI_MODEL\", \"DEFAULT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_agent_tools : (
        v.tool_config.http_endpoint_auth_config == null || (v.tool_config.http_endpoint_auth_config.http_endpoint_auth_sources == null || alltrue([for item in v.tool_config.http_endpoint_auth_config.http_endpoint_auth_sources : (item.http_endpoint_auth_scope_config == null || (contains([for v in ["HTTP_ENDPOINT_API_KEY_AUTH_SCOPE_CONFIG", "HTTP_ENDPOINT_BASIC_AUTH_SCOPE_CONFIG", "HTTP_ENDPOINT_BEARER_AUTH_SCOPE_CONFIG", "HTTP_ENDPOINT_IDCS_AUTH_SCOPE_CONFIG", "HTTP_ENDPOINT_NO_AUTH_SCOPE_CONFIG", "HTTP_ENDPOINT_OCI_AUTH_SCOPE_CONFIG"] : lower(v)], lower(item.http_endpoint_auth_scope_config.http_endpoint_auth_scope_config_type))))]))
      )
    ])
    error_message = "must be one of: \"HTTP_ENDPOINT_API_KEY_AUTH_SCOPE_CONFIG\", \"HTTP_ENDPOINT_BASIC_AUTH_SCOPE_CONFIG\", \"HTTP_ENDPOINT_BEARER_AUTH_SCOPE_CONFIG\", \"HTTP_ENDPOINT_IDCS_AUTH_SCOPE_CONFIG\", \"HTTP_ENDPOINT_NO_AUTH_SCOPE_CONFIG\", \"HTTP_ENDPOINT_OCI_AUTH_SCOPE_CONFIG\""
  }
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_agent_tools : (
        v.tool_config.icl_examples == null || (contains([for v in ["INLINE", "OBJECT_STORAGE_PREFIX"] : lower(v)], lower(v.tool_config.icl_examples.input_location_type)))
      )
    ])
    error_message = "must be one of: \"INLINE\", \"OBJECT_STORAGE_PREFIX\""
  }
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_agent_tools : (
        v.tool_config.reasoning_llm_customization == null || (v.tool_config.reasoning_llm_customization.llm_selection == null || (contains([for v in ["CUSTOM_GEN_AI_ENDPOINT", "CUSTOM_GEN_AI_MODEL", "DEFAULT"] : lower(v)], lower(v.tool_config.reasoning_llm_customization.llm_selection.llm_selection_type))))
      )
    ])
    error_message = "must be one of: \"CUSTOM_GEN_AI_ENDPOINT\", \"CUSTOM_GEN_AI_MODEL\", \"DEFAULT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_agent_tools : (
        v.tool_config.reranking_llm_customization == null || (v.tool_config.reranking_llm_customization.llm_selection == null || (contains([for v in ["CUSTOM_GEN_AI_ENDPOINT", "CUSTOM_GEN_AI_MODEL", "DEFAULT"] : lower(v)], lower(v.tool_config.reranking_llm_customization.llm_selection.llm_selection_type))))
      )
    ])
    error_message = "must be one of: \"CUSTOM_GEN_AI_ENDPOINT\", \"CUSTOM_GEN_AI_MODEL\", \"DEFAULT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.generative_ai_agent_tools : (
        v.tool_config.table_and_column_description == null || (contains([for v in ["INLINE", "OBJECT_STORAGE_PREFIX"] : lower(v)], lower(v.tool_config.table_and_column_description.input_location_type)))
      )
    ])
    error_message = "must be one of: \"INLINE\", \"OBJECT_STORAGE_PREFIX\""
  }
}

