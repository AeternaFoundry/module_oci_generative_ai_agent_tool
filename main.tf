resource "oci_generative_ai_agent_tool" "generative_ai_agent_tools" {
  for_each = var.generative_ai_agent_tools

  agent_id       = each.value.agent_id
  compartment_id = each.value.compartment_id
  description    = each.value.description
  defined_tags   = each.value.defined_tags
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags
  metadata       = each.value.metadata

  tool_config {
    agent_endpoint_id = each.value.tool_config.agent_endpoint_id
    dynamic "api_schema" {
      for_each = each.value.tool_config.api_schema != null ? [each.value.tool_config.api_schema] : []
      content {
        api_schema_input_location_type = api_schema.value.api_schema_input_location_type
        bucket                         = api_schema.value.bucket
        content                        = api_schema.value.content
        namespace                      = api_schema.value.namespace
        object                         = api_schema.value.object
      }
    }
    dynamic "database_connection" {
      for_each = each.value.tool_config.database_connection != null ? [each.value.tool_config.database_connection] : []
      content {
        connection_id   = database_connection.value.connection_id
        connection_type = database_connection.value.connection_type
      }
    }
    dynamic "database_schema" {
      for_each = each.value.tool_config.database_schema != null ? [each.value.tool_config.database_schema] : []
      content {
        bucket              = database_schema.value.bucket
        content             = database_schema.value.content
        input_location_type = database_schema.value.input_location_type
        namespace           = database_schema.value.namespace
        prefix              = database_schema.value.prefix
      }
    }
    dialect = each.value.tool_config.dialect
    dynamic "embedding_llm_customization" {
      for_each = each.value.tool_config.embedding_llm_customization != null ? [each.value.tool_config.embedding_llm_customization] : []
      content {
        instruction          = embedding_llm_customization.value.instruction
        llm_hyper_parameters = embedding_llm_customization.value.llm_hyper_parameters
        dynamic "llm_selection" {
          for_each = embedding_llm_customization.value.llm_selection != null ? [embedding_llm_customization.value.llm_selection] : []
          content {
            endpoint_id        = llm_selection.value.endpoint_id
            llm_selection_type = llm_selection.value.llm_selection_type
            model_id           = llm_selection.value.model_id
          }
        }
      }
    }
    dynamic "function" {
      for_each = each.value.tool_config.function != null ? [each.value.tool_config.function] : []
      content {
        description = function.value.description
        name        = function.value.name
        parameters  = function.value.parameters
      }
    }
    dynamic "generation_llm_customization" {
      for_each = each.value.tool_config.generation_llm_customization != null ? [each.value.tool_config.generation_llm_customization] : []
      content {
        instruction          = generation_llm_customization.value.instruction
        llm_hyper_parameters = generation_llm_customization.value.llm_hyper_parameters
        dynamic "llm_selection" {
          for_each = generation_llm_customization.value.llm_selection != null ? [generation_llm_customization.value.llm_selection] : []
          content {
            endpoint_id        = llm_selection.value.endpoint_id
            llm_selection_type = llm_selection.value.llm_selection_type
            model_id           = llm_selection.value.model_id
          }
        }
      }
    }
    dynamic "http_endpoint_auth_config" {
      for_each = each.value.tool_config.http_endpoint_auth_config != null ? [each.value.tool_config.http_endpoint_auth_config] : []
      content {
        dynamic "http_endpoint_auth_sources" {
          for_each = http_endpoint_auth_config.value.http_endpoint_auth_sources != null ? http_endpoint_auth_config.value.http_endpoint_auth_sources : []
          content {
            http_endpoint_auth_scope = http_endpoint_auth_sources.value.http_endpoint_auth_scope
            dynamic "http_endpoint_auth_scope_config" {
              for_each = http_endpoint_auth_sources.value.http_endpoint_auth_scope_config != null ? [http_endpoint_auth_sources.value.http_endpoint_auth_scope_config] : []
              content {
                client_id                            = http_endpoint_auth_scope_config.value.client_id
                http_endpoint_auth_scope_config_type = http_endpoint_auth_scope_config.value.http_endpoint_auth_scope_config_type
                idcs_url                             = http_endpoint_auth_scope_config.value.idcs_url
                key_location                         = http_endpoint_auth_scope_config.value.key_location
                key_name                             = http_endpoint_auth_scope_config.value.key_name
                scope_url                            = http_endpoint_auth_scope_config.value.scope_url
                vault_secret_id                      = http_endpoint_auth_scope_config.value.vault_secret_id
              }
            }
          }
        }
      }
    }
    dynamic "icl_examples" {
      for_each = each.value.tool_config.icl_examples != null ? [each.value.tool_config.icl_examples] : []
      content {
        bucket              = icl_examples.value.bucket
        content             = icl_examples.value.content
        input_location_type = icl_examples.value.input_location_type
        namespace           = icl_examples.value.namespace
        prefix              = icl_examples.value.prefix
      }
    }
    dynamic "knowledge_base_configs" {
      for_each = each.value.tool_config.knowledge_base_configs != null ? each.value.tool_config.knowledge_base_configs : []
      content {
        knowledge_base_id = knowledge_base_configs.value.knowledge_base_id
      }
    }
    model_size = each.value.tool_config.model_size
    dynamic "reasoning_llm_customization" {
      for_each = each.value.tool_config.reasoning_llm_customization != null ? [each.value.tool_config.reasoning_llm_customization] : []
      content {
        instruction          = reasoning_llm_customization.value.instruction
        llm_hyper_parameters = reasoning_llm_customization.value.llm_hyper_parameters
        dynamic "llm_selection" {
          for_each = reasoning_llm_customization.value.llm_selection != null ? [reasoning_llm_customization.value.llm_selection] : []
          content {
            endpoint_id        = llm_selection.value.endpoint_id
            llm_selection_type = llm_selection.value.llm_selection_type
            model_id           = llm_selection.value.model_id
          }
        }
      }
    }
    dynamic "reranking_llm_customization" {
      for_each = each.value.tool_config.reranking_llm_customization != null ? [each.value.tool_config.reranking_llm_customization] : []
      content {
        instruction          = reranking_llm_customization.value.instruction
        llm_hyper_parameters = reranking_llm_customization.value.llm_hyper_parameters
        dynamic "llm_selection" {
          for_each = reranking_llm_customization.value.llm_selection != null ? [reranking_llm_customization.value.llm_selection] : []
          content {
            endpoint_id        = llm_selection.value.endpoint_id
            llm_selection_type = llm_selection.value.llm_selection_type
            model_id           = llm_selection.value.model_id
          }
        }
      }
    }
    runtime_version               = each.value.tool_config.runtime_version
    should_enable_self_correction = each.value.tool_config.should_enable_self_correction
    should_enable_sql_execution   = each.value.tool_config.should_enable_sql_execution
    subnet_id                     = each.value.tool_config.subnet_id
    dynamic "table_and_column_description" {
      for_each = each.value.tool_config.table_and_column_description != null ? [each.value.tool_config.table_and_column_description] : []
      content {
        bucket              = table_and_column_description.value.bucket
        content             = table_and_column_description.value.content
        input_location_type = table_and_column_description.value.input_location_type
        namespace           = table_and_column_description.value.namespace
        prefix              = table_and_column_description.value.prefix
      }
    }
    tool_config_type = each.value.tool_config.tool_config_type
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

