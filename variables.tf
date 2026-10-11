variable "ssmcontacts_rotations" {
  description = <<EOT
Map of ssmcontacts_rotations, attributes below
Required:
    - contact_ids
    - name
    - time_zone_id
Optional:
    - region
    - start_time
    - tags
    - recurrence (block):
        - daily_settings (optional, block):
            - hour_of_day (required)
            - minute_of_hour (required)
        - monthly_settings (optional, block):
            - day_of_month (required)
            - hand_off_time (optional, block):
                - hour_of_day (required)
                - minute_of_hour (required)
        - number_of_on_calls (required)
        - recurrence_multiplier (required)
        - shift_coverages (optional, block):
            - coverage_times (optional, block):
                - end (optional, block):
                    - hour_of_day (required)
                    - minute_of_hour (required)
                - start (optional, block):
                    - hour_of_day (required)
                    - minute_of_hour (required)
            - map_block_key (required)
        - weekly_settings (optional, block):
            - day_of_week (required)
            - hand_off_time (optional, block):
                - hour_of_day (required)
                - minute_of_hour (required)
EOT

  type = map(object({
    contact_ids  = list(string)
    name         = string
    time_zone_id = string
    region       = optional(string)
    start_time   = optional(string)
    tags         = optional(map(string))
    recurrence = optional(list(object({
      daily_settings = optional(list(object({
        hour_of_day    = number
        minute_of_hour = number
      })))
      monthly_settings = optional(list(object({
        day_of_month = number
        hand_off_time = optional(list(object({
          hour_of_day    = number
          minute_of_hour = number
        })))
      })))
      number_of_on_calls    = number
      recurrence_multiplier = number
      shift_coverages = optional(list(object({
        coverage_times = optional(list(object({
          end = optional(list(object({
            hour_of_day    = number
            minute_of_hour = number
          })))
          start = optional(list(object({
            hour_of_day    = number
            minute_of_hour = number
          })))
        })))
        map_block_key = string
      })))
      weekly_settings = optional(list(object({
        day_of_week = string
        hand_off_time = optional(list(object({
          hour_of_day    = number
          minute_of_hour = number
        })))
      })))
    })))
  }))
}

