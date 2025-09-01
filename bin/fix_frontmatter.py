#!python3
import os


TOP_LEVEL_KEYS = ["description", "keywords", "date", "title", "summary"]


def main():
    # Walk the content directory looking for  *.md files
    for root, dirs, files in os.walk("content"):
        for file in files:
            if file.endswith(".md"):
                with open(os.path.join(root, file), "r") as f:
                    content = f.read()
                if content.startswith("---"):
                    print(f"Skipping {file}: already has frontmatter")
                    continue
                fixed = fix_frontmatter(content, file)
                if fixed:
                    print(f"Fixed frontmatter in {file}")
                    # Write the output back to the file
                    with open(os.path.join(root, file), "w") as f:
                        f.write(fixed)


def fix_frontmatter(content, file):
    # Split the content into frontmatter and body by finding the first line that
    # starts with "# " which is the first line of the content. Everything before
    # that is frontmatter.
    parts = content.split("\n# ", 1)
    if len(parts) == 1:
        print(f"Skipping {file}: no title found in body")
        return
    frontmatter = parts[0]
    body = parts[1]
    # Transform the frontmatter into valid yaml Hugo frontmatter. Example input:
    # description
    #
    # :   Covers the basics of using LILO to boot Linux and possibly Windows
    #     or other operating systems.
    #
    # keywords
    #
    # :   LILO, Linux
    #
    # Author
    #
    # :   Vince Veselosky
    #
    # Copyright
    #
    # :   © 2011 Vince Veselosky
    #
    # Contact
    #
    # :   <vince@control-escape.com>
    #
    # Date
    #
    # :   2011-06-04T22:51:00-0400

    # Example output:
    # ---
    # description: "Covers the basics of using LILO to boot Linux and possibly Windows or other operating systems."
    # keywords: "LILO, Linux"
    # date: "2011-06-04T22:51:00-0400"
    # params:
    #   author: "Vince Veselosky"
    #   copyright: "© 2011 Vince Veselosky"
    #   contact: "<vince@control-escape.com>"

    # Extract the title from the first line of the body
    title = body.split("\n", 1)[0].strip("# ")

    # Split the frontmatter into lines
    lines = frontmatter.split("\n")
    # Initialize the output
    output = '---\ntype: article\ntitle: "' + title + '"\n'
    # Initialize the params dictionary
    params = {}
    buffer = ""
    for line in lines:
        buffer += line.strip()
        if ":" not in buffer:
            continue
        # Split the line into key and value
        parts = buffer.split(":", 1)
        # Extract the key and value
        key = parts[0].strip().lower()
        value = parts[1].strip()
        # If the key is not in TOP_LEVEL_KEYS, add it to the params dictionary
        if key not in TOP_LEVEL_KEYS:
            params[key] = value
        # Otherwise, add it to the output as key: value
        else:
            output += f'{key}: "{value}"\n'
        buffer = ""
    # Add the params dictionary to the output
    output += "params:\n"
    for key, value in params.items():
        output += f'  {key}: "{value}"\n'

    # Add the body to the output
    output += "---\n# " + body
    return output


if __name__ == "__main__":
    main()
