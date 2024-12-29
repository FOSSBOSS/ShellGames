#!/usr/bin/env python3
'''
Hate whitespace formating? me too!
write python psudo code replacing # with whitespace, so youc an see 
your code formating. 

wont that break when someone comments the code?
lol maybe, but who does that?
'''
import sys

def psudopython(input_file):
    with open(input_file, 'r') as file:
        lines = file.readlines()

    modified_lines = []
    for line in lines:
        modified_line = line.replace('#', '    ')  # Replace "#" with four spaces
        modified_lines.append(modified_line)

    interpreted_code = ''.join(modified_lines)

    # Execute the interpreted code
    try:
        exec(interpreted_code)
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: ",  sys.argv[0] ," <input_filename>")
        sys.exit(1)

    input_file = sys.argv[1]
    print("#!/usr/bin/env python3\n")
    psudopython(input_file)
