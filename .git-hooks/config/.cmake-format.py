# .cmake-format.py

# General settings
line_width = 80                   # Maximum line width for wrapping
tab_size = 4                       # Size of each indentation level
use_tabchars = False               # Use spaces instead of tabs for indentation

# Casing settings
command_case = 'lower'             # Format commands in lowercase
keyword_case = 'upper'             # Format keywords in uppercase
variable_case = 'unchanged'        # Keep variable names unchanged

# Indentation and layout
always_wrap = []                   # Always wrap certain commands
min_prefix_chars = 4               # Minimum number of prefix characters for aligned arguments
max_prefix_chars = 10              # Maximum prefix characters before unaligned
line_ending = 'unix'               # Unix line endings

# Argument alignment
dangle_parens = True               # Place closing parenthesis on a separate line if needed
dangle_align = 'prefix'            # Align dangling parens with the command prefix
split_args_when_multiline = True   # Split arguments across multiple lines when too long

# List handling
extra_reorder_commands = ['set']   # Commands where items should be reordered
reorder_cmdline_opts = False       # Keep command-line options in their original order

# Other options
separate_ctrl_name_with_space = False  # Separate control statements (like if) with space
enable_markup = True                  # Enable markup formatting for comments
