#

{% set primary_user = 'anton' %}

# Extensibility! Though vega doesn't use this architecture yet
primary_user: {{ primary_user }}

# Nimitz data-storage structure
data_dir: {{ '/home/' + primary_user }}
top_level_dirs:
  - .config
  - Documents
  - Downloads
  - Fleet
  - Games
  - Misc
  - Pictures
  - Programming
  - Scripts
