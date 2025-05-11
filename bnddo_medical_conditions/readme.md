# Important Item Configuration settings

- An item CANNOT both treat and cure the same condition.
  Example: If "bleeding" is in both `treats` and `cures`, it will only treat and not cure.

- If `selfCure = true`, the `cures` field must contain at least one valid condition.
  Setting `selfCure = true` with `cures = false` will have no effect.

- If `selfTreat = false`, the item can only be used on other players.

- If `requiresDoctor = true`, `requiredJobGrade` must be defined (0 = highest rank).
  Any doctor with a grade LOWER THAN OR EQUAL TO this value will be allowed to use the item.

- `treats` and `cures` must reference valid condition names from your Config.Conditions table.

- `supressTime` is defined in ticks. Each tick = 20 seconds.
  Example: `supressTime = 10` will suppress the condition for 200 seconds.

- `treatmentTime` is in milliseconds. This determines how long the progress bar runs.

- `doctorTreatmentTimeMultiplier` is a decimal value between 0.0 and 1.0.
  A value of 0.5 means doctors perform the treatment in 50% of the normal time.

- If both `treats` and `cures` are set to `false`, the item will do nothing and should be disabled.

- If `active = false`, the item is ignored and cannot be used.

- Use `label` purely for visual purposes (e.g., menus, logs); it has no mechanical effect.


# Important Condition Configuration Settings


- Each condition must have a unique key name (e.g., `bleeding`) and a user-friendly `label`.

- `enabled = true` will activate this condition system-wide. Set to false to disable without removing it from the config.

- `temporary = true` defines whether the condition has a duration or is persistent.
    - If `temporary = true`, it will last for `temporaryDuration` TICKS (1 tick = 20 seconds).
    - If `temporary = false` or omitted, the condition must be removed by treatment or cure logic.

- `damage` sets how much health the player loses each tick while the condition is active.
    - Set to 0 to apply no automatic damage but still trigger condition-related effects.

- `screenEffect` can be a string (effect name) or false. If set, this effect plays each tick the condition is active.

- `effectPriority` determines which condition's screenEffect takes precedence.
    - Lower number = higher priority.
    - Be sure not to reuse the same priority for multiple active conditions with conflicting effects.

- `preventIf` is a list of conditions that *block* this one from being applied.
    - Example: `preventIf = { "bandaged" }` means a bandaged player cannot start bleeding.

- `ignoreIf` defines conditions that make this one mechanically ineffective.
    - Example: `ignoreIf = { "resistance_bleed" }` will allow the condition to apply but disable its effects.

- Make sure all references in `preventIf` and `ignoreIf` point to valid condition keys from the config.

- Effects should be modular and support stacking where appropriate — design with additive/priority logic in mind.

- Use consistent naming and lowercase keys to prevent mismatch issues in condition lookup logic.
