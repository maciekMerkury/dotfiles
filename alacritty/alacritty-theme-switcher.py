#!/bin/env python3
from sys import argv as sysArgs
from sys import stderr

DEBUG_PRINT = False


def get_all_themes() -> list[str]:
    themes: list[str] = []
    lines = open("theme.yml", 'r').readlines()
    for i in range(len(lines)):
        l = lines[i].replace("\n", "")
        if "&" in l:
            themes.append(
                l.split(":")[1].replace(" ", "").replace("&", "").replace("\t", "").replace("\n", "")
            )

    return themes


def get_target_line(text: list[str], line="colors:") -> int:
    target_line = -1
    for i in range(len(text)):
        if line in text[i]:
            target_line = i
            if DEBUG_PRINT:
                print(f"found line {line} at line {target_line}")

    return target_line


def main(args, target_file: str = "theme.yml"):
    if len(args) == 0:
        print("no target theme given", file=stderr)
        exit(1)

    themes = get_all_themes()

    if DEBUG_PRINT:
        print(f"available themes: {themes}")
        print(f"desired theme: {args[0]}")

    if not args[0] in themes:
        print("given theme does not exist in the themes file", file=stderr)
        exit(2)

    # todo: rename the 'file_text' variable to something clearer
    with open(target_file, mode='r') as reader:
        file_text = reader.readlines()

    # finding the line to change in order to apply the desired theme
    target_line = get_target_line(file_text)

    if target_line == -1:
        if DEBUG_PRINT:
            print(f"appending to the file {target_file}")
        with open(target_file, mode='a') as appender:
            appender.write(f"colors: *{args[0]}\n")
    else:
        if DEBUG_PRINT:
            print(f"writing to the file {target_file}")
        with open(target_file, mode='w') as writer:
            file_text[target_line] = f"colors: *{args[0]}\n"
            writer.writelines(file_text)


def is_deb_print_true(args: list[str]) -> bool:
    if args[1] == "True":
        return True
    elif args[1] == "False":
        return False
    else:
        print("args[1] is not a bool", file=stderr)
        exit(1)


if __name__ == "__main__":
    if len(sysArgs) == 2:
        main(sysArgs[1:])
    elif len(sysArgs) == 3:
        DEBUG_PRINT = is_deb_print_true(sysArgs)
        main(sysArgs[2:])
    elif len(sysArgs) == 4:
        DEBUG_PRINT = is_deb_print_true(sysArgs)
        main(sysArgs[3:], target_file=sysArgs[2])
    else:
        print("too few arguments given", file=stderr)
        exit(1)

    if DEBUG_PRINT:
        print("the target file should be update now, but the alacritty.yml file still has to be altered for the "
              "alacritty to reload")
